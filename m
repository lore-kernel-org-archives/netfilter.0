From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: DNAT - again (minor fault .. i hope ;) )
Date: Mon, 12 Jul 2004 13:22:56 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407121322.56920.Antony@Soft-Solutions.co.uk>
References: <519AD2BA94FC6E4DB5DE078B2E37CB10B6ED05@PDBEX01E.pdb.fsc.net>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <519AD2BA94FC6E4DB5DE078B2E37CB10B6ED05@PDBEX01E.pdb.fsc.net>
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

On Monday 12 July 2004 12:54 pm, Arnauts, Bert wrote:

> Hello gurus,
>
> if I try to telnet from my 172 network to my host 172.25.239.212
> (DNAT'ed 11.0.0.48), he gives me no login. A ping on the other hand is
> working.

Well, your rules only apply to TCP packets, therefore I think the ping test 
(ICMP) is actually pinging your firewall/router, not the target machine.

> $IPTABLES -t nat -A PREROUTING -p tcp -d 172.25.239.212 -j DNAT
> --to-destination 11.0.0.48
> $IPTABLES -A FORWARD -p tcp -d 172.25.239.212 -m state --state
> ESTABLISHED,RELATED -j RULE_0
> $IPTABLES -t nat -A POSTROUTING -p tcp -d 11.0.0.48 -j SNAT --to-source
> 172.25.239.212

This is a weird combination of rules.   You are saying:

1. Any TCP packets addressed to 172.25.239.212 should go to 11.0.0.48 instead.
2. Allow all TCP packets which are addressed to 172.25.239.212 (note that they 
have by now been changed so they're actually addressed to 11.0.0.48)
3. Change any TCP packets going to 11.0.0.48 so that they're addressed *from* 
172.25.239.212 (the address we started off with in the first place!)

I recommend:

1. Change the FORWARD rule so that it:
a) allows packets 11.0.0.48
b) allows replies back again
2. Delete the SNAT rule (or if you do want to SNAT the packets for some 
reason, at least choose an address on the other side of the firewall, not the 
172 interface)
3. Check the routing on the destination machine 11.0.0.48 to make sure it can 
send the packets back again.

By the way, does the US Department of Defense (sic) know that you're using 
their addresses (11.0.0.0/8) on your network :) ?

Regards,

Antony.

-- 
Success is a lousy teacher.  It seduces smart people into thinking they can't 
lose.

 - William H Gates III

                                                     Please reply to the list;
                                                           please don't CC me.


