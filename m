From: alaadin@alaadin.org
Subject: how to prevent a user from accessing the inernet from my machine
Date: Wed, 8 Sep 2004 05:29:04 +0300 (EEST)
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1321.81.10.7.114.1094610544.squirrel@81.10.7.114>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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

Hello,

if i have a user on my machine

and i do not want him to access the internet from my machine ..

how can this be done ?

when i do

[root@Shell iptables-1.2.11]# iptables -A OUTPUT --uid-owner
his-number-uid -d 0/0 -j DROP

iptables v1.2.11: Unknown arg `--uid-owner'
Try `iptables -h' or 'iptables --help' for more information.

it gives me this error .. ?


