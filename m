From: Tasha Smith <tashamaillist@yahoo.com>
Subject: Re: Trying to setup EMULE and IIS on LAN machine, behind firewall.
Date: Sat, 21 Jun 2003 23:27:11 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030622062711.49740.qmail@web80501.mail.yahoo.com>
References: <OF5E019209.0D837F1C-ON80256D4A.002AE9A2@start-global.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <OF5E019209.0D837F1C-ON80256D4A.002AE9A2@start-global.com>
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
Content-Transfer-Encoding: 7bit
To: richardo@start-global.com, netfilter@lists.netfilter.org

Hi Guys....

Well after playing around with some RULES and EMULE not working properly...i tryed
this combination....and it worked! I got a "HIGH ID" for those of you using EMULE
here it is for future reference.  Im not saying it is right or not sure how secure
this is...Soo any feedback would be good -Suggestions- 
Well here the end part of my SCRIPT where i added the rules...for port 4662 and
stuff!
####################################################################################
#My rules for EMULE;
$iptables -A INPUT -p tcp --dport 4662 -j ACCEPT  <------
$iptables -A OUTPUT -p tcp --sport 4662 -j ACCEPT  <------
$iptables -t nat -A PREROUTING -d $IP_INET -p tcp --dport 4662 -j DNAT --to
192.168.0.69:4662  <------
#These are my Forwarding rules.
$iptables -A FORWARD -i eth1 -p tcp --dport 80 -j ACCEPT
$iptables -A FORWARD -i eth1 -p tcp -m multiport --dport 25,80,110,443 -j ACCEPT
$iptables -A FORWARD -i eth1 -p tcp --dport 21 -j ACCEPT
$iptables -A FORWARD -i eth1 -p tcp --dport 1863 -j ACCEPT
$iptables -A FORWARD -i eth1 -p tcp --dport 1214 -j ACCEPT
$iptables -A FORWARD -i eth1 -p udp --dport 1214 -j ACCEPT
$iptables -A FORWARD -i eth1 -p tcp -m multiport --dport 4242,4661,4662 -j ACCEPT
<---
$iptables -A FORWARD -i eth1 -p udp -m multiport --dport 4661,4662,4772 -j ACCEPT
<---
$iptables -A FORWARD -p tcp --dport 4662 -i eth0 -o eth1 -j ACCEPT  <-----
$iptables -A FORWARD -p udp --dport 4662 -i eth0 -o eth1 -j ACCEPT   <-----
####################################################################################

Does it make sense or did i open up a "HOLE" !!!

Tasha@---<------




__________________________________
Do you Yahoo!?
SBC Yahoo! DSL - Now only $29.95 per month!
http://sbc.yahoo.com

