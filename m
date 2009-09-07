From: "J. Bakshi" <joydeep@infoservices.in>
Subject: Re: A very basic chain question
Date: Mon, 07 Sep 2009 13:37:28 +0530
Message-ID: <4AA4BF40.1090105@infoservices.in>
References: <4AA4AF15.8000602@infoservices.in> <4AA4BAA4.2060004@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4AA4BAA4.2060004@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

Pascal Hambourg wrote:
> Hello,
>
> J. Bakshi a =E9crit :
>  =20
>> check limit ( say 10/min) --> check connlimit ( 2 per ip ) --> check
>> hashlimit ( 2 attempt per min) ---> ACCEPT.
>>
>> I have made a chain called sshrate but don't find the way to append =
the
>> rules in that chain one by one. If I simply append the rules as acce=
pt
>> then the very first rule is working bypassing the other two and my
>> objective is to pass the rules in a pipe one by one and finally acce=
pt
>> the valid packets. Could any one enlighten me in that direction ?
>>    =20
>
> DROP (or REJECT) packets which fail early checks if possible :
>
> -A sshrate -m <!check1> -j DROP
> -A sshrate -m <!check2> -j DROP
> -A sshrate -m <check3> -j ACCEPT
>
> or put all checks in the same rule if possible :
>
> -A sshrate -m <check1> -m <check2> -m <check3> -j ACCEPT
>  =20

Very nice. The second one is really nice.
many many thanks.


> or cascade chains :
>
> -A sshrate -m <check1> -j check1ok
> -A check1ok -m <check2> -j check2ok
> -A check2ok -m <check2> -j ACCEPT
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>  =20

