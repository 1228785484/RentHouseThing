create table if not exists renthouse.landlord
(
    landlord_id           int auto_increment
        primary key,
    name                  varchar(100)                        not null,
    contact_number        varchar(15)                         not null,
    email                 varchar(100)                        null,
    identification_number varchar(20)                         null,
    created_at            timestamp default CURRENT_TIMESTAMP null
);

create table if not exists renthouse.property
(
    property_id int auto_increment
        primary key,
    landlord_id int                                  null,
    address     varchar(255)                         not null,
    rent_price  decimal(10, 2)                       not null,
    deposit     decimal(10, 2)                       null,
    available   tinyint(1) default 1                 null,
    created_at  timestamp  default CURRENT_TIMESTAMP null,
    constraint property_ibfk_1
        foreign key (landlord_id) references renthouse.landlord (landlord_id)
);

create index landlord_id
    on renthouse.property (landlord_id);

create table if not exists renthouse.tenant
(
    tenant_id             int auto_increment
        primary key,
    name                  varchar(100)                         not null,
    contact_number        varchar(15)                          not null,
    email                 varchar(100)                         null,
    identification_number varchar(20)                          null,
    viewing_demand        tinyint(1) default 0                 null,
    created_at            timestamp  default CURRENT_TIMESTAMP null
);

create table if not exists renthouse.leaseagreement
(
    agreement_id   int auto_increment
        primary key,
    tenant_id      int                                                              null,
    property_id    int                                                              null,
    start_date     date                                                             not null,
    end_date       date                                                             not null,
    monthly_rent   decimal(10, 2)                                                   not null,
    agreement_type varchar(50)                                                      null,
    status         enum ('Active', 'Inactive', 'Expired') default 'Active'          null,
    created_at     timestamp                              default CURRENT_TIMESTAMP null,
    constraint leaseagreement_ibfk_1
        foreign key (tenant_id) references renthouse.tenant (tenant_id),
    constraint leaseagreement_ibfk_2
        foreign key (property_id) references renthouse.property (property_id)
);

create index property_id
    on renthouse.leaseagreement (property_id);

create index tenant_id
    on renthouse.leaseagreement (tenant_id);

