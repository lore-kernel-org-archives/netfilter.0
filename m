From: "podo" <podo@hnup.de>
Subject: RE: Limit rule for ICMP not working properly?
Date: Thu, 5 Sep 2013 16:58:27 +0200
Message-ID: <000901ceaa48$60fe2a40$22fa7ec0$@hnup.de>
References: <002e01ce83d7$ad77f410$0867dc30$@hnup.de> <CAKpaJ1wgnikpc9WcwCVgzf45F1Lpwbp9LMr4_2bXk6XYf7nRjw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAKpaJ1wgnikpc9WcwCVgzf45F1Lpwbp9LMr4_2bXk6XYf7nRjw@mail.gmail.com>
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: 'netfilter' <netfilter@vger.kernel.org>

Hi,

the default is DROP:

iptables -L -n -v
Chain INPUT (policy DROP 314 packets, 98684 bytes)
pkts bytes target     prot opt in     out     source
destination
  963 66540 ACCEPT     tcp  --  *      *       0.0.0.0/0
0.0.0.0/0
   29  1740 ACCEPT     icmp --  *      *       0.0.0.0/0
0.0.0.0/0            icmptype 8 limit: avg 1/sec burst 5
   39  2836 ACCEPT     all  --  *      *       0.0.0.0/0
0.0.0.0/0            state ESTABLISHED

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
pkts bytes target     prot opt in     out     source
destination

Chain OUTPUT (policy ACCEPT 5384 packets, 387K bytes)
pkts bytes target     prot opt in     out     source
destination

The problem is, that the second rule gets hit, even if it shoud not (my
opinion). ICMP can not be "established". Or ?

I know I could add new rule after the limit - with ICMP reject. This wo=
uld
probably work. But it should work also without explicit reject for ICMP=
=2E


Thanks,
Regards,
Podo.

=46rom: Vishesh kumar [mailto:linuxtovishesh@gmail.com]=20
Sent: 05 September, 2013 16:15
To: podo
Cc: netfilter
Subject: Re: Limit rule for ICMP not working properly?

Hi,
Does 2nd rule getting hit . Also where is the REJECT rule ?
iptables -L -n -v
Thanks

On Thu, Jul 18, 2013 at 10:25 PM, podo <podo@hnup.de> wrote:
Hello all,

I have a problem with the limit module. The goal is to limit the incomi=
ng
ICMP echo-requests to max 1/s.
The following rule does it (as example using the INPUT) :

-A INPUT -p icmp -m icmp --icmp-type 8 -m limit --limit 1/sec -j ACCEPT

The above is working fine. But when there is a rule for accepting the
ESTABLISHED packets, the limit does not work:

-A INPUT -p icmp -m icmp --icmp-type 8 -m limit --limit 1/sec -j ACCEPT
-A INPUT -m state --state ESTABLISHED -j ACCEPT

With these 2 rules the limit does not work...

Using the "iptables -A INPUT -m state --state ESTABLISHED -p ICMP -j AC=
CEPT"
and =A0"watch -d -n 1 =A0iptables -nvL" is showing, that all the ICMP
echo-requests from the same host are being considered ESTABLISHED.

I am not sure, but I think after sending the ICMP echo-reply the sessio=
n
should be closed. With new echo-request a new session is opened.

Please could somebody confirm, if this behavior is correct ? And if yes
please explain ?

See also:

http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D598513

and from
"http://www.netfilter.org/documentation/HOWTO//packet-filtering-HOWTO-7=
=2Ehtml
" :

"ESTABLISHED
=A0A packet which belongs to an existing connection (i.e., a reply
packet, or outgoing packet on a connection which has seen replies)."

And from "http://www.lug.or.kr/docs/iptables-tutorial/onepage/" :

"The reply packet is considered as being ESTABLISHED, as we have alread=
y
explained. However, we can know for sure that after the ICMP reply,
there will be absolutely no more legal traffic in the same connection.
=46or this reason, the connection tracking entry is destroyed once the
reply has traveled all the way through the Netfilter structure."

I am using iptables v1.4.14.

Thanks in advance,
Regards,
Podo.


--
To unsubscribe from this list: send the line "unsubscribe netfilter" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at =A0http://vger.kernel.org/majordomo-info.html



--=20
http://linuxmantra.com=20


