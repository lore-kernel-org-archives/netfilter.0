From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: Automagic proxy arp?
Date: Wed, 22 Feb 2006 17:13:31 +0100 (CET)
Message-ID: <51364.193.173.147.3.1140624811.squirrel@webmail.sterenborg.info>
References: <43FC8213.2030606@certicom.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43FC8213.2030606@certicom.com>
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

On Wed, February 22, 2006 16:24, Chinh Nguyen wrote:
> Hi,
>
> I have a machine M that is 'walled' off from the rest of the local subn=
et
> similar to this.
>
>         .1        .2        .3       .4-.254
> +-------+         +---------+
> +   M   + ------ eth1  FW  eth0 ---- local subnet
> +-------+         +---------+
>
> With ip_forward on and using standard forward rules on FW (e.g., -A FOR=
WARD
> --in-interface eth1 -j ACCEPT, -A FORWARD --in-interface eth0 -m state
> --state ESTABLISHED,RELATED -j ACCEPT), M can reach the local subnet.
>
> However, I need to add a routing entry in M to send all local traffic t=
o FW.
> Otherwise, M will attempt to arp the destination as they are all on sam=
e
> subnet.
> The linux arp man page claims that linux will "automagic proxy arp when=
 a
> route exists and it is forwarding".

The "linux arp man page"... Not the iptables man page.

> Does anyone know how to set up iptables on FW to enable this "automagic=
"?

Aren't you confusing things ? arp !=3D iptables.
From man arp(8) :

NOTE: As of kernel 2.2.0 it is no longer possible to set an ARP entry for=
 an
entire subnet. Linux instead does automagic proxy arp when a route exists=
 and
it is forwarding. See arp(7) for details.

> I've also tried using explicit forward rules such as "--in eth1 -d !.1 =
-j
> ACCEPT", "--in eth1 -d .4 -j ACCEPT, --in eth1 -d .5 -j ACCEPT, etc." t=
o no
> effect.

Why is it such a problem to set the default gateway of "M" to the firewal=
l ?
You say it works when you add a routing rule for for the firewall, but if=
 the
firewall is the only machine that "M" can reach, you might as well use it=
 as
default gateway.


Gr,
Rob



