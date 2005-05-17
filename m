From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: SSH Brute force attacks
Date: Tue, 17 May 2005 10:21:25 -0500
Message-ID: <428A0BF5.1080603@riverviewtech.net>
References: <427B93EE.3030905@eccotours.dyndns.org>	<427C4EA3.5090501@riverviewtech.net>	<4281FC1A.8090000@eccotours.dyndns.org>	<42824D1E.7040508@riverviewtech.net>	<4285C016.2060900@wp.pl>	<42864CA9.7050802@riverviewtech.net>	<428856F8.60706@wp.pl>	<Pine.LNX.4.61.0505162103070.3744@e-smith.charlieb.ott.istop.com>	<42897A5E.7010401@wp.pl>	<42897EE5.90703@wp.pl>	<42898402.10507@eccotours.dyndns.org>
	<4289E72F.7020901@wp.pl> <4289EF97.2060009@eccotours.dyndns.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4289EF97.2060009@eccotours.dyndns.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

> I managed to get TARPIT in my kernel.
> But I decided it against using it.
> 
> Doesnt TARPIT use / create unnecessary overhead

No, quite the contrary TARPIT takes a connection directly in to the connected state (SYN, SYN-ACH, ACH-ACH) and releases all resources used in the kernel for the connection to prevent a resource DoS on your system.  The only thing that you need to be aware of is that if you are using connection tracking that conntrack will by default keep track of any connection that you TARPIT.  To get arround this I would recommend that you match the traffic that you are wanting to TARPIT in the raw table PREROUTING chain and send it to the NOTRACK target to prevent connection tracking from consuming resources.

Here is a snipit from the kernel source about TARPIT:

"Adds a TARPIT target to iptables, which captures and holds incoming TCP connections using no local per-connection resources.  Connections are accepted, but immediately switched to the persist state (0 byte window), in which the remote side stops sending data and asks to continue every 60-240 seconds.  Attempts to close the connection are ignored, forcing the remote side to time out the connection in 12-24 minutes."

I sent a new version of the original script to the list early this morning that fixed some (major (gulp)) gubs.  I'll take a look at it again and see if I can't incorporate some code that will catch the traffic in the raw table's PREROUTING chain to be able to NOTRACK the traffic.



Grant. . . .

