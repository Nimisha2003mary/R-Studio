from datetime import date

# ----------------------------
# Vendor Class
# ----------------------------
class Vendor:
    def __init__(self, vendor_id, name, email, phone_number, address):
        self.vendor_id = vendor_id
        self.name = name
        self.email = email
        self.phone_number = phone_number
        self.address = address

# ----------------------------
# Customer Class
# ----------------------------
class Customer:
    def __init__(self, customer_id, name, email, phone_number, billing_address):
        self.customer_id = customer_id
        self.name = name
        self.email = email
        self.phone_number = phone_number
        self.billing_address = billing_address

# ----------------------------
# Invoice Class
# ----------------------------
class Invoice:
    def __init__(self, invoice_id, category, linked_id, template_type, date_issued, due_date,
                 status, total_amount, items, tax_details, payment_terms):
        self.invoice_id = invoice_id
        self.category = category
        self.linked_id = linked_id
        self.template_type = template_type
        self.date_issued = date_issued
        self.due_date = due_date
        self.status = status
        self.total_amount = total_amount
        self.items = items
        self.tax_details = tax_details
        self.payment_terms = payment_terms

# ----------------------------
# Sample Data Function
# ----------------------------
def create_sample_data():
    try:
        vendors = [
            Vendor("V001", "Glow Organics", "glow@vendor.com", "9991112222", "Mumbai"),
            Vendor("V002", "Herbal Skin", "herbal@vendor.com", "9993334444", "Delhi"),
            Vendor("V003", "AyurCure", "ayur@vendor.com", "9995556666", "Bangalore"),
            Vendor("V004", "PureTouch", "pure@vendor.com", "9997778888", "Kolkata"),
            Vendor("V005", "SkinStory", "story@vendor.com", "9990001111", "Chennai"),
            Vendor("V006", "Nature’s Kiss", "kiss@vendor.com", "9998889999", "Pune")
        ]

        customers = [
            Customer("C001", "Nimisha", "nims@gmail.com", "9876543210", "Lucknow"),
            Customer("C002", "Aarti Singh", "aarti@gmail.com", "9867543210", "Delhi"),
            Customer("C003", "Simran Kaur", "simran@gmail.com", "9765432109", "Amritsar"),
            Customer("C004", "Priya Jain", "priya@gmail.com", "9988776655", "Mumbai"),
            Customer("C005", "Riya Sharma", "riya@gmail.com", "9123456789", "Pune"),
            Customer("C006", "Kriti Verma", "kriti@gmail.com", "9000000001", "Chandigarh"),
            Customer("C007", "Megha", "megha@gmail.com", "9555555512", "Noida"),
            Customer("C008", "Sneha Dubey", "sneha@gmail.com", "9111111111", "Indore")
        ]

        invoices = [
            Invoice("INV001", "vendor", "V001", "Standard",
                    date(2025, 4, 1), date(2025, 4, 15), "Unpaid", 1200.0,
                    [{"item": "Vitamin C Serum", "qty": 2, "unit_price": 600, "total": 1200}],
                    {"GST": "18%"}, "Net 15"),
            Invoice("INV002", "vendor", "V002", "Standard",
                    date(2025, 4, 2), date(2025, 4, 16), "Paid", 850.0,
                    [{"item": "Aloe Vera Gel", "qty": 5, "unit_price": 170, "total": 850}],
                    {"GST": "12%"}, "Advance"),
            Invoice("INV003", "vendor", "V003", "Detailed",
                    date(2025, 4, 3), date(2025, 4, 18), "Unpaid", 1500.0,
                    [{"item": "Neem Face Wash", "qty": 3, "unit_price": 500, "total": 1500}],
                    {"VAT": "10%"}, "Net 30"),
            Invoice("INV004", "vendor", "V004", "Minimal",
                    date(2025, 4, 4), date(2025, 4, 19), "Overdue", 600.0,
                    [{"item": "Rose Water Toner", "qty": 6, "unit_price": 100, "total": 600}],
                    {"GST": "5%"}, "Immediate"),
            Invoice("INV005", "vendor", "V005", "Standard",
                    date(2025, 4, 5), date(2025, 4, 20), "Paid", 300.0,
                    [{"item": "Ubtan Powder", "qty": 3, "unit_price": 100, "total": 300}],
                    {"GST": "18%"}, "Net 7"),
            Invoice("INV006", "vendor", "V006", "Custom",
                    date(2025, 4, 6), date(2025, 4, 21), "Unpaid", 1000.0,
                    [{"item": "Multani Mitti Mask", "qty": 4, "unit_price": 250, "total": 1000}],
                    {"VAT": "12%"}, "Net 10")
        ]

        return vendors, customers, invoices

    except Exception as e:
        print("Error while creating sample data:", e)
        return [], [], []

# ----------------------------
# Invoice Generation Template
# ----------------------------
def generate_invoice(invoice):
    try:
        invoice_str = f"\n------ INVOICE ({invoice.invoice_id}) ------\n"
        invoice_str += f"Type: {invoice.category.capitalize()} | Linked ID: {invoice.linked_id}\n"
        invoice_str += f"Template: {invoice.template_type}\n"
        invoice_str += f"Issue Date: {invoice.date_issued} | Due Date: {invoice.due_date}\n"
        invoice_str += f"Status: {invoice.status}\n\nItems:\n"

        for item in invoice.items:
            invoice_str += f"- {item['item']} | Qty: {item['qty']} | Rate: ₹{item['unit_price']} | Total: ₹{item['total']}\n"

        invoice_str += f"\nTotal Amount: ₹{invoice.total_amount}\n"
        invoice_str += f"Tax: {invoice.tax_details}\n"
        invoice_str += f"Payment Terms: {invoice.payment_terms}\n"
        invoice_str += "------------------------------\n"
        return invoice_str
    except Exception as e:
        return f"Error generating invoice: {e}"

# ----------------------------
# Main Execution
# ----------------------------
if __name__ == "__main__":
    vendors, customers, invoices = create_sample_data()

    for invoice in invoices:
        print(generate_invoice(invoice))
