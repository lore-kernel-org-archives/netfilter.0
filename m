From: "Anatoly Y." <snelius@tsu.ru>
Subject: Re: Questions about DHCP firewall rules
Date: Sat, 12 May 2007 11:03:52 +0700
Message-ID: <46453CA8.3010101@tsu.ru>
References: <729129.22320.qm@web83819.mail.sp1.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <729129.22320.qm@web83819.mail.sp1.yahoo.com>
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
Cc: netfilter@lists.netfilter.org

Timestamp: Sat 12 May 2007, 11:03 +0700 (NOVT)
Nicholas Kline wrote:
> Greetings,
> 
> I am in the process of learning Netfilter/IPtables.  I
> plan on using Netfilter/IPtables to protect my Linux
> desktop computers and servers.  We're talking
> host-based firewalls, not one firewall protecting all
> of the desktops and servers.
> 
> I have a basic question I am hoping someone on this
> mailing list can answer.  I am a little confused about
> configuring Netfilter/IPtables on a Linux desktop
> computer.  Specifically, this situation:
> 
> a linux desktop computer that is configured to use
> DHCP
> and configured to use the following rule:
> 
> $IPTABLES -A INPUT -s $IP_LOCAL -j LOG --log-prefix
> "Spoofed source IP"
> $IPTABLES -A INPUT -s $IP_LOCAL -j DROP
> 
> I would like to include the previous rule as part of a
> standard rule set.
> 
>>From how I understand this situation, the firewall
> would have to be able to automatically detect when the
> computers IP address changes, right?  Manually
> inputting the computers IP address each time it
> changes would get really old.
> 
> I'm using several books as references for learning
> Netfilter/IPtables and they discuss implementing
> "dynamic firewall scripts".  In this case, a dynamic
> firewall script that recognizes when the computers IP
> address changes.
> 
> So, my questions are:
> 
> 1.) If I am using a computer that is configured to
> obtain its IP address through DHCP, what firewall
> rules do I need to setup?
> 
> 2.) Additionally, how do I configure the firewall to
> automatically detect changes in the computers network
> configuration (IP address change, etc.)?

Use full prefix of all fake networks (or your only).
-A INPUT -s 192.168.0.0/16 -j LOG .... for example.

-- 
Anatoly Y. aka Snelius | AY254-RIPE

