From: Peter Chacko <peterchacko35@gmail.com>
Subject: Re: Natting html traffic
Date: Sat, 13 Feb 2010 10:21:34 +0530
Message-ID: <1f808b4a1002122051h589667fek2f74b2a530f4b76b@mail.gmail.com>
References: <368e93c51002121503y2bf70ddbh85c0c377356a345@mail.gmail.com>
	 <1266016722.2980.159.camel@tesla.lan>
	 <1266027202.3899.1.camel@casper.meteor.dp.ua>
	 <1266035174.2980.178.camel@tesla.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=Oww49+sPXPlEmFBDty2P6goULf5X31Frt8cm+RVFAqs=;
        b=xDdLkiJH9MQxkIKHQSoEtE+rDfSOxlF2KNz68I3WuFX5k4uZ14ezNBQFEjNJyblz38
         woEhH9hpuyAVsbbYoxxIEGEeAh5DXpLrM89HlgpY3i/FmzxPxGAQiJ4MK40V4UwqwZxM
         yM4bVLxsJjelmMpf4MPUF94Fn31+XjpLza3mg=
In-Reply-To: <1266035174.2980.178.camel@tesla.lan>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="koi8-r"
To: Guido Trentalancia <guido@trentalancia.com>
Cc: =?KOI8-R?B?8M/Lz9TJzMXOy88g68/T1MnL?= <casper@meteor.dp.ua>, netfilter@vger.kernel.org

but if telnetd is not started on http server or configured to ignore
telnet stream, you will just get a connection time out on client....
so its not a good idea to prob http server with telnet protocol.

Peter chacko.

2010/2/13 Guido Trentalancia <guido@trentalancia.com>:
> On Sat, 2010-02-13 at 04:13 +0200, =F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF =
=EB=CF=D3=D4=C9=CB wrote:
>> =F7 =F3=D5=C2, 13/02/2010 =D7 00:18 +0100, Guido Trentalancia =D0=C9=
=DB=C5=D4:
>> > On Sat, 2010-02-13 at 00:03 +0100, Bojan Sukalo wrote:
>> > > Telnet from inside machine to www.google.com 80 works but I can'=
t get
>> > > any messages after I get connected (Just successfull telnet
>> > > connection)
>> >
>> > You can't telnet www.google.com on port 80, as google is not a tel=
net
>> > server and therefore it can't deal with the telnet protocol. Googl=
e
>> > deals with the http protocol.
>>
>> Why one can't use telnet program to test http server?
>
> Just because one won't get anything more than just "connected". So it=
 is
> not a very useful way to test HTTP nor NAT...
>
> Guido
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =9Ahttp://vger.kernel.org/majordomo-info.html
>
