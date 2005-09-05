From: "Salim" <salim.si@askey.com.tw>
Subject: iptables: can't set any ip address in rules
Date: Mon, 5 Sep 2005 14:01:06 +0800
Message-ID: <005e01c5b1df$46279630$205f030a@askeyrd3>
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
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello all,
    I am not able to set any rule that contsin ip address in the =
iptables.
For example I give this command

>iptables -t -A PREROUTING -d 1.1.1.1 -j DNAT --to-destination 2.2.2.2

then, I issue the command >iptables -t nat -L.=20

the result is=20

Chain POSTROUTING (policy ACCEPT)
target           DNAT
prot              all
opt                --
source          anywhere
destination    0.0.0.0   to:0.0.0.0


I gave the command with verbose
>iptables -v -t -A PREROUTING -d 1.1.1.1 -j DNAT --to-destination =
2.2.2.2

it showed
DNAT all opt -- in * out * 0.0.0.0/0 -> 0.0.0.0 to:0.0.0.0


for any command which has an ipaddress, the ip address always is always =
takes as 0.0.0.0

I am using Redhat Linux 2.4.25
iptables v1.3.3
MIPS embedded system.

I am confused. Any help will be greatly appreciated.

regards
Salim
