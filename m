From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: block port 137
Date: Tue, 3 Aug 2004 07:15:38 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200408030715.38915.Antony@Soft-Solutions.co.uk>
References: <267354A234DF4D46AA6AE56E1240BEF004A3BF@tv.wcslnet.net> <002401c47917$d0a6fd70$858310ac@suarapembaruan.com>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <002401c47917$d0a6fd70$858310ac@suarapembaruan.com>
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

On Tuesday 03 August 2004 6:07 am, david wrote:

> Dear all,
> How to block outgoing traffic over network that using port 137 udp

iptables -I FORWARD -p udp --dport 137 -j DROP

>, because my isp tell me that my network broadcast virus using port 137 udp,
> i want to make all traffic (port 137) do go outside my network, so i plan to
> blocking that traffic from my gateway.
>
> I already try to do this rules, but not working :
> #iptables -A FORWARD -p udp -s 0/0 --dport 137 -j DROP

1. Why are you allowing UDP 137 packets through your firewall anyway?   They 
must be matching *some* rule on your machine in order to get through at all - 
of course it could be a default ACCEPT policy rule (if it is then you should 
certainly change that).

2. The rule you have suggested uses "-A" to append to the end of the ruleset - 
what are the other rules which come before it?   Presumably one of those must 
be allowing the packets through...

Show us your ruleset, tell us how you're testing.

Regards,

Antony.

-- 
"I estimate there's a world market for about five computers."

 - Thomas J Watson, Chairman of IBM

                                                     Please reply to the list;
                                                           please don't CC me.


