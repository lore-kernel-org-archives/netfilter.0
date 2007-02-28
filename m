From: "massimo bortolan" <max.bortolan@gmail.com>
Subject: Iptables: strange way of blocking UDP traffic
Date: Wed, 28 Feb 2007 10:10:47 +0100
Message-ID: <257c9e140702280110w1a16f278gd700ae463d6fa849@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
	b=JgK6QZzfI3glFgJkpzcfW+x5pzpOjmvGpVqsRy1dj6HI81nKa/UOys34Jmr7gMlZ3s9hCH4J1jcjd3ozY0ZpgLTq9vlh9kr1COcaFGKSWVYl06CoNb52yXZBZOj9z9iX69xDAjLOmzQ071X1cHzq5oaOB58jM/PjSz8mL78uP38=
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

Hi all,

I have a strange and mysterious problem: my Nagios Server sends an
snmpgetnext to a SUN Server (at the virtual interface, IP:
10.10.10.10) and the response comes back from the real IP of the SUN
Server (IP: 10.10.10.1). The protocol involved is SNMP, so the traffic
is UDP on port 161.

The problem is that the Firewall on Nagios Server (RedHat ES 4.0) lets
pass some responses from SUN Server, and blocks some other responses.
Generally, after 20 snmpgetnext my iptables begins to act as a
firewall (:D) blocking the incoming traffic from SUN machine. After
3/4 snmpgetnext blocked, the firewall re-begins to let the traffic get
in.


The iptables file is written below:
----------------------------------------------------------------------------------------------------------------------------
*filter
:INPUT ACCEPT [0:0]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
:RH-Firewall-1-INPUT - [0:0]
-A INPUT -j RH-Firewall-1-INPUT
-A FORWARD -j RH-Firewall-1-INPUT
-A RH-Firewall-1-INPUT -i lo -j ACCEPT
-A RH-Firewall-1-INPUT -p icmp --icmp-type any -j ACCEPT
-A RH-Firewall-1-INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
-A RH-Firewall-1-INPUT -p udp -j ACCEPT --dport 162
-A RH-Firewall-1-INPUT -j LOG --log-level info --log-prefix "FIREWALL LOGDROP:"
-A RH-Firewall-1-INPUT -j REJECT --reject-with icmp-host-prohibited
COMMIT
--------------------------------------------------------------------------------------------------------------------

In your opinion, which could be the problem?

Really thank you for your help/opinion!

Max

