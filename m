From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: matching the first packet of a connection
Date: Thu, 05 May 2005 02:53:18 -0500
Message-ID: <4279D0EE.2060706@riverviewtech.net>
References: <1115220105.26791.25.camel@localhost.localdomain>	
	<4279248D.9090903@riverviewtech.net>
	<1115241663.5410.18.camel@porky>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1115241663.5410.18.camel@porky>
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

> In the scope of the NuFW project we need to queue SYN packets for
> connection we want to authenticate (see http://www.nufw.org/ for details
> on principles). For a single connection we want to QUEUE only the first
> packet coming to the firewall (SYN packet in the case of TCP). All
> subsequent packets of the connection even if they are also SYN packet
> (if for example server is unreachable or does not exist) have to me
> authorized or drop depending of the decision taken on the first packet.
> In fact this is an extension of the ESTABLISHED or RELATED match.

After doing much deliberating and research I have come up with one thing that you might be able to try:

iptables -t filter -A FORWARD -i $LAN -o $INet -m state --state NEW -m connbytes ! --connbytes 1: --connbytes-dir original --connbytes-mode packets -j QUEUE

In theory this rule will look for and match against any packet that is passing from the $LAN to the $INet with a state of NEW and has NOT seen more than one packet coming from the original sending system.  After reading about NuFW they are queuing packets via the QUEUE target.

Give this a shot and let me know what you think.



Grant. . . .

