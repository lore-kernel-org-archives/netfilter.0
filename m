From: "azeem ahmad" <azeem484@hotmail.com>
Subject: Re: ftp
Date: Fri, 21 May 2004 02:49:17 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <BAY15-F7JmGzrLCCtgx00008f99@hotmail.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org




>From: Antony Stone <Antony@Soft-Solutions.co.uk>
>Reply-To: netfilter@lists.netfilter.org
>To: netfilter@lists.netfilter.org
>Subject: Re: ftp
>Date: Thu, 20 May 2004 21:31:06 +0100
>
>On Thursday 20 May 2004 9:10 pm, azeem ahmad wrote:
>
> > no single server of ftp is accessible. wheather any server is near to me 
>or
> > far away if it is ftp then it isnt accessible from my network.
>
>Okay - now that I clearly understand the problem, please post the output 
>of:
>
>iptables -L -nvx; iptables -L -t nat -nvx
>
> > and may i have ur collection of quotes
>
>Sure - they are all available from
>http://lists.netfilter.org/pipermail/netfilter or
>http://lists.netfilter.org/pipermail/netfilter.mbox/netfilter.mbox (which 
>is
>quite a large file, but they're all in there somewhere).
>
>Regards,
>
>Antony.
>
>--
>In Heaven, the police are British, the chefs are Italian, the beer is 
>Belgian,
>the mechanics are German, the lovers are French, the entertainment is
>American, and everything is organised by the Swiss.
>
>In Hell, the police are German, the chefs are British, the beer is 
>American,
>the mechanics are French, the lovers are Swiss, the entertainment is 
>Belgian,
>and everything is organised by the Italians.
>

it is a very simple firewall with only one rule as
iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
any ways the outout of the two commands is as follow

iptables -L -nvx
--------------------------------------------------------------------------------------------------------------------------------------
Chain INPUT (policy ACCEPT 64966 packets, 22320338 bytes)
    pkts      bytes target     prot opt in     out     source               
destination

Chain FORWARD (policy ACCEPT 48691 packets, 11603504 bytes)
    pkts      bytes target     prot opt in     out     source               
destination

Chain OUTPUT (policy ACCEPT 154653 packets, 66215691 bytes)
    pkts      bytes target     prot opt in     out     source
-----------------------------------------------------------------------------------------------------------------------------------------

iptables -L -t nat -nvx
-----------------------------------------------------------------------------------------------------------------------------------------
Chain PREROUTING (policy ACCEPT 9221 packets, 586315 bytes)
    pkts      bytes target     prot opt in     out     source               
destination

Chain POSTROUTING (policy ACCEPT 2693 packets, 178591 bytes)
    pkts      bytes target     prot opt in     out     source               
destination
       0        0 MASQUERADE  all  --  *      ppp0    0.0.0.0/0            
0.0.0.0/0

Chain OUTPUT (policy ACCEPT 6008 packets, 382374 bytes)
    pkts      bytes target     prot opt in     out     source               
destination
-----------------------------------------------------------------------------------------------------------------------------------------

i m showing you the different firewall rules in different questions beacuse 
i m a student and i m working on firewall these days. but wheni try to 
access ftp then only this single rule works nothing else has been added.

Regards
Azeem

_________________________________________________________________
Add photos to your messages with MSN 8. Get 2 months FREE*. 
http://join.msn.com/?page=features/featuredemail


