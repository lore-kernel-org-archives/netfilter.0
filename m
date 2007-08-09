From: =?ISO-8859-2?Q?Jind=F8ich_Vrba?= <henly@email.cz>
Subject: ACCOUNT is accounting only 1 direction
Date: Thu, 09 Aug 2007 15:04:31 +0200
Message-ID: <46BB10DF.10600@email.cz>
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

Hello,

I tried to use ACCOUNT to see passing data and make graphs from it, but
I see only one direction.

# iptables -A FORWARD -j ACCOUNT --addr 0.0.0.0/0 --tname all
# iptaccount -l all

ipt_ACCOUNT userspace accounting tool v1.2

Showing table: all
Run #0 - 1 item found
IP: 0.0.0.0 SRC packets: 651 bytes: 375788 DST packets: 0 bytes: 0
Finished.


I understand when adding rule in INPUT or OUTPUT, it is possible to see
only one direction, but FORWARD is bidirectional.

Is this normal or only in my case?

# iptables -V
iptables v1.3.6
# iptables -j ACCOUNT -h
ACCOUNT v1.3.6 options:
# uname -r
2.6.18.8-henly-patched-20070809

Thanks,
Henly

