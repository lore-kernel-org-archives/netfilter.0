From: Taylor Grant <gtaylor@riverviewtech.net>
Subject: Re: Remapping of starcraft UDP port 6112
Date: Thu, 21 Apr 2005 23:31:27 -0500
Message-ID: <42687E1F.6020108@riverviewtech.net>
References: <001001c544af$d2bd15e0$3800a8c0@Dewasp>	<42655AC6.9080007@riverviewtech.net>
	<000901c5457c$14e461e0$3800a8c0@Dewasp>
	<4266821A.1050500@riverviewtech.net>
	<000601c54639$89ff0940$3800a8c0@Dewasp>
	<42674EFD.90803@riverviewtech.net>
	<000601c546d4$b32848e0$3800a8c0@Dewasp>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <000601c546d4$b32848e0$3800a8c0@Dewasp>
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
To: Doug C <the_wasp@game-nation.net.nz>
Cc: netfilter@lists.netfilter.org

> [root@redhat root]# iptables -t filter -L -n -v --line-numbers
> Chain INPUT (policy ACCEPT 0 packets, 0 bytes)
> num   pkts bytes target     prot opt in     out     source	destination
> 
> Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
> num   pkts bytes target     prot opt in     out     source	destination
> 
> Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
> num   pkts bytes target     prot opt in     out     source	destination
> 
> 
> 
> [root@redhat root]# iptables -t nat -L -n -v --line-numbers
> Chain PREROUTING (policy ACCEPT 50 packets, 3321 bytes)
> num   pkts bytes target     prot opt in     out     source	destination
> 
> Chain POSTROUTING (policy ACCEPT 1 packets, 108 bytes)
> num   pkts bytes target     prot opt in     out     source	destination
> 1       29  1578 MASQUERADE  all  --  *     hsb0    0.0.0.0/0	0.0.0.0/0
> 
> Chain OUTPUT (policy ACCEPT 1 packets, 108 bytes)
> num   pkts bytes target     prot opt in     out     source	destination
> 
> 
> 
> [root@redhat root]# iptables -t mangle -L -n -v --line-numbers
> Chain PREROUTING (policy ACCEPT 0 packets, 0 bytes)
> num   pkts bytes target     prot opt in     out     source	destination
> 
> Chain INPUT (policy ACCEPT 0 packets, 0 bytes)
> num   pkts bytes target     prot opt in     out     source	destination
> 
> Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
> num   pkts bytes target     prot opt in     out     source	destination
> 
> Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
> num   pkts bytes target     prot opt in     out     source	destination
> 
> Chain POSTROUTING (policy ACCEPT 0 packets, 0 bytes)
> num   pkts bytes target     prot opt in     out     source	destination
> 
> 
> 
> seems like nothing to me? also i turned off all security settings in the gui

As you say this all looks standard enough.

> windows also has the same problem. when both clients are in a game together
> the game is extrememly laggy and unplayable
> i think that this is due to some of the packets getting through while others
> arnt (or the clients are getting each others packets and dropping them)

I suspect more of the latter.  The clients are erroneously getting each other's packets and dropping them.

> cheers for all the help, i will try the developers mailing list then

*nod*  This is what the list is for.

> Doug - Linux Newb

You won't be a ""Newb by the time we get done with you.  ;)

After looking at your clean / virtually empty test IPTables set up and reviewing what is going on, I can't think of any thing other than the fact that the NATing code must be getting confused and incorrectly sending each client's packets over to the other client and vice versa.  Have you tried running a TCPDump on the internal and external interfaces while the game is playing to see if this is indeed the case?  I would hope that the sequence numbers in the packets were enough different that you could use them as a key to which system was suppose to receive which packet.  This way you could tell if the NATing code was indeed messing up somehow.  Especially if you can write NATing rules to manually control what system gets NATed to what port on the external side of the firewall.  I at least don't see any thing in your set up that could possibly explain what is happening.

Sorry to say, I think this is a situation where you need to gather as much information (TCPDump) and take it to the developers list.  I wish that I could be more help.

I do have a favor to ask though.  Would you please follow up on this list if you do find any thing else out?  That way if any one comes back and reads the mail archive later with a similar situation they will know which direction you went with this to solve it?



Thanks,

Grant. . . .

