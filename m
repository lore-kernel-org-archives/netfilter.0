From: <netfilter@sbgit.com>
Subject: Re-2: Still having problems with forwarding
Date: 15 Mar 2004 09:14:05 UT
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <DIIE.000000FC00002A63@sbgit.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7Bit
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

 
> 1. Can you be more specific about exactly what problems you are having - 
> what 
> does work, what does not work, how are you testing it?

Since i have made some changes i don't get an connection to my VPN Server,
it seems that iptables don't forwards the vpn tunnel to my internet vpn server.

i can't send any pings to the internet? 

also i can't connect to my Terminalserver.

I think the whole forwading don't works?

> 2. Is it possible that you can simplify your ruleset by removing rules 
> which 
> are nice to have, but have nothing to do with this problem (eg: the 
> rate-limited DROP rules, and the TCP flag matches), so that it is easier to 
> 
> know what to focus on, and what is unimportant?

I think i have to write a complete new firewall script, but at first i will try
to get all working what i need. 

Thanks Peter


To: Antony@Soft-Solutions.co.uk
Cc: netfilter@lists.netfilter.org


