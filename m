From: "Gaby Schilders" <G.Schilders@ibfd.org>
Subject: RE: NAT with two Internet links
Date: Thu, 16 Oct 2003 11:08:02 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <DAAAFFB7B8C62F40BC87BF3E729F79E10119907F@ibfdmail.ibfd.oin>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: Simon Garner <sgarner@expio.co.nz>
Cc: netfilter list <netfilter@lists.netfilter.org>

Alternatively, if you want to be on the bleeding edge... (who doesn't =
;-)

If you include the 'ROUTE' target (from a recent p-o-m) and get a recent =
iptables snapshot and compile it against your shiney new kernel source =
you can do without the Mark target and iproute2 altogether:

use the target -j ROUTE --gw GWx (add --oif OIFx if you're paranoid like =
me) --continue

Where in GWx and OIFx x is the number of the uplink you want to use for =
this particular connection (I have two uplinks so I have rules for GW1 =
and GW2 but this can be extended ad inifinitum)

Don't forget the --continue or your packets go out without being SNATted =
or UnDNATted...

I only figured this one out today though ;)

I'll expand on this solution somewhere on Monday when it's all fixed up.

Gaby Schilders
IBFD network admin

-----Original Message-----
From: Simon Garner [mailto:sgarner@expio.co.nz]
Sent: donderdag 16 oktober 2003 9:46
To: netfilter@lists.netfilter.org
Subject: Re: NAT with two Internet links


On Thursday, October 16, 2003 7:37 PM [GMT+1200=3DNZT],
Simon Garner <sgarner@expio.co.nz> wrote:

> Hi,
>
> I have a small network with several Windows client PCs, a Linux
> firewall/server, and two links to the Internet. What I want to do is
> have certain traffic (based on source and/or destination ports) routed
> through one link while everything else goes through the other.
>

Nevermind, after a bit more googling I found the answer myself. The
solution is to mark the wanted packets with iptables and then route them
with iproute2, as per:
http://www.lartc.org/howto/lartc.netfilter.html

-Simon



