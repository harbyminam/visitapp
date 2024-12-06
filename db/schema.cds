using { managed } from '@sap/cds/common';

entity Customer {
    key customerId   : String(20);
        customerName : String(200);
        email        : String(100);
        phoneNumber  : String(30);
        to_address   : Association to many Address
                           on to_address.customerId = $self;
        to_orders    : Association to many Order
                           on to_orders.customerId = $self;
        to_Visit     : Association to many Visit_registration
                           on to_Visit.customerId = $self;
}

entity Address {
    key adressId    : String(36);
        customerId  : Association to Customer;
        description : String(50);
        city        : String(50);
        country     : String(4);
        coordinates : String(50);
}

entity Vendor {
    key vendorId     : String(20);
        vendorName   : String(200);
        email        : String(100);
        phoneNumber  : String(30);
        photo        : LargeString;
        to_orders    : Association to many Order
                           on to_orders.vendorId = $self;
        to_Visit     : Association to many Visit_registration
                           on to_Visit.vendorId = $self;
        to_agenda    : Association to many Agenda
                           on to_agenda.vendorId = $self;
        to_customers : Association to many Customer_Vendor
                           on to_customers.vendorId = $self
}

entity Visit_registration {
    key visitId     : UUID;
    key wordayId    : String(36);
    key customerId  : Association to Customer;
    key vendorId    : Association to Vendor;
        AddressId   : String(36);
        observation : LargeString;
        reasonId    : Association to one Reason;
        date        : Timestamp @cds.on.insert : $now;
        status      : String enum {
            Active   = 'A';
            Inactive = 'I';
        };
}

entity Order: managed{
    key orderId          : UUID;
        visitId          : String(36);
        vendorId         : Association to Vendor;
        customerId       : Association to Customer;
        date             : Timestamp @cds.on.insert : $now;
        delivery_address : String(36);
        to_items         : Association to many OrderItem
                               on to_items.orderId = $self;
        status           : String enum {
            Pending;
            InProcess;
            Shipped;
            Delivered;
            Canceled;
        }
}

entity Work_day {
    key wordayId : UUID;
    key vendorId : Association to Vendor;
        date     : Timestamp @cds.on.insert : $now;
        status   : String enum {
            Active   = 'A';
            Inactive = 'I';
        };
}

entity OrderItem : managed{
    key itemId    : UUID;
        orderId   : Association to Order;
        productId : String(100);
        quantity  : Integer;
        unitPrice : Decimal;
        status    : String enum {
            Pending;
            InProcess;
            Shipped;
            Delivered;
            Backordered;
            Cancelled;
            Returned;
            Refunded
        }
}

entity Customer_Vendor : managed{
    key relationshipId : UUID;
        customerId     : Association to Customer;
        vendorId       : Association to Vendor;
        assignmentDate : DateTime @cds.on.insert : $now;
        status         : String enum {
            Active;
            Inactive;
        };
}

entity Agenda {
    key agentId    : UUID;
        customerId : Association to Customer;
        vendorId   : Association to Vendor;
        addressId  : Association to one Address;
        visitDate  : Timestamp;
        note       : LargeString;
        status     : String enum {
            Activa;
            Inactiva;
        }
}

entity Reason : managed{
    key reasonId    : UUID;
        name        : String(200);
        description : LargeString;
}
