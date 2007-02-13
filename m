From: "Jorge Canas" <jcanas2000@hotmail.com>
Subject: Re: How to loop back internal traffic?
Date: Tue, 13 Feb 2007 15:56:06 -0500
Message-ID: <BAY101-F3107253A33EE8463A3F89DD9900@phx.gbl>
References: <da3a2a260702110107x33e1215cw4df80893c24f619f@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <da3a2a260702110107x33e1215cw4df80893c24f619f@mail.gmail.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; format=flowed; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: jcanas2000@hotmail.com
Cc: netfilter@lists.netfilter.org

>From: "James Shewey"
>
>try:
>
>iptables -A POSTROUTING -s 192.168.123.0/24  -d
>www.externaldomainname.com -j DNAT
>--to-source 192.168.123.161 -t nat
>
>
>This will automagically fill in the destination IP for you and
>redirect any traffic sent to the external IP. This works on my home
>rig with FTP. Just make sure DNS is working!
>

Thanks James, that ended up resolving the address (via DNS) right before th=
e=20
rule was inserted, which to me seems sensible and the right thing to do. =20
So, it does work, but when the addr changes (dhcp), the rule becomes=20
obsolete.

A previous response triggered me to pay a closer look to the FAQs and=20
according to the "Destination NAT onto the same network" section of the NAT=
=20
Howto/FAQ, the following two rules should work:


    # iptables -t nat -A PREROUTING -d 1.2.3.4 -p tcp --dport 80 -j DNAT=20
--to 192.168.1.1
    # iptables -t nat -A POSTROUTING -d 192.168.1.1 -s 192.168.1.0/24 -p tc=
p=20
--dport 80 -j SNAT --to 192.168.1.250

However, this stuff assumes that the public address of the server is static=
=20
(1.2.3.4 in the above rules) and I am trying to make this work when the=20
public address is dhcp'ed.

Is there a way to make this work with dynamic IP addresses?  Assume dynDNS =

is at work here...

Thanks.

_________________________________________________________________
Check out all that glitters with the MSN Entertainment Guide to the Academy=
=20
Awards=AE   http://movies.msn.com/movies/oscars2007/?icid=3Dncoscartagline2


