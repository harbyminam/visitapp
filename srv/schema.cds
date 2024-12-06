using {
    Customer,
    Address,
    Vendor,
    Visit_registration,
    Order,
    Work_day,
    OrderItem,
    Customer_Vendor,
    Agenda
} from '../db/schema';


service visit_set {

    entity customer           as projection on Customer;
    entity adress             as projection on Address;
    entity vendor             as projection on Vendor;
    entity visit_registration as projection on Visit_registration;
    entity order              as projection on Order;
    entity work_day           as projection on Work_day;
    entity orderitem          as projection on OrderItem;
    entity customerVendor     as projection on Customer_Vendor;
    entity agenda             as projection on Agenda;
}
