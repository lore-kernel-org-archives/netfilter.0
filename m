From: "Stoycho Sleptsov" <stoycho@cds-bg.com>
Subject: eth1 answers SYN/ACK to SYNs dedicated for eth0. Why?
Date: Thu, 16 Dec 2004 01:07:09 +0200
Message-ID: <006401c4e2fa$cdd164d0$3001a8c0@cpcss>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@lists.netfilter.org

Hi.

I am new to iptables , so excuse me in advance for any strange
terminologies.

I have the following configuration:
an external IP assigned to eth0.
192.168.0.1 assigned to eth1.
ip_forward set to 1.
sshd waiting on 22.

iptables:

*filter
:INPUT DROP
:FORWARD DROP
:OUTPUT ACCEPT

-A INPUT -i eth1 -j ACCEPT
-A FORWARD -i eth1 -j ACCEPT
-A INPUT -i lo ACCEPT
-A FORWARD -i lo ACCEPT

-A INPUT -i eth0 -m state --state ESTABLISHED,RELATED -j ACCEPT
-A FORWARD -i eth0 -m state --state ESTABLISHED,RELATED -j ACCEPT

COMMIT

*nat

-A POSTROUTING -s 192.168.0.0/24 -o eth0 -j SNAT --to ext.ern.ip

COMMIT

... and suddenly external people are receiving the ssh login (sometimes, not
always).
after several loggings I saw that SYN on 22 to ext.ern.ip is accepted and
answered by eth1.
and after is translated and accepted as ESTABLISHED by eth0 in the filter
part of iptables.

is this normal?

For now I found some workaround in the nat:
-A PREROUTING -d ext.ern.ip -s ! 192.168.0.0/24 -i eth1 -m state --state
NEW -j DROP

but maybe I have to do something completely different to even not receive
this strange effect?

Thanks alot,
Stoycho



