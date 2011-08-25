From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Theoretical question: need for filter table in the POSTROUTING
 chain
Date: Thu, 25 Aug 2011 09:51:42 -0500
Message-ID: <4E56617E.4040704@riverviewtech.net>
References: <4E5634C3.80908@freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4E5634C3.80908@freemail.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 08/25/11 06:40, G=E1sp=E1r Lajos wrote:
> I would like to filter some destination IP-s both on the FORWARD and =
the
> OUTPUT chains... (For example to stop requests to private IP
> destinations leave our system.)
> I would like to use the REJECT target...
> It would be nince if there would be a filter table in the POSTROUTING
> chain...
>
> What do you think?

How about putting a reject route in the kernel routing table?

That will very easily prevent the packets from leaving your system.

=46urther, I think the kernel will (by default) send an ICMP packet=20
indicating that there is no route.

IPTables is great, but sometimes it's better to use a different technol=
ogy.



Grant. . . .


P.S.  Here's a series of commands that I run on my systems.

route add -net 0.0.0.0 netmask 255.0.0.0 reject
route add -net 10.0.0.0 netmask 255.0.0.0 reject
route add -net 169.254.0.0 netmask 255.255.0.0 reject
route add -net 172.16.0.0 netmask 255.240.0.0 reject
route add -net 192.0.2.0 netmask 255.255.255.0 reject
route add -net 192.168.0.0 netmask 255.255.0.0 reject
route add -net 198.51.100.0 netmask 255.255.255.0 reject
route add -net 203.0.113.0 netmask 255.255.255.0 reject
