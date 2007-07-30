From: Ludovic <ludovic.mailinglist@gmail.com>
Subject: Problem with ROUTE target
Date: Mon, 30 Jul 2007 09:29:20 +0200
Message-ID: <2cb453e80707300029m341a5afap295e775ea0572e7c@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
	b=cX+Qt63zRKjaTIPMmMWeeT7uI8ZecSaDRZctnqURfp1nT6NynPRYtyi7SuyuziWE2UhWWSn95clwbcNX6N8M0cWB85ORJ6pwOYfsWSfvORC70iX7mNK4O/wDrIB97xyljoVmJDw616znxqaW4z/pzpkSPE8bnLNkz26DjP3AvUg=
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
To: netfilter@lists.netfilter.org

Hi all,

i'm using kernel 2.6.21.5 and iptables 1.3.7. I have patched it with
patch-o-matic in order to have the ROUTE target but it doesn't work:

root@linux:~ $ iptables -t mangle -A POSTROUTING -d 10.8.0.6 -j ROUTE --oif tun0
iptables: No chain/target/match by that name

root@linux:~ $ ll /lib/iptables/ | grep ROUTE
12 -rwxr-xr-x 1 root root  8216 Jul 26 17:55 libipt_ROUTE.so

root@linux:~ $ iptables -j ROUTE --help
iptables v1.3.7

Usage: iptables -[AD] chain rule-specification [options]
       iptables -[RI] chain rulenum rule-specification [options]
       iptables -D chain rulenum [options]
       iptables -[LFZ] [chain] [options]
       iptables -[NX] chain
       iptables -E old-chain-name new-chain-name
       iptables -P chain target [options]
       iptables -h (print this help information)
...
...
ROUTE target v1.11 options:
    --oif       ifname          Route packet through `ifname' network interface
    --iif       ifname          Change packet's incoming interface to `ifname'
    --gw        ip              Route packet via this gateway `ip'
    --continue                  Route packet and continue traversing the
                                rules. Not valid with --iif or --tee.
    --tee                       Duplicate packet, route the duplicate,
                                continue traversing with original packet.
                                Not valid with --iif or --continue.

root@linux:~ $ lsmod
Module                  Size  Used by
ipt_ROUTE               3760  0

root@linux:~ $ iptables -t mangle -A POSTROUTING -d 10.8.0.6 -j ROUTE
iptables v1.3.7: ROUTE target: oif, iif or gw option required
Try `iptables -h' or 'iptables --help' for more information.

I don't really understand why it doesn't work because it displays help
message and it fail if i don't give good arguments when running
iptables with ROUTE target.

What can i do to find where my problem is ?

Thanks a lot for your help.

Ludovic.

