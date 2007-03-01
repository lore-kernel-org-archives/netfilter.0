From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: Blocking direct private IP address
Date: Thu, 1 Mar 2007 13:51:18 +0100 (MET)
Message-ID: <Pine.LNX.4.61.0703011343580.23355@yvahk01.tjqt.qr>
References: <BAY119-F39A4E5F3A07FF3275AC4E0D6800@phx.gbl>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY119-F39A4E5F3A07FF3275AC4E0D6800@phx.gbl>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Kraslavsky <andykras@hotmail.com>
Cc: netfilter@lists.netfilter.org


On Feb 28 2007 20:49, Andrew Kraslavsky wrote:

> The DNAT rule is wokring as I expect it to -- it exposes the private Web
> server at 192.168.0.99 to the public network as if its address was
> 10.0.0.1.  Meaning, folks surfing to http://10.0.0.1 are actually being
> serviced by the Web server at 192.168.0.0.99.
>
> My focus here is really on how to differentiate traffic that gets
> DNATted from 10.0.0.1 to 192.168.0.99 from traffic that was actually
> directly addressed to 192.168.0.99.

You cannot really. (There is stuff like CLUSTERIP and OpenVZ, and all
that, but I guess that goes beyond the scope of ease.)

> In both cases, by the time the packet arrives in the filter table FORWARD
> chain, the destination is simply 192.168.0.99, there is no trace of the
> original pre-DNAT IP address, if any....at least, that is where I got stuck
> anyway.

10.0.0.1# iptables [-t mangle] -A FORWARD -d 192.168.0.99 -m conntrack
	  --ctorigdst 10.0.0.1 [-j MARK ...]

would be one rule to match such. However, I don't see how that would help
0.99 identify a packet as being DNATed by a box before it.

> I hope that explains it a bit more clearly.

Coming along, but still fuzzy.

> The approach I am playing with at the moment is to add a rule in the
> mangle table PREROUTING chain that marks any packets that show up from
> eth0 that are not addressed to 10.0.0.1.  Then, in the filter table
> FORWARD chain, I added rules to test for that mark and log and drop any
> packets that match.

The only thing that get forwarded are the packets DNATed to 0.99:80. So
your DROP rule would never match anything. Or so.



Jan
-- 

