From: Jim Carter <jimc@math.ucla.edu>
Subject: Re: DNAT
Date: Mon, 8 Sep 2003 15:20:01 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.53.0309081513060.2853@xena.cft.ca.us>
References: <19331451164.20030908164015@guest.arnes.si>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <19331451164.20030908164015@guest.arnes.si>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nejc Skoberne <nejc.skoberne@guest.arnes.si>
Cc: netfilter@lists.netfilter.org

On Mon, 8 Sep 2003, Nejc Skoberne wrote:
> I have a problem with DNAT. I want to set up portforwarding. In local
> network I have two servers and workstations. One (main) server is listening
> at some port, let's say 4444. The other one also acts like a gateway
> to internet and I set up a portforwarding like this:
>
> iptables -A PREROUTING -p tcp --dport 4444 -j DNAT --to 192.168.1.1:4444
>
> where 192.168.1.1 is the IP of the main server which runs the service.
> If I try to connect from outside, everything works fine. If I try to
> connect from one of workstations to the gateway machine to port 4444,
> nothing happens. tcpdumps shows just requests but no answers. Why
> doesnt DNAT work also for local IP addresses?

I'm assuming that the internal client has an address like 192.168.1.x.
Generally if a packet goes out the same interface it came in, that
indicates that something nasty is going on, but in your case "that's not a
bug, that's a feature".  I seem to remember a specific prohibition against
mirror-style routing (maybe for a different OS), but I looked in
/usr/src/linux/Documentation/filesystems/proc.txt and failed to find where
it could be enabled and disabled.

Can someone comment on whether this prohibition is present in Linux, and
how to configure it?

James F. Carter          Voice 310 825 2897    FAX 310 206 6673
UCLA-Mathnet;  6115 MSA; 405 Hilgard Ave.; Los Angeles, CA, USA 90095-1555
Email: jimc@math.ucla.edu  http://www.math.ucla.edu/~jimc (q.v. for PGP key)

