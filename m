From: =?ISO-8859-1?Q?J=F6rg_Harmuth?= <harmuth@mnemon.de>
Subject: Re: ftp issue cont.
Date: Mon, 15 Aug 2005 11:13:26 +0200
Message-ID: <43005CB6.6010108@mnemon.de>
References: <E656E2CC1C5AEB42ACB00EB83122C7741FCC43@farmer.vikus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <E656E2CC1C5AEB42ACB00EB83122C7741FCC43@farmer.vikus.com>
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

Derick Anderson schrieb:
> FTP passive mode creates an entirely new connection for data transfer.
> It is not 'related' to the original connection and so iptables doesn't
> pick it up as such (nor do any other stateful firewalls that I'm aware
> of). 

No, not really. Iptables regards FTP data traffic as related stuff. To
be more exactly, the respective helper module does so
(ip_conntrack_ftp.[k]o). So, normally all you have to do, is load this
module, allow ESTABLISHED,RELATED traffic in and out and allow FTP in.
This looks something like this (assumed that policies are DROP and
OUTPUT is ACCEPT and also assumed that the box is directly connected to
the internet and that the FTP server is on the firewall box):

modprobe ip_conntrack_ftp.[k]o

iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A INPUT -p tcp --dport 21 --syn -j ACCEPT

This will work for active and passive FTP. If the ftp-module isn't on
the system in question, varun_saa has to configure the kernel correctly
and recompile as needed.

BTW, the original ruleset didn't explain anything. IN|OUTPUT == ACCEPT
and in FORWARD no rule concerning FTP. So, what is this guy doing ? If
the FTP server is on the firewall box, there is no iptables problem at
all (on this box). If not, there are no rules that permit FTP and thus
it cannot work. The whole thing looks quite mysterious to me, including
the -P issue Rob mentioned. May be a tiny ASCII art network picture
would clarify the situation :)

Have a nice time,

Joerg



