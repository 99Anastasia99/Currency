# frozen_string_literal: true

# rubocop:disable Metrics/ModuleLength

module Currencies
  CURRENCY_WITH_ABBREVIATIONS = {
    australia_dollar: "AUD",
    great_britain_pound: "GBP",
    euro: "EUR",
    japan_yen: "JPY",
    switzerland_franc: "CHF",
    USA_dollar: "USD",
    afghanistan_afghani: "AFN",
    albania_lek: "ALL",
    azerbaijan_new_manat: "AZN",
    algeria_dinar: "DZD",
    angola_kwanza: "AOA",
    argentina_peso: "ARS",
    armenia_dram: "AMD",
    aruba_florin: "AWG",
    austria_schilling: "ATS",
    belgium_franc: "BEF",
    bahamas_dollar: "BSD",
    bahrain_dinar: "BHD",
    bangladesh_taka: "BDT",
    barbados_dollar: "BBD",
    belarus_ruble: "BYN",
    belize_dollar: "BZD",
    bermuda_dollar: "BMD",
    bhutan_ngultrum: "BTN",
    bolivia_boliviano: "BOB",
    bosnia_mark: "BAM",
    botswana_pula: "BWP",
    brazil_real: "BRL",
    brunei_dollar: "BND",
    bulgaria_lev: "BGN",
    burundi_franc: "BIF",
    CFA_franc_BCEAO: "XOF",
    CFA_franc_BEAC: "XAF",
    CFP_franc: "XPF",
    cambodia_riel: "KHR",
    canada_dollar: "CAD",
    cape_verde_escudo: "CVE",
    cayman_islands_dollar: "KYD",
    chili_peso: "CLP",
    china_yuan_Renminbi: "CNY",
    colombia_peso: "COP",
    comoros_franc: "KMF",
    congo_franc: "CDF",
    costa_rica_colon: "CRC",
    croatia_kuna: "HRK",
    cuba_convertible_peso: "CUC",
    cuba_peso: "CUP",
    cyprus_pound: "CYP",
    czech_koruna: "CZK",
    denmark_krone: "DKK",
    djibouti_franc: "DJF",
    dominican_republich_peso: "DOP",
    east_caribbean_dollar: "XCD",
    egypt_pound: "EGP",
    el_salvador_colon: "SVC",
    estonia_kroon: "EEK",
    ethiopia_birr: "ETB",
    falklan_islands_pound: "FKP",
    finland_markka: "FIM",
    fiji_dollar: "FJD",
    gambia_dalasi: "GMD",
    georgia_lari: "GEL",
    germany_mark: "DMK",
    ghana_new_cedi: "GHS",
    gibraltar_pound: "GIP",
    greece_drachma: "GRD",
    guatemala_quetzal: "GTQ",
    quinea_franc: "GNF",
    quyana_dollar: "GYD",
    haiti_gourde: "HTG",
    honduras_lempira: "HNL",
    hong_kong_dollar: "HKD",
    hungary_forint: "HUF",
    iceland_krona: "ISK",
    india_rupee: "INR",
    indonesia_rupiah: "IDR",
    iran_rial: "IRR",
    iraq_dinar: "IQD",
    ireland_pound: "IED",
    israel_new_shekel: "ILS",
    italy_lira: "ITL",
    jamaica_dollar: "JMD",
    jordan_dinar: "JOD",
    kazakhstan_tenge: "KZT",
    kenya_shilling: "KES",
    kuwait_dinar: "KWD",
    kyrgyzstan_som: "KGS",
    laos_kip: "LAK",
    latvia_lats: "LVL",
    lebanon_pound: "LBP",
    lesotho_loti: "LSL",
    liberia_dollar: "LRD",
    libya_dinar: "LYD",
    lithuania_litas: "LTL",
    luxembourg_franc: "LUF",
    macau_pataca: "MOP",
    macedonia_denar: "MKD",
    malagasy_ariary: "MGA",
    malawi_kwacha: "MWK",
    malaysia_ringgit: "MYR",
    maldives_rufiyaa: "MVR",
    malta_lira: "MTL",
    mauritania_ouguiya: "MRO",
    mauritius_rupee: "MUR",
    mexico_peso: "MXN",
    moldova_leu: "MDL",
    mongolia_tugrik: "MNT",
    morocco_dirham: "MAD",
    mozambique_new_metical: "MZN",
    myanmar_kyat: "MMK",
    NL_antilles_guilder: "ANG",
    namibia_dollar: "NAD",
    nepal_rupee: "NPR",
    netherlands_guilder: "NLG",
    new_zealand_dollar: "NZD",
    nicaragua_cordoba_oro: "NIO",
    nigeria_naira: "NGN",
    north_korea_won: "KPW",
    norway_kroner: "NOK",
    oman_rial: "OMR",
    pakistan_rupee: "PKR",
    panama_balboa: "PAB",
    papua_new_guinea_kina: "PGK",
    paraguay_guarani: "PYG",
    peru_nuevo_sol: "PEN",
    philippines_peso: "PHP",
    poland_zloty: "PLN",
    portugal_escudo: "PTE",
    ratar_rial: "QAR",
    romania_new_lei: "RON",
    russia_rouble: "RUB",
    rwanda_franc: "RWF",
    samoa_tala: "WST",
    sao_tome_dobra: "STD",
    saudi_arabia_riyal: "SAR",
    serbia_dinar: "RSD",
    seychelles_rupee: "SCR",
    sierra_leone_leone: "SLL",
    singapore_dollar: "SGD",
    slovakia_koruna: "SKK",
    slovenia_tolar: "SIT",
    solomon_islands_dollar: "SBD",
    somali_shilling: "SOS",
    south_africa_rand: "ZAR",
    south_korea_won: "KRW",
    spain_peseta: "ESP",
    sri_lanka_rupee: "LKR",
    st_helena_pound: "SHP",
    sudan_pound: "SDG",
    suriname_dollar: "SRD",
    swaziland_lilangeni: "SZL",
    sweden_krona: "SEK",
    syria_pound: "SYP",
    taiwan_dollar: "TWD",
    tanzania_shilling: "TZS",
    thailand_baht: "THB",
    tonga_paanga: "TOP",
    trinidad_tobago_dollar: "TTD",
    tunisia_dinar: "TND",
    turkish_new_lira: "TRY",
    turkmenistan_manat: "TMM",
    uganda_shilling: "UGX",
    ukraine_hryvnia: "UAH",
    uruguay_peso: "UYU",
    united_arab_emirates_dirham: "AED",
    vanuatu_vatu: "VUV",
    venezuela_bolivar: "VEB",
    vietnam_dong: "VND",
    yemen_rial: "YER",
    zambia_kwacha: "ZMK",
    zimbabwe_dollar: "ZWD"
  }.freeze
end

# rubocop:enable Metrics/ModuleLength
