using {visit_set.visit_registration} from '../schema';

annotate visit_set.visit_registration with @(UI: {
    LineItem       : [
        {
            $Type: 'UI.DataField',
            Value: visitId,
            Label: '{i18n>visitId}',
        },
        {
            $Type: 'UI.DataField',
            Value: customerId.customerName,
            Label: '{i18n>customerName}',
        },
        {
            $Type: 'UI.DataField',
            Value: reasonId,
            Label: '{i18n>reasonId}',
        },
        {
            $Type: 'UI.DataField',
            Value: observation,
            Label: '{i18n>observation}',
        },
        {
            $Type: 'UI.DataField',
            Value: date,
            Label: '{i18n>date}',
        },
        {
            $Type: 'UI.DataField',
            Value: status,
            Label: '{i18n>status}',
        },
    ],
    SelectionFields: [
        vendorId.vendorName,
        customerId.customerName,
        date,
        reasonId,
        status
    ],
});

annotate visit_set.visit_registration {
    customerId @(Common: {
        Text : customerId.customerName,
        Label: '{i18n>customerId}',
    }, );
    vendorId   @(Common: {
        Text : vendorId.vendorName,
        Label: '{i18n>vendorId}',
    }, );
};
