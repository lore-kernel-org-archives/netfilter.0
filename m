From: "Aaron Stavens" <aaron.stavens@nmwco.com>
Subject: RE: What can I use to set up a transparent proxy?
Date: Fri, 28 Jan 2005 19:32:42 -0800
Message-ID: <68B9548ED9F8A341B21CDB320655D613F54DC5@mercury.nmwco.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Martijn,

I am mightily encouraged by your response. It sounds like what I want to
do is possible, but I am discouraged by my lack of success in
implementing it. I haven't been able set up proxy arp using the arp
command. Can you or someone else shed some light on what ever error it
is that I am making?

On the proxy arp machine I issue:

    arp -i eth0 -s 10.128.240.1 00:c0:4f:68:ab:e6 pub

and

    arp -i eth0 -Ds 10.128.240.2 eth0 pub

"arp -a" then reports:

    ? (10.128.1.1) at 00:06:53:02:F8:51 [ether] on eth0
    ? (10.128.240.1) at * PERM PUP on eth0
    ? (10.128.240.2) at * PERM PUP on eth0

The "*" instead of eth0's MAC address bothers me, but maybe that is
normal. I don't know.

On a separate machine I then

    ping 10.128.240.1

and

    ping 10.128.240.2

while sniffing the network. In the network trace I see the ARP requests
go out for the two different IP addresses, but not ARP responses come
back. I do not understand why there is no response. Does what I am doing
appear reasonable? Is there some kernel configuration option I must,
well, configure? Is there a /proc setting I need to tweak? What am I
missing?

Thanks,
Aaron Stavens

> -----Original Message-----
> From: Martijn Lievaart [mailto:m@rtij.nl]
> Sent: Thursday, January 20, 2005 12:31 AM
> To: Aaron Stavens
> Cc: netfilter@lists.netfilter.org
> Subject: Re: What can I use to set up a transparent proxy?
>=20
> Aaron Stavens said:
> > 2. The proxy server must respond to ARP requests for the VA with its
own
> > MAC address.
>=20
> Add the arp to the arptable, possibly by adding the ip to the
interface,
> possibly manipulating the arp table directly (using the apr command).
>=20


