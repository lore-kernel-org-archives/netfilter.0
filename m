From: =?ISO-8859-1?Q?Usu=E1rio_do_Sistema?= <maiconlp@ig.com.br>
Subject: Re: WAN balancing
Date: Thu, 5 May 2011 11:30:09 -0300
Message-ID: <BANLkTik+ptEOjBJOkfDL6XSM4A-kNmzCKQ@mail.gmail.com>
References: <201105050901.26651.dyioulos@firstbhph.com>
	<BANLkTimSEUh3S70QiqE1-g_r1dZJ75jfmA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <BANLkTimSEUh3S70QiqE1-g_r1dZJ75jfmA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Matty Sarro <msarro@gmail.com>
Cc: Dimitri Yioulos <dyioulos@firstbhph.com>, netfilter@vger.kernel.org, "DiCecca, Caitlin" <cdicecca@firstbhph.com>

I didn't understand exactly where you want apply your load Balance but
follow the command that does the load balance.
you must have two route in your route table:

ip route add default scope global equalize nexthop via 200.247.209.65
weight 1  nexthop via 200.247.209.6 weight 1

before you insert the load balance command check your table route with
" ip route show "

you will see there is only one default route.

insert load balance command and check again your table route with " ip
route show "

and must appear two default gateway.

ip route add default scope global equalize nexthop via 200.247.209.65
weight 2  nexthop via 200.247.209.6 weight 1



I hope help!







2011/5/5 Matty Sarro <msarro@gmail.com>:
> http://lartc.org/howto/lartc.rpdb.multiple-links.html
>
> That should help.
>
> On Thu, May 5, 2011 at 9:01 AM, Dimitri Yioulos <dyioulos@firstbhph.c=
om> wrote:
>> Good morning, all.
>>
>> I've searched for a clear guide on setting up my
>> iptables/Netfilter firewall/router to do WAN
>> balancing. =A0I have two providers - one is T1 and
>> the other broadband). =A0Currently, I'm using the
>> T1 provider to send and receive traffic on. =A0I'd
>> like to use both.
>>
>> I have one LAN interface, one WAN interface, and
>> one DMZ interface. =A0The DMZ utilizes several
>> virtual interfaces. =A0I can easily add a fourth
>> physical NIC. =A0Beyond this, I'm not sure what
>> other information I can provide, but I'm happy to
>> do so.
>>
>> Your help would be greatly appreciated.
>>
>> Dimitri
>>
>> --
>> This message has been scanned for viruses and
>> dangerous content by MailScanner, and is
>> believed to be clean.
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe netfilter"=
 in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
