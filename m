From: Florian Boelstler <euphoria@arcor.de>
Subject: Re: how to log dropped packet
Date: Tue, 28 Sep 2004 13:50:26 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <41595002.70706@arcor.de>
References: <web-6413785@infinito.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <web-6413785@infinito.it>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

What I usually do is:

---------------------------------------------------------------------
#!/bin/sh

# Some handy variables

IPTABLES=`which iptables`
d_HTTP="http,https"
p_high="1024:65535"
EXT="wlan0"


# DROP & LOG chain

$IPTABLES -N DROPnLOG
$IPTABLES -A DROPnLOG -p ICMP -j ULOG --ulog-nlgroup 1 --ulog-prefix
"DROP-ICMP "
$IPTABLES -A DROPnLOG -p TCP -j ULOG --ulog-nlgroup 1 --ulog-prefix
"DROP-TCP "
$IPTABLES -A DROPnLOG -p UDP -j ULOG --ulog-nlgroup 1 --ulog-prefix
"DROP-UDP "


# Default rule for established connections

$IPTABLES -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT


# Put several rules to allow outgoing traffic here. E.g. for web sites:

$IPTABLES -A OUTPUT -o $EXT -m state --state NEW -p TCP --sport $p_high
-m multiport --destination-ports $d_HTTP -j ACCEPT


# Wipe anything not matching any of the rulesets above

$IPTABLES -A INPUT -j DROPnLOG
$IPTABLES -A FORWARD -j DROPnLOG
$IPTABLES -A OUTPUT -j DROPnLOG

---------------------------------------------------------------------


The script above requires that you're kernel is aware of the ULOG target.
This allows to log iptable's output to another destination (i.e. file)
than syslog.
You will need an appropriate ULOG configuration file.

The output will look like this:
Jan  1 01:00:00 beamstation DROP-UDP  IN= OUT=wlan0 MAC=
SRC=192.168.2.100 DST=192.168.2.255 LEN=268 TOS=00 PREC=0x00 TTL=64 ID=8
DF PROTO=UDP SPT=138 DPT=138 LEN=248


Good luck,

   Florian







