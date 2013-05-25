From: Nick Khamis <symack@gmail.com>
Subject: Re: IPTables - Going Stateless
Date: Sat, 25 May 2013 16:14:52 -0400
Message-ID: <CAGWRaZZ-eMegt5RVKy+Om309A1b=PpmKyO=WWoeeZq1wppgpqw@mail.gmail.com>
References: <CAGWRaZbwp8jDPxDzHX6g_LkpK74iB6K4GSoU7c_5THDSx1oDmQ@mail.gmail.com>
	<ACBD9B315535B2489252E981FF05808602C2A0A034@EDBCL19EX001.edb.local>
	<CAGWRaZYbbKFeeRViAcbrV3LGv1s_fcbVk4qbcJjQKD4sy5i7uA@mail.gmail.com>
	<CAGWRaZZxhStfEHDVZrtzZvZxKH66DEZ0gL+hs0RUFPv2EtdWAg@mail.gmail.com>
	<51A0BE2D.3020105@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=0T2hBiIeDVVIG24E0v/Hu1mOB2EsKBOr2YsuhzyjGhI=;
        b=DaZvuZUW3f2A/6LDRFa0nBgO3sAxdmCMA8nxI1CZpoAwj8iljQvvH9kBHpMOTq6m+0
         GpfGMPm3TVjekTqTjeb4IC0QO9YYUQ8l97VEprz17vxrjacFPTDKh5Iwu7WIVEZpnsb9
         RPK6RAPir78YZacH+7M7iPvP8Hrej2ExI0M5SVUkmbai5OkC/CikzQMnwAWMi2HaPfcn
         AZPVeyGGJXxjjrKyGfeFXfCcUDMoeyc72HGOjavQqzu3LYtcAJnl8bArGEMt9MWZOhk4
         CSp6xfI3Hck/Ni7n0mt17r1T0kOC3cIT8MR4voGNM5Z/ykq4ZLtzvSSD5rNMqCbFPVSu
         16Mw==
In-Reply-To: <51A0BE2D.3020105@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pascal Hambourg <pascal@plouf.fr.eu.org>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Thank you so much Pascal!!! It took me a while to find it, but for
future googlers

"limit" match support =3D CONFIG_NETFILTER_XT_MATCH_LIMIT

Make sure limit match support is included as a module.

Kind Regards,

Nick


On 5/25/13, Pascal Hambourg <pascal@plouf.fr.eu.org> wrote:
> Nick Khamis a =E9crit :
>>
>> # Set Log Limit
>> LOGLIMIT=3D"2/s"
>> LOGLIMITBURST=3D"10"
>>
>> $IPTABLES -A LOGINPUT -i $INTIF1 -p icmp -j LOG --log-prefix "ICMP
>> LOGINPUTDROP: " --log-tcp-options --log-ip-options -m limit --limit
>> $LOGLIMIT
>>
>> I am getting the following error: iptables: No chain/target/match by=
 that
>> name
>> And it's due to the "limit" flag.
>>
>> lsmod
>> Module                  Size  Used by
>> xt_LOG                  6531  7
>> ipt_REJECT              1917  6
>> iptable_filter           988  1
>> ip_tables               8370  1 iptable_filter
>> e100                   28046  0
>
> Looks like the "limit" match is not enabled in your kernel. Check
> CONFIG_NETFILTER_XT_MATCH_LIMIT in your kernel config file.
>
