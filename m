From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: TTL patch buggy?
Date: Wed, 7 Jan 2004 16:38:53 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040107213853.GD20346@cannon.eng.us.uu.net>
References: <Pine.LNX.4.44.0401071709030.4717-100000@filer.marasystems.com> <1073502275.16972.10.camel@jasiiitosh.nexusmgmt.com> <20040107193547.GF6629@obroa-skai.de.gnumonks.org> <1073506041.16972.25.camel@jasiiitosh.nexusmgmt.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1073506041.16972.25.camel@jasiiitosh.nexusmgmt.com>
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
Content-Transfer-Encoding: 7bit
To: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Cc: netfilter@lists.netfilter.org

On Wed, Jan 07, 2004 at 03:07:22PM -0500, John A. Sullivan III wrote:

> <snip>
> Thanks to all of you for such insightful replies.  As I synthesize them,
> I see some problems and a possible solution.
> 1) Incrementing does create the possibility of routing loops although
> this is minimal for end points.
> 2) Dropping packets with ttl < number_of_internal_hops may be safer but
> requires a knowledge of the internal environment and incurs an overhead
> with every internal change.
> 3) sysctl seems to provide no way to simply not send ttl expired
> messages
> 4) If the goal is simply to hide the firewall, could one just drop all
> packets where ttl == 1.

You can hide the firewall and the internal network if you reset the
TTL of these packets to the max (255) and drop the outbound ICMP
port unreachable (in case of UDP traceroute) and ICMP echo-reply
(in case of ICMP traceroute). But again, make sure you're not transit
and no-one inside is playing with stuff like MIRROR.

Ramin


> These packets would never make it only the
> internal network anyway; it does not require incrementing ttl and 
> requires no knowledge of the internal network.  I assume that, since one
> can prevent the ttl expired from being sent by incrementing, that
> netfilter will grab and drop the packet before the ttl expired
> notification is sent.  Is there a problem with this approach?
> -- 
> John A. Sullivan III
> Chief Technology Officer
> Nexus Management
> +1 207-985-7880
> john.sullivan@nexusmgmt.com
> ---
> If you are interested in helping to develop a GPL enterprise class
> VPN/Firewall/Security device management console, please visit
> http://iscs.sourceforge.net 
> 

