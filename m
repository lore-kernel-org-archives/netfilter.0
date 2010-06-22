From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: Re: h323 ALG .
Date: Tue, 22 Jun 2010 18:18:17 +0530
Message-ID: <AANLkTimByxaiayUJc6JxD04N91-I2rU1f7p_Dko-v9QN@mail.gmail.com>
References: <AANLkTilxYbk1LBMGelD3NAzSeUXmKm_oWmepxVL8M9Hb@mail.gmail.com>
	<alpine.DEB.2.00.1006221348240.2393@blackhole.kfki.hu>
	<AANLkTikkysjYCFbZAsmnCDSX6ExiAGaQPue--XtGws4r@mail.gmail.com>
	<alpine.DEB.2.00.1006221435590.2393@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=FsnO42UT6Obqf7y1Qu0amvAudn3mkOYW2W4OvA5wW2c=;
        b=TOTy5KGcD0W3tQ9zsRbfeSHlD/S+dtLkA/sbjvlA0KmQHlQGx8elzB5NE1tBFI0ySh
         PQzSF++ou2bgdfNUTHLn3RER0SVFZ7MJp7K0jeIqkiK1DZig/ZbhIgLdt6NplK1wcxEp
         qRbHy83KmKvVU/Dm92eKzLxx39fty9KTISEZI=
In-Reply-To: <alpine.DEB.2.00.1006221435590.2393@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: Netfilter mailing list <netfilter@vger.kernel.org>

>> On Tue, Jun 22, 2010 at 5:21 PM, Jozsef Kadlecsik
>> <kadlec@blackhole.kfki.hu> wrote:
> You allow clients on the LAN to connect outside and enable bidirectio=
nal
> connections. After that any side of the connection can issue correct =
H.323
> protocol commands and trigger expectations in any direction.

Could you please explain in detail  ?   How tcp+syn packets comes from
wan side and hit ip_conntrack_in ()  ?

Thanks,
Ratheesh


On Tue, Jun 22, 2010 at 6:12 PM, Jozsef Kadlecsik
<kadlec@blackhole.kfki.hu> wrote:
> On Tue, 22 Jun 2010, ratheesh k wrote:
>
>> On Tue, Jun 22, 2010 at 5:21 PM, Jozsef Kadlecsik
>> <kadlec@blackhole.kfki.hu> wrote:
>> >> 1. =A0ALG will allow wan to lan calls ? No need for specific ipta=
bles
>> >> forwarding rule if alg is needed ?
>> >
>> > Yes. That's the point for a helper.
>>
>> I thought , ALG =A0will install related connection tuple , if a
>> connection is thru .
>> what i meant is : suppose a =A0ftp connection ( active ) is tried to
>> make from lan-to-wan side ( it will go thru as per iptables ) .
>
> No, active/passive FTP connections are not "tried". The corresponding=
 FTP
> command is issued in the command channel and that is interpreted by t=
he
> FTP helper. Which then add a connection expectation to conntrack - an=
d
> which you allow through by the "-m state --state RELATED -j ACCEPT" r=
ule.
> The same happens with H.323.
>
>> Since =A0here =A0the =A0pkt is =A0from wan-to-lan =A0 and is =A0bloc=
ked by
>> iptables =A0. How ALG got triggered without any pkt flow ?
>
> You allow clients on the LAN to connect outside and enable bidirectio=
nal
> connections. After that any side of the connection can issue correct =
H.323
> protocol commands and trigger expectations in any direction.
>
> Best regards,
> Jozsef
> -
> E-mail =A0: kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
> PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
> Address : KFKI Research Institute for Particle and Nuclear Physics
> =A0 =A0 =A0 =A0 =A0H-1525 Budapest 114, POB. 49, Hungary
>
