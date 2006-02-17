From: Mark-Walter@t-online.de
Subject: IPT Output packet died
Date: Fri, 17 Feb 2006 12:14:26 +0100
Message-ID: <20060217111426.GB1183@server.homelinux.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi,

I'am using the simple rc.firewall script from Oscar Andreason.

From time to time the log rule next to the output section show's this:

Feb 17 10:59:01 gerry kernel: IPT OUTPUT packet died: IN= OUT=eth0
SRC=192.168.0.1 DST=217.89.23.137 LEN=61 TOS=0x00 PREC=0x00 TTL=64
ID=19170 DF PROTO=UDP SPT=32769 DPT=53 LEN=41

The destination ip is the bind process of my provider.

What have I to change to avoid this logging ?

Here are some rules for the OUTPUT section:

$IPTABLES -A OUTPUT -p ALL -s $LO_IP -j ACCEPT
$IPTABLES -A OUTPUT -p ALL -s $LAN_IP -j ACCEPT
$IPTABLES -A OUTPUT -p ALL -s $INET_IP -j ACCEPT

As far as I understand all protocol's are allowed.

I've uncommented in the allowed chain the port 53 without any success.

$IPTABLES -A udp_packets -p UDP -s 0/0 --destination-port 53 -j ACCEPT

It's still logging ...

-- 
Best Regards,

Mark

