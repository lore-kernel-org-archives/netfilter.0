From: "zze-NORMAND Nicolas RD-MAPS-ISS" <nicolas.normand@rd.francetelecom.com>
Subject: Problem with the target QUEUE and the module state with the UDP
	protocol
Date: Fri, 2 Sep 2005 18:58:14 +0200
Message-ID: <BAF83494CE653943A97B9F755016A06601A4148C@ftrdmel1.rd.francetelecom.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi all,

I have a problem with tracking UDP into the target QUEUE ...

I know that UDP is non connected protocol, but I would like to get in
the target QUEUE each first
packet of a UDP "connection". I have 3 computers running linux. The
architecture I use is the following :

192.168.0.1 ---------------- Ethernet Bridge ------------- 192.168.0.2

First I enter the rule "iptables -t nat -A PREROUTING -p udp -d
192.168.0.1 -m state --state NEW -j LOG"
and I execute the command from 192.168.0.2 "nc -u 192.168.0.1 12345" and
type some text.
I have a look on the /var/log/syslog and there is only the first packet
which is logged.

I add the rule "iptables -t nat -A PREROUTING -p udp -d 192.168.0.1 -m
state --state NEW -j QUEUE" which
is exactly the same that the previous, but the target is QUEUE ...
and I execute again the command from 192.168.0.2 "nc 192.168.0.1 12346"
and type some text.
And here is the problem : all the packets are logged into
/var/log/syslog ... why ?

I want netfilter to get only the first udp packet of a "session" into
the target QUEUE ...
It works with the target LOG ... why not with the target QUEUE ????

Thx for helping me
Nicolas
