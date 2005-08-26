From: Clemens Eisserer <linuxhippy@gmail.com>
Subject: Re: Two network cards - routing and iptables
Date: Fri, 26 Aug 2005 17:31:19 +0200
Message-ID: <194f625505082608313b473358@mail.gmail.com>
References: <2F75680A268354469586578F0712182AB552D4@CXOEXC12.AMERICAS.CPQCORP.NET>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <2F75680A268354469586578F0712182AB552D4@CXOEXC12.AMERICAS.CPQCORP.NET>
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

Hello again and thanks a lot for answering me,

>    For issue 1, perhaps you are blocking ICMP traffic on eth1?
No, I do not block anything as far as I know regarding ICMP.

This configuration I use for iptables:
echo 1 >/proc/sys/net/ipv4/ip_forward
iptables -t nat -A POSTROUTING -s 192.168.0.0/24 -j MASQUERADE
iptables -t filter -A INPUT -s 192.168.0.0/24 -j ACCEPT
iptables -t filter -A INPUT -s 192.168.1.0/24 -j ACCEPT
iptables -t filter -A INPUT -p tcp --dport \! 8901 -j DROP

btw. do you know why I cannot connect to the internet from localhost
if I set the last line?
I tried to set -s !127.0.0.1 but this also seems to not work :-(

>    For issue 2, ip_forward needs to be set to a 1 (not part of
> iptables).
>=20
> Take Care!
Is this really anything I need to do since I already set it to 1

Hope I am not nerving,

thank you in advance, lg Clemens

