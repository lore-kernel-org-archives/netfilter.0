From: "Andreas Grabner" <andi@vnc.at>
Subject: (no subject)
Date: Tue, 23 Nov 2004 12:31:56 +0100 (CET)
Message-ID: <51661.213.33.127.134.1101209516.squirrel@webmail.vnc.at>
Reply-To: andi@vnc.at
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hi
I have 2 connections to the Internet. The default route points to ISP1 but
my mails are comming from (to IP of) ISP2. My rules to DNAT SMTP Traffic
to an internel machine does not work (it did with only one ISP).

I think it has something todo with the routing but i dont know how to solve.

Here are my rules:
$IPTABLES -t nat -A POSTROUTING -o $EXTIFINODE -j SNAT --to $EXTIPINODE
$IPTABLES -t nat -A POSTROUTING -o $EXTIFPOST -j SNAT --to $EXTIPPOST
# for mailserver
$IPTABLES -t nat -A POSTROUTING -o $EXTIFINODE -s 192.168.100.2 -j SNAT
--to $EXTIPINODE$IPTABLES -t nat -A POSTROUTING -o $EXTIFPOST -s
192.168.100.2 -j SNAT--to $EXTIPPOST$IPTABLES -t nat -A PREROUTING -i $EXTIFINODE -d
$EXTIPINODE -s$UNIVERSE
-p tcp --dport 25 -j DNAT --to 192.168.100.2$IPTABLES -t nat -A PREROUTING -i
$EXTIFPOST -d $EXTIPPOST -s $UNIVERSE -p
tcp --dport 25 -j DNAT --to 192.168.100.2

thanks for any help
Andreas Grabner






