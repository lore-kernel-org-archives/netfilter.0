From: "Mehmet AK" <mehmet.ak@kolayyol.net>
Subject: Re: ip/snat + port/dnat
Date: Sat, 8 May 2004 12:21:09 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <00ad01c434dd$f6236cb0$0b07f83e@homelanda4abry>
References: <Pine.LNX.4.44.0405072300190.16707-100000@dns.media-lab.com.pl> <200405081006.35368.Antony@Soft-Solutions.co.uk>
Reply-To: "Mehmet AK" <mehmet.ak@kolayyol.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

if you want to use an other port for SMTP you can try this

iptables -t nat -I  FORWARD -p all --dport 25 -j DROP
iptables -t nat -I PREROUTING -i eth0 -p tcp -s 192.168.0.1/24 --dport 25 -j
REDIRECT --to-port  4567

but you have to setup your email server port 4567

best regards


----- Original Message -----=20
From: "Antony Stone" <Antony@Soft-Solutions.co.uk>
To: <netfilter@lists.netfilter.org>
Sent: Saturday, May 08, 2004 12:06 PM
Subject: Re: ip/snat + port/dnat


On Friday 07 May 2004 10:09 pm, R=F3=BFa=F1ski Sergiusz wrote:

> I need dissable routing to smtp servers, and enable smtp on non-standard
> port. Like this:
>
> -p tcp -s 192.168/16 -dport 25 -j DENY

iptables -A FORWARD -p tcp -s 192.168.0.0/16 --dport 25 -j DROP

> -p tcp -s 192.168/16 --dport 2525 -j TARGET_LIKE_SNAT --to
$ext_if --to-port
> 25

iptables -A POSTROUTING -t nat -p tcp --dport 2525 -j SNAT --to $extIF:25

> don't change destination ip.
> possible?

Is that what you wanted?

Antony.

--=20
In science, one tries to tell people
in such a way as to be understood by everyone
something that no-one ever knew before.

In poetry, it is the exact opposite.

 - Paul Dirac

                                                     Please reply to the
list;
                                                           please don't CC
me.



