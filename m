From: Frans Luteijn <f.a.g.luteijn@knoware.nl>
Subject: broadcasts to other network?
Date: Tue, 21 Dec 2004 11:07:01 +0100
Message-ID: <41C7F5C5.6023137F@knoware.nl>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Dear all,

I have a little problem. I have an 3com ISDN router, which broadcasts
every 10 seconds on src-port 1025, dst-port 2071 and protocol udp.
3com has released a program that collects those broadcasts to report the
status of the router.

The log of the packets:
Dec 21 09:46:51 firewall kernel: IN=eth0 OUT=
MAC=ff:ff:ff:ff:ff:ff:08:00:4e:a6:f5:74:08:00 SRC=192.168.1.1
DST=192.168.1.255 LEN=116 TOS=0x00 PREC=0x00 TTL=64 ID=42318 PROTO=UDP
SPT=1025 DPT=2071 LEN=96

Now I want to move my computer behind my firewall and let my firewall to
forward those broadcasts.
The new situations will be:


 +----------+     +----------+     +----------+
 |  ISDN-   |     |          |     |  ADSL-   |
 |  router  |-----| firewall |-----|  router  |
 |          |     |          |     |          |
 +----------+     +----------+     +----------+
                        |
                        |
                        |
                  +----------+
                  | Internal |
                  | network  |
                  |          |
                  +----------+

What I already have done:
I have added the following rule:
iptables -t nat -I PREROUTING -s 192.168.1.1 -p udp --sport 1025 --dport
2071 -j DNAT --to 192.168.2.255

The logging changed:
Dec 21 09:42:01 firewall kernel: IN=eth0 OUT=
MAC=ff:ff:ff:ff:ff:ff:08:00:4e:a6:f5:74:08:00 SRC=192.168.1.1
DST=192.168.2.255 LEN=116 TOS=0x00 PREC=0x00 TTL=64 ID=42284 PROTO=UDP
SPT=1025 DPT=2071 LEN=96

But no packets went out, at least that I couldn't see after adding a
LOG-rule at OUTPUT and FORWARD.

Is there an easy way to solve this or do I need a relaying-program (like
dhcp)?

Greetings,
--
Frans Luteijn
PGP PblKey fprnt=C4 87 CE AF BC B6 98 C1  EF 42 A1 9A E2 C0 42 5B
GPG PblKey fprnt=ED20 0F25 C233 DC59 3FFA  170E D0BF 15F5 0BA6 1355


