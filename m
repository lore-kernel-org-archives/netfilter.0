From: =?ISO-8859-1?Q?Usu=E1rio_do_Sistema?= <maiconlp@ig.com.br>
Subject: Re: WAN balancing
Date: Thu, 5 May 2011 14:17:21 -0300
Message-ID: <BANLkTim4u-QRx3ZFSTvv6yUm7QjxG2+qsQ@mail.gmail.com>
References: <201105050901.26651.dyioulos@firstbhph.com>
	<BANLkTimSEUh3S70QiqE1-g_r1dZJ75jfmA@mail.gmail.com>
	<201105051040.05671.dyioulos@firstbhph.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <201105051040.05671.dyioulos@firstbhph.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Dimitri Yioulos <dyioulos@firstbhph.com>
Cc: netfilter@vger.kernel.org, "DiCecca, Caitlin" <cdicecca@firstbhph.com>

you have add rules NAT POSTROUTING for each link.

for exemplo, for your out Internet Traffic you have add two NAT
POSTROUTING each one on Interface WAN.







2011/5/5 Dimitri Yioulos <dyioulos@firstbhph.com>:
> If I may, the how-to you've pointed out has to do
> with routing which, of course, is important. =A0Are
> there any changes/additions I need to make to my
> iptables ruleset, as well?
>
> Best,
>
> Dimitri
>
>
> On Thursday 05 May 2011 9:34:46 am Matty Sarro
> wrote:
>> http://lartc.org/howto/lartc.rpdb.multiple-link
>>s.html
>>
>> That should help.
>>
>> On Thu, May 5, 2011 at 9:01 AM, Dimitri Yioulos
> <dyioulos@firstbhph.com> wrote:
>> > Good morning, all.
>> >
>> > I've searched for a clear guide on setting up
>> > my iptables/Netfilter firewall/router to do
>> > WAN balancing. =A0I have two providers - one is
>> > T1 and the other broadband). =A0Currently, I'm
>> > using the T1 provider to send and receive
>> > traffic on. =A0I'd like to use both.
>> >
>> > I have one LAN interface, one WAN interface,
>> > and one DMZ interface. =A0The DMZ utilizes
>> > several virtual interfaces. =A0I can easily add
>> > a fourth physical NIC. =A0Beyond this, I'm not
>> > sure what other information I can provide,
>> > but I'm happy to do so.
>> >
>> > Your help would be greatly appreciated.
>> >
>> > Dimitri
>> >
>> > --
>> > This message has been scanned for viruses and
>> > dangerous content by MailScanner, and is
>> > believed to be clean.
>> >
>> > --
>> > To unsubscribe from this list: send the line
>> > "unsubscribe netfilter" in the body of a
>> > message to majordomo@vger.kernel.org More
>> > majordomo info at
>> > =A0http://vger.kernel.org/majordomo-info.html
>
>
>
> --
> This message has been scanned for viruses and
> dangerous content by MailScanner, and is
> believed to be clean.
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
