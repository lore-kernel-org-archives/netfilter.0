From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: Dropping RST of SYN
Date: Mon, 08 Sep 2003 06:02:06 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F5C539E.8030704@chrisbrenton.org>
References: <20030904183027.9CC5.ATNAK@chejz.com> 	<1062666800.1615.23.camel@kermit> <1063000297.827.26.camel@india.nsecure.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Dharmendra.T" <dharmu@nsecure.net>
Cc: Ralf Spenneberg <lists@spenneberg.org>, Atsushi Nakagawa <atnak@chejz.com>, Netfilter <netfilter@lists.netfilter.org>

Dharmendra.T responded:
 >
> On Thu, 2003-09-04 at 14:43, Ralf Spenneberg wrote:
> 
> /Am Don, 2003-09-04 um 10.50 schrieb Atsushi Nakagawa:///
> /> What iptables table/rule can I use to drop RST (TCP) packets that're in///
> /> reply to SYN?///
> /> This is what I want it to do:///
> /> ///
> /> -SYN->    [NEW]        -SYN->///
> />           [CLOSED]     <-RST-///
> />             ^///
> />           IF TCP & [NEW]: DROP '<-RST-' & SET [CLOSED]///

> Blocking the RST packets on the firewall is not recommended. If the 
> attacker comes to know that the server is dropping RST packets then he 
> can flood the servers by initiating lacks of connections, which inturn 
> result closewait state.

Ya know, I missed this the first time through but Dharmendra is 
absolutely right. This will make you far more susceptible to SYN flood 
attacks.

It is extremely rare for a system to generate a RST immediately after a 
SYN. The only time I've seen this in the wild are:

Load balancers
Port scanners
Response to SYN flood fallout

With a SYN flood attack, the attacker spoofs someone else's address 
space when they send you the SYN. You reply with a SYN/ACK which gets 
routed to the legitimate system. Since the true system did did not 
originate the session, it has no idea why you are sending it a SYN/ACK 
and responds with a RST. This clears your connection queue of the bogus 
entry. If you where to block this RST packet, the entry would stay in 
queue for a longer period of time (2 minutes or more) leaving less 
memory to handle legitimate connection attempts.

So I totally agree with Dharmendra. Blocking these packets is a real bad 
idea and would make it much easier for an attacker to knock your host 
off-line.

HTH,
C


