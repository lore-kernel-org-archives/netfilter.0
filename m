From: "Patrick Ahler" <patrick@vikus.com>
Subject: Forwarding Problems
Date: Thu, 6 Mar 2003 11:56:18 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <ABEKJILKOKKGGDJKHKDFOEBGCAAA.patrick@vikus.com>
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
To: netfilter EMAIL <netfilter@lists.netfilter.org>

I have iptables FORWARD chain working except for one minor detail... after I
set all the ACCEPT rules, I want to set a drop rule/policy to the FORWARD
CHAIN as well, thus dropping all the packets I haven't accepted. The problem
is, if I use

iptables -A FORWARD -j DROP
or
iptables -P FORWARD DROP

they will drop all packets including the ones I already ACCEPTed.

example (want to allow all incoming and outgoing www traffic):
iptables -A FORWARD -p tcp -d 192.168.1.0/24 --dport 80 -j ACCEPT
iptables -A FORWARD -p tcp -d 192.168.1.0/24 --sport 80 -j ACCEPT
iptables -A FORWARD -p tcp -s 192.168.1.0/24 --dport 80 -j ACCEPT
iptables -A FORWARD -p tcp -s 192.168.1.0/24 --sport 80 -j ACCEPT
iptables -A FORWARD -j DROP

Any help is greatly appreciated


