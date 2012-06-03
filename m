From: Jesper Dangaard Brouer <hawk@diku.dk>
Subject: Re: [Announce] LARTC wiki available
Date: Sun, 3 Jun 2012 04:36:11 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.1206030343400.3122@ask.diku.dk>
References: <4EFB3B2B.7060200@linuxsystems.it> <4FC8F0E4.6060102@linuxsystems.it>
 <8063b8e35d17fd072cbdc9908cf12519@njm.linuxwall.info> <4FCA2545.60702@ukfsn.org>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="-511516320-346819181-1338690971=:3122"
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <4FCA2545.60702@ukfsn.org>
Sender: netdev-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Andy Furniss <andyqos@ukfsn.org>
Cc: Julien Vehent <julien@linuxwall.info>, =?iso-8859-1?Q?Niccol=F2_Belli?= <darkbasic@linuxsystems.it>, lartc@vger.kernel.org, netfilter@vger.kernel.org, Linux Networking Developer Mailing List <netdev@vger.kernel.org>, brouer@redhat.com

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---511516320-346819181-1338690971=:3122
Content-Type: TEXT/PLAIN; charset="iso-8859-1"; format="flowed"
Content-Transfer-Encoding: quoted-printable

On Sat, 2 Jun 2012, Andy Furniss wrote:

> Julien Vehent wrote:
>>  On 2012-06-01 12:42, Niccol=F2 Belli wrote:
>> >  http://lartc.org is alive and kicking and there is no need for
>> >  another
>> >  wiki anymore. I'd like to thank both Bert and Carl-Daniel.
>> >=20
>> >  Niccol=F2
>> >=20
>>
>>  Very cool !
>>  I'll try to find some time and move over some of the content I have
>>  here:
>>  http://wiki.linuxwall.info/doku.php/en:ressources:dossiers:networking:t=
raffic_control
>
> A couple of things that stand out after skimming through.
>
> DSL - Jeesper's overhead as noted in the comments is not 5 and anyway I t=
hink=20
> his good work has now been superseded by stab as it allows for negative=20
> overheads, which his did not.

Thanks for the credits :-)

Its been a while since I looked at that code.  I think, the 5 bytes might=20
ref to the ATM header 5 + 48 =3D 53 bytes the ATM cell size.  But 5 is not =

used as overhead.

The linklayer ATM hack is to adjust the rtable array, that the kernel uses =

for lookups.  The problem is that the rtable array only have an 8 bytes=20
"resolution" (well depend on cell_log), thus to get this aligned, I use=20
the ATM payload size of 48, when populating the rtable array.  Then=20
when storing the "data" I the rtable array I use *53 byte ATM cell size.

> man tc-stab has clear and good explanations and examples.

Good to see some documentation on stab, I always found it difficult to=20
use.

Cheers,
   Jesper Brouer

--
-------------------------------------------------------------------
MSc. Master of Computer Science
Dept. of Computer Science, University of Copenhagen
Author of http://www.adsl-optimizer.dk
-------------------------------------------------------------------
---511516320-346819181-1338690971=:3122--
