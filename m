From: "Salim" <salim.si@askey.com.tw>
Subject: Re: iptables: can't set any ip address in rules
Date: Wed, 7 Sep 2005 15:36:52 +0800
Message-ID: <017c01c5b385$3f7bfe00$205f030a@askeyrd3>
References: <005e01c5b1df$46279630$205f030a@askeyrd3>
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

this issue has been solved. seems like 'unsigned long long' doesn't work on
my system. changed 'strtoull' to 'strtoul'. Now it looks okay.
thanks for all who have spent time on my question.

----- Original Message -----
From: "Salim" <salim.si@askey.com.tw>
To: <netfilter@lists.netfilter.org>
Sent: Monday, September 05, 2005 2:01 PM
Subject: iptables: can't set any ip address in rules


Hello all,
    I am not able to set any rule that contsin ip address in the iptables.
For example I give this command

>iptables -t -A PREROUTING -d 1.1.1.1 -j DNAT --to-destination 2.2.2.2

then, I issue the command >iptables -t nat -L.

the result is

Chain POSTROUTING (policy ACCEPT)
target           DNAT
prot              all
opt                --
source          anywhere
destination    0.0.0.0   to:0.0.0.0


I gave the command with verbose
>iptables -v -t -A PREROUTING -d 1.1.1.1 -j DNAT --to-destination 2.2.2.2

it showed
DNAT all opt -- in * out * 0.0.0.0/0 -> 0.0.0.0 to:0.0.0.0


for any command which has an ipaddress, the ip address always is always
takes as 0.0.0.0

I am using Redhat Linux 2.4.25
iptables v1.3.3
MIPS embedded system.

I am confused. Any help will be greatly appreciated.

regards
Salim


