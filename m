From: I & L Fogg <il.fogg@bigpond.net.au>
Subject: How to get "real time" kernel updates from iptables
Date: Tue, 15 Mar 2005 01:33:30 +1000
Message-ID: <4235AECA.80305@bigpond.net.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: netfilter@lists.netfilter.org, I & L Fogg <il.fogg@bigpond.net.au>

I would appreciate any advice on the following problem (if it is, in 
fact, a problem).

I have a pretty simple situation whereby I block internet access to 
clients behind my iptables firewall until they have been properly 
authenticated.

I set up a user-defined chain 'captive' with a default rule to redirect 
traffic to a local web server (that handles the authentication)...

iptables -t nat -A captive -i eth0 -j REDIRECT

This chain is traversed from nat's PREROUTING chain...

iptables -t nat -A PREROUTING -j captive

If/once the user authenticates, a script fires and inserts a 
'short-circuit' rule into the captive chain. After completing, the 
captive chain looks like (which will allow client 192.168.1.222 to 
escape the wormhole)...

iptables -t nat -I captive -s 192.168.1.222 -j RETURN
iptables -t nat -A captive -i eth0 -j REDIRECT

The problem...

My clients need to wait 10-15 seconds before trying to access the 
internet. Shorter waits (ie, user starting to surf the web too early) 
result in a re-capture (REDIRECT), as if the 'short circuit' rule had 
never been inserted. I suspect this is being caused by delays in 
iptables updating the rule base, and the rules making it into the kernel 
(via the netlink socket???).

Is there anything I can do to reduce/eliminate the delay in getting 
updates into the kernel? I have tried an 'iptables-save | 
iptables-restore' in the hope that the COMMITs in the restore would do 
what the docs say (iptc_commit the changes to the kernel), but this 
doesn't seem to help.

I'm running iptables v 1.2.11 on a 2.6.10 kernel.

This has been bugging me for days, so I'd really appreciate any 
suggestions, of even a confirmation that there's not much I can do about 
it (the delay). In the latter case, I can set my user expectations, 
which is not my preferred course of action.

Cheers, Iain

