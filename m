From: "Matthias F. Brandstetter" <haimat@lame.at>
Subject: how to forward traffic to MS Exchange?
Date: Mon, 7 Jun 2004 13:11:55 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406071311.55915.haimat@lame.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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
To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

Hi all,

I am using netfilter based firewalls sind several years now w/o any 
problems, same goes for netfilter based NAT.

Now I want to forward all incoming traffic on smtp port 25 on a gateway to 
an intern MS Exchange mailserver, so I tried to use this rule, as allways:

$IPTABLES -t nat -A PREROUTING -i $E_NIC -p tcp --dport 25 -j DNAT 
--to-destination 192.168.120.10:25

(where $IPTABLES is the iptables binary, and $E_NIC is extern NIC "ppp0")

I never had any problems with this rule, and I use the same with http port 
80 for MS Exchange webserver on the same net, w/o any problems.

But: After activating this rule and connectiong via telnet to port 25 on 
external address, I can connect to Exchange server, but connection 
immedeately is dropped afterwards (I get the "Connected to ..." and 
"Escape character is '^]'." lines, but after that a "Connection lost").

When I disable this rule and use rinetd [1] to forward smtp traffic 
instead, I get no errors and can connect to the Exchange server via 
telnet.

So my question: Is this an iptables or an Exchange issue? Do I have to 
provide another rule or change my existing rule to be able to connect to a 
MS Exchange server? I don't think it's an Exchange problem, since 
everything is ok when I use rinetd, as said.

Hopefully someone can help me, I have no ideas left :(
Greetings and TIA, Matthias

footnote:
[1] http://www.boutell.com/rinetd/

-- 
Mmm...incapacitating.

       		-- Homer Simpson
		   The Springfield Connection

