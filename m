From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: IPTABLES for dual homed machine and public IP addresses
Date: Wed, 11 Aug 2004 15:56:22 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC9051271@asimail2.alphanumeric.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-class: urn:content-classes:message
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

> I am trying to setup a firewall for a LAN that has more than 40 =
servers
> in production. All the production servers have public IP addresses. I
> have looked at several scripts available on line to build from and I
> have failed to get one that caters for this type of scenario. My
> router's internal interface is 65.x.x.1. Does anybody know of a way
> around this while keeping my external IP's or must I use private IP's
> for my internal machines? Do I have to set up the default gateway on
> production servers as my routers internal interface of use my firewall
> trusted interface as default gateway?
>
> All help and pointers will be greatly appreciated.
>
> Eddie

if i understand you correctly; you currently have:

 INTERNET
    |
    |
a.b.c.d
	ROUTER
65.x.x.1
    |
    |
40 Servers with 65.x.x.x IP addresses and 65.x.x.1 as their default =
gateway.

your desire is to insert a firewall in between the 40 servers and the =
router without having to re-address all the servers, right?  if =
not--disregard the rest of this...

you have two options:  a layer 2 approach to solve the problem, and a =
layer 3 approach to solve the problem.

layer 2 would involve configuring a netfilter machine as a bridge =
between the servers and the router where all the IP addresses would stay =
the same.  the project handling this sort of thing is:  =
http://ebtables.sourceforge.net/

layer 3 solution would depend on what IP's were in use currently.  we =
know that 65.x.x.1 is used and is configured as the default gateway for =
all those servers--so that IP has to go on the internal interface of the =
new firewall.  which leaves us to re-address the outside of the new =
firewall and the inside of the existing router.  in the simplest case, =
65.x.x.252 - .255 aren't in use.  we take 65.x.x.252/30 and assign .253 =
to the outside of the new firewall, and .254 to the inside of the =
existing router and set that as the default gateway of the new firewall. =
 put a static route for 65.x.x.0/24 via 65.x.x.253 on the router so all =
your traffic continues to get to your servers.  short of some arp-cache =
timeouts on the 40 servers to pick up the new MAC for 65.x.x.1, we're =
done.

sound plausible?

-j

