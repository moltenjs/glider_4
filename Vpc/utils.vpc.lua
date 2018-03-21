

function rectIntersect x0, x1, y0, y1, boxx0, boxx1, boxy0, boxy1
    if (x0 >= boxx1 or y0 >= boxy1)  then
        -- it's way outside on the right or bottom
        return 0 -- no overlap
     else if (x1 < boxx0 or y1 < boxy0)  then
        -- it's way outside on the left or top
        return 0 -- no overlap
     else if (x0 >= boxx0 and x1 <= boxx1 and y0 >= boxy0 and y1 <= boxy1)  then
        return 1 -- CompletelyCovers;
     else if (boxx0 >= x0 and boxx1 <= x1 and boxy0 >= y0 and boxy1 <= y1)  then
        return 2 -- CompletelyWithin;
     else
        return 3 -- PartialOverlap;
    end if
end rectIntersect

function getCollideResult objtypename, isOn, amount, extra
    put "" into resultpt1
    put "" into resultpt2
    put "/" & objtypename & "/" into objtypenametest
    if objtypenametest is in "/table/shelf/books/cabnet/obsRct/drip/toastr/ball/fshBwl/basket/macTsh/" then
        put "crashIt" into resultpt1
        return resultpt1 & "|" & resultpt2
    end if
            
    if objtypename == "extRct" then
        put "moveIt" into resultpt1
        put amount into resultpt2
    else if objtypename == "flrVnt" then
        put "liftIt" into resultpt1
    else if objtypename == "celVnt" then
        put "dropIt" into resultpt1
    else if objtypename == "celDct" then
        if isOn is 1 then
            put "dropIt" into resultpt1
        else
            put "moveIt" into resultpt1
            put extra into resultpt2
        end if
    else if objtypename == "candle" then
        put "burnIt" into resultpt1
    else if objtypename == "lftFan" then
        if isOn is 1 then
            put "turnItLeft" into resultpt1
        else
            put "ignoreIt" into resultpt1
        end if
    else if objtypename == "ritFan" then
        if isOn is 1 then
            put "turnItRight" into resultpt1
        else
            put "ignoreIt" into resultpt1
        end if
    else if objtypename == "clock" then
        if isOn is 1 then
            put "getitem_awardIt" into resultpt1
            put amount into resultpt2
        end if
    else if objtypename == "paper" then
        if isOn is 1 then
            put "getitem_extraIt" into resultpt1
            put amount into resultpt2
        end if
    else if objtypename == "grease" then
        if isOn is 1 then
            put "spillIt" into resultpt1
        else
            put "slideIt" into resultpt1
        end if
    else if objtypename == "bnsRct" then
        if isOn is 1 then
            put "trickIt" into resultpt1
            put amount into resultpt2
        end if
    else if objtypename == "battry" then
        if isOn is 1 then
            put "getitem_energizeIt" into resultpt1
            put amount into resultpt2
        end if
    else if objtypename == "rbrBnd" then
        if isOn is 1 then
            put "getitem_bandIt" into resultpt1
            put amount into resultpt2
        end if
    else if objtypename == "litSwt" then
        put "lightIt" into resultpt1
    else if objtypename == "outlet" then
        put "zapIt" into resultpt1
    else if objtypename == "thermo" then
        put "airOnIt" into resultpt1
    else if objtypename == "shredr" then
        if isOn is 1 then
            put "shredIt" into resultpt1
        else
            put "ignoreIt" into resultpt1
        end if
    else if objtypename == "pwrSwt" then
        put "toggleIt" into resultpt1
        put amount into resultpt2 -- 	{object# linked to}
    else if objtypename == "guitar" then
        beep
        put "playIt" into resultpt1
        put "0" into resultpt2
    else if objtypename == "upStar" then
        put "ascendIt" into resultpt1
        put amount into resultpt2 -- {room # linked to}
    else if objtypename == "dnStar" then
        put "descendIt" into resultpt1
        put amount into resultpt2 -- {room # linked to}
    else
        put "ignoreIt" into resultpt1
    end if
    return resultpt1 & "|" & resultpt2
end getCollideResult

on initSpriteConstantsAndLoadGameData
    global sprites_ventpatternx, sprites_ventpatterny
    put 73 into sprites_ventpatternx -- not ready yet
    put 72 into sprites_ventpatterny

    global sprites_shadoRght, sprites_shadoLft, sprites_right_forward, sprites_right_tipped, sprites_left_forward, sprites_left_tipped
    global sprites_turn_endpoint, sprites_right_forward2, sprites_right_tipped2, sprites_left_forward2, sprites_left_tipped2, sprites_turn_endpoint2
    global sprites_burnrght1, sprites_burnrght2, sprites_burnlft1, sprites_burnlft2, sprites_alldeadrght, sprites_alldeadlft
    global sprites_celVnt, sprites_celDct, sprites_flrVnt, sprites_paper, sprites_toastr, sprites_toast1
    global sprites_toast2, sprites_toast3, sprites_toast4, sprites_toast5, sprites_toast6, sprites_teaKtl
    global sprites_lftFan, sprites_ritFan, sprites_table, sprites_shredr, sprites_books, sprites_clock
    global sprites_candle, sprites_rbrBnd, sprites_ball, sprites_fshBwl, sprites_fish1, sprites_fish2
    global sprites_fish3, sprites_fish4, sprites_grease, sprites_greasefall1, sprites_greasefall2, sprites_litSwt
    global sprites_thermo, sprites_outlet, sprites_outletspark1, sprites_outletspark2, sprites_pwrSwt, sprites_guitar
    global sprites_drip, sprites_shelf, sprites_basket, sprites_paintg, sprites_battry, sprites_macTsh
    global sprites_upStar, sprites_dnStar, sprites_candleflame1, sprites_candleflame2, sprites_candleflame3, sprites_drop1
    global sprites_drop2, sprites_drop3, sprites_drop4, sprites_drop5
    put 2 into sprites_shadoRght
    put 3 into sprites_shadoLft
    put 4 into sprites_right_forward
    put 5 into sprites_right_tipped
    put 6 into sprites_left_forward
    put 7 into sprites_left_tipped
    put 8 into sprites_turn_endpoint
    put 9 into sprites_right_forward2
    put 10 into sprites_right_tipped2
    put 11 into sprites_left_forward2
    put 12 into sprites_left_tipped2
    put 13 into sprites_turn_endpoint2
    put 14 into sprites_burnrght1
    put 15 into sprites_burnrght2
    put 16 into sprites_burnlft1
    put 17 into sprites_burnlft2
    put 18 into sprites_alldeadrght
    put 19 into sprites_alldeadlft
    put 20 into sprites_celVnt
    put 21 into sprites_celDct
    put 22 into sprites_flrVnt
    put 23 into sprites_paper
    put 24 into sprites_toastr
    put 25 into sprites_toast1
    put 26 into sprites_toast2
    put 27 into sprites_toast3
    put 28 into sprites_toast4
    put 29 into sprites_toast5
    put 30 into sprites_toast6
    put 31 into sprites_teaKtl
    put 32 into sprites_lftFan
    put 33 into sprites_ritFan
    put 34 into sprites_table
    put 35 into sprites_shredr
    put 36 into sprites_books
    put 37 into sprites_clock
    put 38 into sprites_candle
    put 39 into sprites_rbrBnd
    put 40 into sprites_ball
    put 41 into sprites_fshBwl
    put 42 into sprites_fish1
    put 43 into sprites_fish2
    put 44 into sprites_fish3
    put 45 into sprites_fish4
    put 46 into sprites_grease
    put 47 into sprites_greasefall1
    put 48 into sprites_greasefall2
    put 49 into sprites_litSwt
    put 50 into sprites_thermo
    put 51 into sprites_outlet
    put 52 into sprites_outletspark1
    put 53 into sprites_outletspark2
    put 54 into sprites_pwrSwt
    put 55 into sprites_guitar
    put 56 into sprites_drip
    put 57 into sprites_shelf
    put 58 into sprites_basket
    put 59 into sprites_paintg
    put 60 into sprites_battry
    put 61 into sprites_macTsh
    put 62 into sprites_upStar
    put 63 into sprites_dnStar
    put 64 into sprites_candleflame1
    put 65 into sprites_candleflame2
    put 66 into sprites_candleflame3
    put 67 into sprites_drop1
    put 68 into sprites_drop2
    put 69 into sprites_drop3
    put 70 into sprites_drop4
    put 71 into sprites_drop5

    
    global lvlData, lvlObjects
    put "Welcome...|5|0|1|0|0|0|0" into line 1 of lvlData
    put "Top of the reading list|7|1|1|0|0|0|0" into line 2 of lvlData
    put "Under Me!|5|1|1|0|0|0|0" into line 3 of lvlData
    put "Looking at you...|6|1|1|0|0|0|0" into line 4 of lvlData
    put "You're invited...|6|1|1|2|1|1|0" into line 5 of lvlData
    put "Jane be nimble...|5|1|1|1|1|1|0" into line 6 of lvlData
    put "Hmm... a tall cabinet|7|1|1|0|0|0|0" into line 7 of lvlData
    put "Timing is the key...|9|1|1|0|0|0|0" into line 8 of lvlData
    put "More enemies...|8|1|1|0|1|2|0" into line 9 of lvlData
    put "Up a Down Staircase|4|1|1|1|1|1|0" into line 10 of lvlData
    put "Still on this floor...|9|1|1|0|0|0|2" into line 11 of lvlData
    put "Deeper still...|3|1|0|1|2|0|0" into line 12 of lvlData
    put "What, a bombshelter?|11|0|1|0|0|0|0" into line 13 of lvlData
    put "Power station...|7|1|1|1|1|0|2" into line 14 of lvlData
    put "This is the basement|6|1|1|0|0|0|0" into line 15 of lvlData
    put "Nothing here...|4|1|1|0|0|0|2" into line 16 of lvlData
    put "The Looking Glass|3|1|0|0|0|0|0" into line 17 of lvlData
    put "Welcome, 2nd Floor|7|0|1|0|0|0|0" into line 18 of lvlData
    put "Zis Room|11|1|1|0|0|0|0" into line 19 of lvlData
    put "This Old House...|6|1|1|0|0|0|0" into line 20 of lvlData
    put "The North Room|9|1|1|0|0|0|0" into line 21 of lvlData
    put "Windtunnels|8|1|1|0|0|0|0" into line 22 of lvlData
    put "Noisy Kids!|5|1|1|0|0|0|0" into line 23 of lvlData
    put "LeadFish|8|1|1|0|0|0|0" into line 24 of lvlData
    put "Air Steps|7|1|1|0|0|0|0" into line 25 of lvlData
    put "Fan Fun!|9|1|1|0|0|0|0" into line 26 of lvlData
    put "Stormy Weather...|10|1|1|0|0|0|2" into line 27 of lvlData
    put "Slippery when greasy...|7|1|1|0|0|0|0" into line 28 of lvlData
    put "Turn me on...|6|1|1|0|0|0|1" into line 29 of lvlData
    put "Finally!!!|6|1|1|0|0|0|0" into line 30 of lvlData
    put "Tempted...|7|1|1|0|0|0|0" into line 31 of lvlData
    put "Look Familiar?|6|1|0|0|0|0|0" into line 32 of lvlData
    put "You found me!|7|0|1|0|0|0|0" into line 33 of lvlData
    put "Welcome to Floor 3|6|1|1|1|2|1|0" into line 34 of lvlData
    put "A toaster?  Here?|8|1|1|0|0|0|0" into line 35 of lvlData
    put "The galley...|6|1|1|0|1|0|0" into line 36 of lvlData
    put "Wow - High Shelf!|10|1|1|0|0|0|0" into line 37 of lvlData
    put "Love these Candles...|10|1|1|0|0|0|0" into line 38 of lvlData
    put "Windy Room...|10|1|1|2|2|0|0" into line 39 of lvlData
    put "Monty Hall|11|1|0|0|0|0|0" into line 40 of lvlData
    put "" into line 1 of lvlObjects
    put "flrVnt|8|69|325|117|338|44|0|0|table|1|186|223|356|232|0|0|0|flrVnt|8|421|325|469|338|44|0|0|macTsh|" after line 1 of lvlObjects
    put "43|186|165|231|223|0|0|0|clock|16|322|194|354|223|500|0|0" after line 1 of lvlObjects
    put "" into line 2 of lvlObjects
    put "flrVnt|8|60|325|108|338|44|0|0|shelf|2|181|112|368|119|0|0|0|books|3|183|58|247|113|0|0|0|flrVnt|8|3" after line 2 of lvlObjects
    put "94|325|442|338|44|0|0|clock|16|336|84|368|113|600|0|0|books|3|245|58|309|113|0|0|0|paintg|40|45|80|1" after line 2 of lvlObjects
    put "47|173|0|0|0" after line 2 of lvlObjects
    put "" into line 3 of lvlObjects
    put "flrVnt|8|53|325|101|338|44|0|0|table|1|209|178|408|187|0|0|0|flrVnt|8|345|325|393|338|208|0|0|flrVnt" after line 3 of lvlObjects
    put "|8|453|325|501|338|44|0|0|clock|16|211|149|243|178|700|0|0" after line 3 of lvlObjects
    put "" into line 4 of lvlObjects
    put "flrVnt|8|47|325|95|338|44|0|0|cabnet|4|121|220|312|318|0|0|0|flrVnt|8|337|325|385|338|44|0|0|shelf|2" after line 4 of lvlObjects
    put "|206|87|306|94|0|0|0|battry|20|291|63|309|89|50|0|0|mirror|41|13|61|182|207|0|0|0" after line 4 of lvlObjects
    put "" into line 5 of lvlObjects
    put "flrVnt|8|45|325|93|338|44|0|0|table|1|159|218|325|227|0|0|0|flrVnt|8|423|325|471|338|44|0|0|clock|16" after line 5 of lvlObjects
    put "|157|189|189|218|800|0|0|cabnet|4|260|37|383|103|0|0|0|window|37|20|73|141|224|0|0|0" after line 5 of lvlObjects
    put "" into line 6 of lvlObjects
    put "flrVnt|8|38|325|86|338|44|0|0|table|1|104|224|384|233|0|0|0|candle|11|215|203|247|224|57|0|0|flrVnt|" after line 6 of lvlObjects
    put "8|434|325|482|338|44|0|0|books|3|264|170|328|225|0|0|0" after line 6 of lvlObjects
    put "" into line 7 of lvlObjects
    put "flrVnt|8|58|325|106|338|44|0|0|celDct|10|37|24|85|37|57|7|0|celDct|10|388|24|436|37|109|7|1|cabnet|4" after line 7 of lvlObjects
    put "|167|120|357|318|0|0|0|flrVnt|8|446|325|494|338|44|0|0|paper|17|291|99|339|120|1500|0|0|bnsRct|19|25" after line 7 of lvlObjects
    put "6|88|288|120|1500|0|0" after line 7 of lvlObjects
    put "" into line 8 of lvlObjects
    put "table|1|154|237|284|246|0|0|0|shelf|2|268|144|418|151|0|0|0|clock|16|270|116|302|145|1000|0|0|outlet" after line 8 of lvlObjects
    put "|25|255|191|287|216|300|0|0|flrVnt|8|84|325|132|338|44|0|0|flrVnt|8|446|325|494|338|44|0|0|books|3|3" after line 8 of lvlObjects
    put "52|91|416|146|0|0|0|guitar|29|296|153|360|323|0|0|0|bnsRct|19|353|57|417|89|1000|0|0" after line 8 of lvlObjects
    put "" into line 9 of lvlObjects
    put "celVnt|9|191|24|239|36|193|0|0|flrVnt|8|56|325|104|338|44|0|0|flrVnt|8|382|325|430|338|44|0|0|books|" after line 9 of lvlObjects
    put "3|111|141|175|196|0|0|0|cabnet|4|251|263|351|323|0|0|0|cabnet|4|114|194|250|325|0|0|0|bnsRct|19|376|" after line 9 of lvlObjects
    put "35|440|67|1000|0|0|clock|16|219|165|251|194|1000|0|0" after line 9 of lvlObjects
    put "" into line 10 of lvlObjects
    put "upStar|44|224|54|385|308|18|0|0|flrVnt|8|31|325|79|338|44|0|0|flrVnt|8|275|325|323|338|44|0|0|table|" after line 10 of lvlObjects
    put "1|108|228|219|237|0|0|0" after line 10 of lvlObjects
    put "" into line 11 of lvlObjects
    put "shelf|2|93|140|195|147|0|0|0|shelf|2|303|129|488|136|0|0|0|books|3|333|76|397|131|0|0|0|flrVnt|8|20|" after line 11 of lvlObjects
    put "325|68|338|44|0|0|flrVnt|8|412|325|460|338|161|0|0|clock|16|206|149|238|178|2000|0|0|table|1|138|221" after line 11 of lvlObjects
    put "|267|230|0|0|0|litSwt|24|119|97|137|123|0|0|0|paper|17|439|109|487|130|2000|0|0" after line 11 of lvlObjects
    put "" into line 12 of lvlObjects
    put "dnStar|45|149|54|310|308|15|0|0|flrVnt|8|24|325|72|338|44|0|0|paintg|40|26|69|128|162|0|0|0" after line 12 of lvlObjects
    put "" into line 13 of lvlObjects
    put "cabnet|4|34|216|96|325|0|0|0|ritFan|13|51|163|86|217|157|0|1|flrVnt|8|127|325|175|338|44|0|0|cabnet|" after line 13 of lvlObjects
    put "4|174|264|481|328|0|0|0|grease|18|171|236|203|265|478|0|1|clock|16|431|236|463|265|3000|0|0|paper|17" after line 13 of lvlObjects
    put "|381|244|429|265|2000|0|0|battry|20|359|240|377|266|80|0|0|rbrBnd|21|321|242|353|265|4|0|0|clock|16|" after line 13 of lvlObjects
    put "289|236|321|265|1000|0|0|battry|20|271|240|289|266|40|0|0" after line 13 of lvlObjects
    put "" into line 14 of lvlObjects
    put "outlet|25|220|139|252|164|80|0|0|litSwt|24|293|139|311|165|0|0|0|flrVnt|8|50|325|98|338|44|0|0|outle" after line 14 of lvlObjects
    put "t|25|352|141|384|166|120|0|0|celDct|10|46|24|94|37|98|14|0|flrVnt|8|435|325|483|338|44|0|0|celDct|10" after line 14 of lvlObjects
    put "|398|24|446|37|141|14|1" after line 14 of lvlObjects
    put "" into line 15 of lvlObjects
    put "upStar|44|155|54|316|308|12|0|0|table|1|25|263|150|272|0|0|0|candle|11|111|243|143|264|44|0|0|flrVnt" after line 15 of lvlObjects
    put "|8|421|325|469|338|44|0|0|shelf|2|332|167|413|174|0|0|0|lftFan|12|371|113|406|168|140|0|1" after line 15 of lvlObjects
    put "" into line 16 of lvlObjects
    put "litSwt|24|172|205|190|231|0|0|0|drip|32|237|192|253|205|320|120|0|table|1|13|230|113|239|0|0|0|ritFa" after line 16 of lvlObjects
    put "n|13|12|177|47|231|512|0|1" after line 16 of lvlObjects
    put "" into line 17 of lvlObjects
    put "flrVnt|8|31|325|79|338|44|0|0|extRct|5|382|111|430|246|24|0|0|mirror|41|359|84|451|270|0|0|0" after line 17 of lvlObjects
    put "" into line 18 of lvlObjects
    put "dnStar|45|187|54|348|308|10|0|0|flrVnt|8|248|325|296|338|44|0|0|basket|42|97|247|160|318|0|0|0|table" after line 18 of lvlObjects
    put "|1|358|230|458|239|0|0|0|clock|16|426|202|458|231|1000|0|0|bnsRct|19|377|240|441|272|1000|0|0|paintg" after line 18 of lvlObjects
    put "|40|384|66|486|159|0|0|0" after line 18 of lvlObjects
    put "" into line 19 of lvlObjects
    put "flrVnt|8|11|325|59|338|44|0|0|celDct|10|67|24|115|37|305|19|1|shelf|2|155|151|255|158|0|0|0|shelf|2|" after line 19 of lvlObjects
    put "326|161|388|168|0|0|0|books|3|325|107|389|162|0|0|0|table|1|262|223|391|232|0|0|0|flrVnt|8|257|325|3" after line 19 of lvlObjects
    put "05|338|255|0|0|flrVnt|8|405|325|453|338|44|0|0|bnsRct|19|324|171|356|203|5000|0|0|paper|17|208|131|2" after line 19 of lvlObjects
    put "56|152|1000|0|0|bnsRct|19|258|142|322|174|1000|0|0" after line 19 of lvlObjects
    put "" into line 20 of lvlObjects
    put "flrVnt|8|38|325|86|338|44|0|0|celDct|10|37|24|85|37|57|19|0|cabnet|4|162|199|275|323|0|0|0|clock|16|" after line 20 of lvlObjects
    put "155|171|187|200|1000|0|0|flrVnt|8|277|325|325|338|44|0|0|drip|32|386|38|402|51|318|120|0" after line 20 of lvlObjects
    put "" into line 21 of lvlObjects
    put "flrVnt|8|60|325|108|338|44|0|0|shelf|2|200|96|361|103|0|0|0|pwrSwt|28|158|197|176|223|5|0|0|shelf|2|" after line 21 of lvlObjects
    put "157|185|257|192|0|0|0|shredr|27|260|184|324|208|0|0|1|rbrBnd|21|198|73|230|96|3|0|0|cabnet|4|376|75|" after line 21 of lvlObjects
    put "480|183|0|0|0|flrVnt|8|363|325|411|338|210|0|0|bnsRct|19|213|193|245|225|1000|0|0" after line 21 of lvlObjects
    put "" into line 22 of lvlObjects
    put "flrVnt|8|63|325|111|338|44|0|0|shelf|2|173|115|422|122|0|0|0|ritFan|13|182|189|217|243|512|0|1|lftFa" after line 22 of lvlObjects
    put "n|12|388|60|423|115|227|0|1|paper|17|345|94|393|115|1000|0|0|flrVnt|8|443|325|491|338|44|0|0|pwrSwt|" after line 22 of lvlObjects
    put "28|410|126|428|152|4|0|0|cabnet|4|172|242|363|327|0|0|0" after line 22 of lvlObjects
    put "" into line 23 of lvlObjects
    put "flrVnt|8|42|325|90|338|44|0|0|table|1|146|222|270|231|0|0|0|ball|34|207|190|239|222|44|0|0|ball|34|2" after line 23 of lvlObjects
    put "90|293|322|325|44|0|0|flrVnt|8|375|325|423|338|44|0|0" after line 23 of lvlObjects
    put "" into line 24 of lvlObjects
    put "flrVnt|8|58|325|106|338|44|0|0|cabnet|4|110|161|221|321|0|0|0|table|1|226|226|326|235|0|0|0|flrVnt|8" after line 24 of lvlObjects
    put "|420|325|468|338|44|0|0|rbrBnd|21|294|204|326|227|4|0|0|fshBwl|35|226|198|258|227|44|120|0|paper|17|" after line 24 of lvlObjects
    put "177|141|225|162|1000|0|0|books|3|113|107|177|162|0|0|0" after line 24 of lvlObjects
    put "" into line 25 of lvlObjects
    put "flrVnt|8|41|325|89|338|215|0|0|table|1|57|188|227|197|0|0|0|clock|16|181|161|213|190|1000|0|0|flrVnt" after line 25 of lvlObjects
    put "|8|241|325|289|338|128|0|0|table|1|302|231|412|240|0|0|0|drip|32|215|38|231|51|324|120|0|flrVnt|8|45" after line 25 of lvlObjects
    put "9|325|507|338|44|0|0" after line 25 of lvlObjects
    put "" into line 26 of lvlObjects
    put "shelf|2|32|186|294|193|0|0|0|ritFan|13|42|133|77|187|341|0|0|flrVnt|8|373|325|421|338|154|0|0|pwrSwt" after line 26 of lvlObjects
    put "|28|120|99|138|125|2|0|0|lftFan|12|458|202|493|257|88|0|0|shelf|2|431|256|511|263|0|0|0|pwrSwt|28|48" after line 26 of lvlObjects
    put "6|156|504|182|5|0|0|paper|17|65|307|113|328|1000|0|0|paper|17|112|307|160|328|1000|0|0" after line 26 of lvlObjects
    put "" into line 27 of lvlObjects
    put "flrVnt|8|13|325|61|338|44|0|0|flrVnt|8|227|325|275|338|44|0|0|cabnet|4|86|198|215|321|0|0|0|clock|16" after line 27 of lvlObjects
    put "|92|170|124|199|1000|0|0|litSwt|24|385|162|403|188|0|0|0|books|3|438|157|502|212|0|0|0|flrVnt|8|372|" after line 27 of lvlObjects
    put "325|420|338|217|0|0|table|1|375|210|509|219|0|0|0|celVnt|9|277|24|325|36|305|0|0|window|37|224|84|35" after line 27 of lvlObjects
    put "4|236|0|0|0" after line 27 of lvlObjects
    put "" into line 28 of lvlObjects
    put "flrVnt|8|24|325|72|338|44|0|0|cabnet|4|84|188|393|321|0|0|0|grease|18|82|159|114|188|392|0|1|ball|34" after line 28 of lvlObjects
    put "|202|157|234|189|96|0|0|clock|16|397|170|429|199|1000|0|0|flrVnt|8|424|325|472|338|44|0|0|paintg|40|" after line 28 of lvlObjects
    put "259|62|361|155|0|0|0" after line 28 of lvlObjects
    put "" into line 29 of lvlObjects
    put "guitar|29|131|151|195|321|0|0|0|thermo|26|215|170|233|197|0|0|0|flrVnt|8|41|325|89|338|44|0|0|flrVnt" after line 29 of lvlObjects
    put "|8|269|325|317|338|44|0|0|shelf|2|354|84|419|91|0|0|0|rbrBnd|21|357|62|389|85|2|0|0" after line 29 of lvlObjects
    put "" into line 30 of lvlObjects
    put "fshBwl|35|168|171|200|200|44|80|0|cabnet|4|279|62|486|141|0|0|0|flrVnt|8|327|325|375|338|162|0|0|flr" after line 30 of lvlObjects
    put "Vnt|8|19|325|67|338|44|0|0|outlet|25|244|159|276|184|80|0|0|mirror|41|88|58|179|160|0|0|0" after line 30 of lvlObjects
    put "" into line 31 of lvlObjects
    put "upStar|44|60|54|221|308|34|0|0|cabnet|4|237|71|361|325|0|0|0|table|1|417|221|511|230|0|0|0|flrVnt|8|" after line 31 of lvlObjects
    put "365|325|413|338|44|0|0|paper|17|416|201|464|222|1000|0|0|rbrBnd|21|480|199|512|222|5|0|0|flrVnt|8|10" after line 31 of lvlObjects
    put "5|325|153|338|44|0|0" after line 31 of lvlObjects
    put "" into line 32 of lvlObjects
    put "upStar|44|30|54|191|308|35|0|0|flrVnt|8|91|325|139|338|44|0|0|cabnet|4|217|219|426|320|0|0|0|candle|" after line 32 of lvlObjects
    put "11|222|199|254|220|74|0|0|battry|20|408|195|426|221|40|0|0|flrVnt|8|426|325|474|338|44|0|0" after line 32 of lvlObjects
    put "" into line 33 of lvlObjects
    put "flrVnt|8|59|325|107|338|44|0|0|celDct|10|56|24|104|37|305|34|0|flrVnt|8|438|325|486|338|44|0|0|cabne" after line 33 of lvlObjects
    put "t|4|321|137|431|324|0|0|0|table|1|202|238|316|247|0|0|0|clock|16|319|109|351|138|1000|0|0|paper|17|2" after line 33 of lvlObjects
    put "04|218|252|239|1000|0|0" after line 33 of lvlObjects
    put "" into line 34 of lvlObjects
    put "dnStar|45|139|54|300|308|31|0|0|flrVnt|8|209|325|257|338|44|0|0|celDct|10|65|24|113|37|305|34|1|shel" after line 34 of lvlObjects
    put "f|2|321|188|421|195|0|0|0|clock|16|390|160|422|189|1000|0|0|flrVnt|8|447|325|495|338|44|0|0" after line 34 of lvlObjects
    put "" into line 35 of lvlObjects
    put "dnStar|45|5|54|166|308|32|0|0|flrVnt|8|182|325|230|338|44|0|0|toastr|33|379|304|417|331|114|120|0|sh" after line 35 of lvlObjects
    put "elf|2|332|105|490|112|0|0|0|clock|16|410|173|442|202|1000|0|0|flrVnt|8|460|325|508|338|201|0|0|table" after line 35 of lvlObjects
    put "|1|410|201|510|210|0|0|0|books|3|343|52|407|107|0|0|0" after line 35 of lvlObjects
    put "" into line 36 of lvlObjects
    put "flrVnt|8|54|325|102|338|44|0|0|outlet|25|128|175|160|200|120|0|0|flrVnt|8|354|325|402|338|146|0|0|ca" after line 36 of lvlObjects
    put "bnet|4|335|25|457|115|0|0|0|teaKtl|36|436|172|477|202|120|0|0|cabnet|4|148|25|209|81|0|0|0" after line 36 of lvlObjects
    put "" into line 37 of lvlObjects
    put "shelf|2|132|95|448|102|0|0|0|flrVnt|8|73|325|121|338|76|0|0|grease|18|134|67|166|96|448|0|1|celDct|1" after line 37 of lvlObjects
    put "0|256|24|304|37|73|37|1|paper|17|321|75|369|96|1000|0|0|clock|16|368|67|400|96|1000|0|0|rbrBnd|21|39" after line 37 of lvlObjects
    put "9|73|431|96|5|0|0|flrVnt|8|326|325|374|338|96|0|0|battry|20|302|70|320|96|40|0|0|books|3|177|42|241|" after line 37 of lvlObjects
    put "97|0|0|0" after line 37 of lvlObjects
    put "" into line 38 of lvlObjects
    put "flrVnt|8|53|325|101|338|44|0|0|flrVnt|8|305|325|353|338|115|0|0|table|1|136|169|281|178|0|0|0|shelf|" after line 38 of lvlObjects
    put "2|136|90|469|97|0|0|0|books|3|141|115|205|170|0|0|0|table|1|359|225|493|234|0|0|0|candle|11|393|204|" after line 38 of lvlObjects
    put "425|225|116|0|0|clock|16|248|141|280|170|1000|0|0|books|3|180|37|244|92|0|0|0|paper|17|423|70|471|91" after line 38 of lvlObjects
    put "|1000|0|0" after line 38 of lvlObjects
    put "" into line 39 of lvlObjects
    put "flrVnt|8|11|325|59|338|44|0|0|flrVnt|8|446|325|494|338|44|0|0|flrVnt|8|243|325|291|338|44|0|0|celVnt" after line 39 of lvlObjects
    put "|9|103|24|151|36|325|0|0|celVnt|9|150|24|198|36|325|0|0|celVnt|9|197|24|245|36|325|0|0|celVnt|9|287|" after line 39 of lvlObjects
    put "24|335|36|325|0|0|celVnt|9|335|24|383|36|325|0|0|celVnt|9|383|24|431|36|325|0|0|paintg|40|212|68|314" after line 39 of lvlObjects
    put "|161|0|0|0" after line 39 of lvlObjects
    put "" into line 40 of lvlObjects
    put "celDct|10|35|24|83|37|305|31|1|celDct|10|127|24|175|37|66|36|0|celDct|10|221|24|269|37|67|37|0|celDc" after line 40 of lvlObjects
    put "t|10|313|24|361|37|64|41|0|celDct|10|398|24|446|37|57|40|0|flrVnt|8|126|325|174|338|44|0|0|flrVnt|8|" after line 40 of lvlObjects
    put "218|325|266|338|44|0|0|flrVnt|8|311|325|359|338|44|0|0|flrVnt|8|396|325|444|338|44|0|0|cabnet|4|11|2" after line 40 of lvlObjects
    put "13|76|324|0|0|0|paper|17|29|193|77|214|1000|0|0" after line 40 of lvlObjects
end initSpriteConstantsAndLoadGameData

