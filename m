From: =?iso-8859-1?Q?Andr=E9_Paulsberg-Csibi_=28IBM_Consultant=29?= 
	<Andre.Paulsberg-Csibi@evry.com>
Subject: RE: lots of ACKs for DPT=1433
Date: Mon, 8 Aug 2016 09:35:11 +0000
Message-ID: <e0b3415fe427476e94df8050ef14e529@CCDEX021.corp.corpcommon.com>
References: <d5bbb8f26b17a1d6cf8044864b7aa587@mail.zaplinski.de>
 <5342a37e-1534-59bd-16ac-dc4df108fea7@sterenborg.info>
 <bf5e106359174bc234805b6d5539d136@mail.zaplinski.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <bf5e106359174bc234805b6d5539d136@mail.zaplinski.de>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Olaf Zaplinski <olaf@zaplinski.de>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

From the details you gave , it would be natural to assume you are talking a=
bout multiple sources sending traffic
to your Internet exposed IP's which would normally be some version of PORTS=
CANNING .
( Even if the packets are 90%-100% ACK packets , they can still be some att=
empt of portscanning )

In any case it would be helpful if you add some complete logfiles entries (=
10-20) ,=20
if you need you can just "MANGLE" your exposed IP's target but please leave=
 the rest of the logfiles as original as possible .


Best regards
Andr=E9 Paulsberg-Csibi
Senior Network Engineer=20
Fault Handling
IBM Services AS
andre.paulsberg-csibi@evry.com
M +47 9070 5988




-----Original Message-----
From: netfilter-owner@vger.kernel.org [mailto:netfilter-owner@vger.kernel.o=
rg] On Behalf Of Olaf Zaplinski
Sent: 8. august 2016 10:16
To: netfilter@vger.kernel.org
Subject: Re: lots of ACKs for DPT=3D1433

Am 2016-08-07 17:29, schrieb Rob Sterenborg (Lists):
> On 04-08-16 12:46, Olaf Zaplinski wrote:
>> Hi,
>>=20
>> I see lots of ACKs for DPT=3D1433 in my logs. Anyone else?
>>=20
>> Any idea what is the reason for this?
>>=20
>> Olaf
>=20
> A lot of scans for a vulnerable MSSQL server.

That would be true if that were SYN requests. But 90% of these requests=20
or so are ACK requests.

Olaf
--
To unsubscribe from this list: send the line "unsubscribe netfilter" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
