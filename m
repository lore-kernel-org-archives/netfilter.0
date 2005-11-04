From: "amir amire" <a31r@hotmail.com>
Subject: would like advice on paranoid host-based iptables rules
Date: Fri, 04 Nov 2005 23:41:08 +0000
Message-ID: <BAY108-F34E600F7B51506D9C1E859DE600@phx.gbl>
Mime-Version: 1.0
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I need to run the script again after the ip-address supplied by the 
cablemodem is changed to the comcast address. Is there a way to supply the 
new address automatically? Besides that is works OK.

What would be the most paranoid host based iptables ruleset you can have and 
still get access to the web and dhcp and whatever else those two things 
need?

#!/bin/sh
IPT='/sbin/iptables'
IN='-A INPUT'
OUT='-A OUTPUT'
ALLOW='-j ACCEPT'
BLOCK='-j DROP'
STATE='-m state --state'
EXTADDR=`ifconfig eth0 | awk '/inet addr/ { gsub(".*:", "", $2) ; print $2 
}'`
$IPT -F
$IPT -P INPUT DROP
$IPT -P FORWARD DROP
$IPT -P OUTPUT DROP
$IPT $IN $STATE INVALID,NEW $BLOCK
$IPT $IN $STATE ESTABLISHED -i eth0 -d $EXTADDR -s ! $EXTADDR $ALLOW
$IPT $IN $BLOCK
$IPT $OUT $STATE INVALID $BLOCK
$IPT $OUT $STATE NEW,ESTABLISHED -o eth0 -s $EXTADDR  -d ! $EXTADDR $ALLOW
$IPT $OUT $BLOCK

_________________________________________________________________
Express yourself instantly with MSN Messenger! Download today - it's FREE! 
http://messenger.msn.click-url.com/go/onm00200471ave/direct/01/


