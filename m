From: "B H R Balaji" <balaji@sol.net.in>
Subject: problem with bridge+iptables+ulog
Date: Wed, 12 Mar 2003 12:50:31 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <066a01c2e867$dd94fec0$13fcc5cb@Housecall>
Reply-To: "B H R Balaji" <balaji@sol.net.in>
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
To: netfilter@lists.samba.org
Cc: Antony Stone <Antony@Soft-Solutions.co.uk>

Hi all

some one can help i have the following setup

x.x.x.1/24            x.x.x.2/24
   +------+                               +------+
  | Router A |------+ +---------| PC B |
   +------+              | |              +------+
                              | |
                        eth0| | eth1
                          +-----+
                            | qos | (br0 =3D x.x.x.3/24)
                          +-----+



Router A is connected to internet
QOS box running with bridge
PC B is my LAPTOP

iam try to make the ULOG usig the following command


$IPTABLES -I INPUT -i eth1 -j ULOG --ulog-nlgroup 1 --ulog-cprange
   --ulog-qthreshold 50 --ulog-prefix "EXT_IN"

iam not able to see any LOG here in my LOG file

when i do this with out  interfce

$IPTABLES -I INPUT  -j ULOG --ulog-nlgroup 1 --ulog-cprange
   --ulog-qthreshold 50 --ulog-prefix "EXT_IN"

iam able to see some logs using BR0

how can i get the logs from eth0 and eth1

any suggestion will be great

hare




