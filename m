From: "Danila Octavian" <octavian@service.agress.ro>
Subject: Re: Hostname with DNAT  ? {OK}
Date: Tue, 27 Jul 2004 10:54:33 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <007101c473af$108ddc60$da0da8c0@pisic>
References: <D5C9032B2B09C64EA2409D6214E91AC90511F6@asimail2.alphanumeric.com>
Reply-To: "Danila Octavian" <octavian@service.agress.ro>
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
Content-Type: text/plain; charset="us-ascii"
To: Jason Opperisano <Jopperisano@alphanumeric.com>, netfilter@lists.netfilter.org

I'm afraid i was not very explicit ...

I was trying to use strictly names and that's why :

I have only one public IP and 3 diferrent names. Behind the machine i have a
network with 4 servers which use that names :


Internet ---> eth0(public ip) eth1(private ip) ---> mail.server1.com
                                                                   --->
mail.server2.com
                                                                   --->
mail.server3.com

$IPTABLES -A PREROUTING -t nat -i eth0 -p tcp -d mail.server1.com --dport
25 -j DNAT --to 192.168.14.254:25
$IPTABLES -A FORWARD -i eth0 -p tcp -d mail1.server.com --dport 25 -j ACCEPT

$IPTABLES -A PREROUTING -t nat -i eth0 -p tcp -d mail.server2.com --dport
25 -j DNAT --to 192.168.14.251:25
$IPTABLES -A FORWARD -i eth0 -p tcp -d mail.server2.com --dport 25 -j ACCEPT

$IPTABLES -A PREROUTING -t nat -i eth0 -p tcp -d mail.server3.com --dport
25 -j DNAT --to 192.168.14.253:25
$IPTABLES -A FORWARD -i eth0 -p tcp -d mail.server3.com --dport 25 -j ACCEPT

I realized that iptables uses the resolved IP address but that's exactly
what i was trying to avoid.

Can that be possible ?

Thanks very much in advance,

Danila Octavian



-- 
This message has been scanned for viruses and
dangerous content, and is believed to be clean.
Service.Agress.Ro E-Mail Scanning Service


