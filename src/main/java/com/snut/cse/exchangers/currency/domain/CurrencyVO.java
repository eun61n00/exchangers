package com.snut.cse.exchangers.currency.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CurrencyVO {

    String unit;
    Double ttb;
    Double tts;

}
