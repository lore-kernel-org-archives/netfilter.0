From: "hare ram" <hareram@sol.net.in>
Subject: Problem with ULOG
Date: Tue, 11 Mar 2003 16:36:40 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <019501c2e7be$4b5bb8e0$13fcc5cb@Housecall>
Reply-To: "hare ram" <hareram@sol.net.in>
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

Hi all

Iam setting up a Bridge in my campus
and try to log using ULOG to mysql

Bridge setup working fine, but iam not able to Log using Ulog to mysql

when i try to use this script iam able to log with interface oob_in oob_out
called in database br0

$IPTABLES  -F
$IPTABLES -F -t nat
$IPTABLES -F -t filter

$IPTABLES -I INPUT -j ULOG --ulog-nlgroup 1 --ulog-cprange 48 \
        --ulog-qthreshold 50 --ulog-prefix "EXT_IN"

$IPTABLES -I OUTPUT -j ULOG --ulog-nlgroup 1 --ulog-cprange 48 \
        --ulog-qthreshold 50 --ulog-prefix "EXT_OUT"

$IPTABLES -I FORWARD -j ULOG --ulog-nlgroup 1 --ulog-cprange 48 \
        --ulog-qthreshold 50 --ulog-prefix "FORWARD"


----

when i use

$IPTABLES  -F
$IPTABLES -F -t nat
$IPTABLES -F -t filter

$IPTABLES -I INPUT -i eth1 -j ULOG --ulog-nlgroup 1 --ulog-cprange 48 \
        --ulog-qthreshold 50 --ulog-prefix "EXT_IN"

$IPTABLES -I OUTPUT -o eth1 -j ULOG --ulog-nlgroup 1 --ulog-cprange 48 \
        --ulog-qthreshold 50 --ulog-prefix "EXT_OUT"

$IPTABLES -I INPUT -i eth0 -j ULOG --ulog-nlgroup 1 --ulog-cprange 48 \
        --ulog-qthreshold 50 --ulog-prefix "INT_IN"

$IPTABLES -I OUTPUT -o eth0 -j ULOG --ulog-nlgroup 1 --ulog-cprange 48 \
        --ulog-qthreshold 50 --ulog-prefix "INT_OUT"

$IPTABLES -I FORWARD -j ULOG --ulog-nlgroup 1 --ulog-cprange 48 \
        --ulog-qthreshold 50 --ulog-prefix "FORWARD"

iam not able to see the interface traffic at all, its only capturing the br0
interface only

any help will be greate

hare


