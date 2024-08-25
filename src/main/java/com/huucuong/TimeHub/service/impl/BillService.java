package com.huucuong.TimeHub.service.impl;

import java.util.List;
import java.util.stream.Stream;

import com.huucuong.TimeHub.domain.Order;
import com.huucuong.TimeHub.domain.OrderDetail;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import java.io.*;
import org.springframework.core.io.ResourceLoader;

import org.springframework.stereotype.Service;

import jakarta.servlet.ServletContext;

@Service
public class BillService {

    private final ServletContext servletContext;
    private final OrderService orderService;

    public BillService(
            ResourceLoader resourceLoader,
            OrderService orderService,
            ServletContext servletContext) {
        this.servletContext = servletContext;
        this.orderService = orderService;
    }

    public void generatePdf(Long id) throws DocumentException, IOException {
        // get order information
        Order order = this.orderService.findById(id);
        List<OrderDetail> orderDetails = this.orderService.findByOrderId(id);

        Document document = new Document();
        String rootPath = this.servletContext.getRealPath("/resources/bill");
        File dir = new File(rootPath);
        if (!dir.exists())
            dir.mkdirs();

        // Create the file on server
        String finalName = "bill-" + id + ".pdf";
        File serverFile = new File(dir.getAbsolutePath() + File.separator + finalName);

        PdfWriter.getInstance(document, new FileOutputStream(serverFile));

        document.open();

        Font font = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 16, BaseColor.BLACK);
        Chunk chunk = new Chunk("INVOICE", font);

        document.add(new Paragraph(chunk));
        document.add(new Paragraph("Date: " + order.getCreatedAt()));
        document.add(new Paragraph("Name: " + order.getFullName()));
        document.add(new Paragraph("Total Price (include shipping):" + order.getTotalMoney() + "$"));

        // add table detail order
        PdfPTable table = new PdfPTable(5);
        addTableHeader(table);
        addRows(table, orderDetails);
        table.setSpacingBefore(40f);
        table.setSpacingAfter(40f);
        document.add(table);
        document.add(new Paragraph(
                "Thank you for your purchase! We appreciate your support and hope you enjoy your new item!"));
        document.close();
    }

    private void addTableHeader(PdfPTable table) {
        Stream.of("Product", "Name", "Price", "Quantity", "Total")
                .forEach(columnTitle -> {
                    PdfPCell header = new PdfPCell();
                    header.setBackgroundColor(BaseColor.LIGHT_GRAY);
                    header.setBorderWidth(2);
                    header.setPhrase(new Phrase(columnTitle));
                    table.addCell(header);
                });
    }

    private void addRows(PdfPTable table, List<OrderDetail> orderDetails) {
        for (OrderDetail orderDetail : orderDetails) {

            try {
                String rootPath = this.servletContext.getRealPath("/resources/images/product");
                String imageFile = orderDetail.getProduct().getThumbnail();
                File finalImageName = new File(rootPath + File.separator + imageFile);

                Image img = Image.getInstance(finalImageName.getAbsolutePath());
                img.scaleToFit(60, 60);

                PdfPCell imageCell = new PdfPCell(img);
                imageCell.setPadding(10);
                table.addCell(imageCell);

            } catch (Exception e) {
                e.printStackTrace();
            }
            table.addCell(orderDetail.getProduct().getName());
            table.addCell(orderDetail.getProduct().getPrice() + "");
            table.addCell(orderDetail.getNumberOfProducts() + "");
            table.addCell(orderDetail.getTotalMoney() + "");
        }

    }
}
