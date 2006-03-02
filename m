From: Jorge Davila <davila@nicaraguaopensource.com>
Subject: Re: Help - iptables: Invalid argument
Date: Wed, 01 Mar 2006 20:48:48 -0600
Message-ID: <1141267729.2717.16.camel@davila.nicaraguaopensource.com>
References: <274D46DDEB9F2244B2F1EA66B3FF54BC84BE29@de01exm70.ds.mot.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <274D46DDEB9F2244B2F1EA66B3FF54BC84BE29@de01exm70.ds.mot.com>
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
Content-Type: text/plain; charset="iso-8859-1"
To: Sun Susan-SSUN2 <SSUN2@motorola.com>
Cc: netfilter@lists.netfilter.org

In my system the same command does not show me any errors.

My modules is slightly different:

[root@davila ~]# lsmod
Module                  Size  Used by
ipt_TOS                 2497  2
ipt_length              1857  2
ipt_MARK                2497  2
ipt_limit               2625  8
ipt_LOG                 6977  8
ipt_REJECT              5953  1
ipt_state               1985  19
iptable_filter          3137  1
iptable_nat             7749  0
ip_nat                 18925  1 iptable_nat
ip_conntrack           52717  3 ipt_state,iptable_nat,ip_nat
nfnetlink               6617  2 ip_nat,ip_conntrack
iptable_mangle          3009  1
ip_tables              20033  10
ipt_TOS,ipt_length,ipt_MARK,ipt_limit,ipt_LOG,ipt_REJECT,ipt_state,iptable_=
filter,iptable_nat,iptable_mangle

my kernel is 2.6.15-1.1830_FC4 and=20
my iptables version is iptables v1.3.4

Particularly, I don't see the nfnetlink in your kernel but I don't know
for sure if it's the problem.

Hope this help.

Jorge.

El mi=E9, 01-03-2006 a las 12:14 -0500, Sun Susan-SSUN2 escribi=F3:
> Dear Sir:
>=20
> I'm new to network security and this is my first time to use iptables,
> when I run a firewall script, I got the following error:
>=20
> + /sbin/iptables -A INPUT -m limit --limit 3/minute --limit-burst 3 -j
> LOG --log-level DEBUG --log-prefix 'IPT INPUT packet died: '
> iptables: Invalid argument
>=20
> I also tried -m owner option, it give me same error:  "iptables: Invalid
> argument".
>=20
> But I don't get error for -m state. I can use iptables -L to see other
> rules except the error commands.
>=20
> I have the follow modules listed when I run lsmod:
> ipt_owner               3976  0=20
> ipt_MASQUERADE          4960  1=20
> ipt_REJECT              8520  1=20
> ipt_state               2688  4=20
> ipt_limit               3488  0=20
> ipt_LOG                 8288  0=20
> iptable_nat            35162  2 ipt_MASQUERADE
> iptable_mangle          5248  0=20
> ip_conntrack           62332  3 ipt_MASQUERADE,ipt_state,iptable_nat
> iptable_filter          4888  1=20
> ip_tables              25088  9
> ipt_owner,ipt_MASQUERADE,ipt_REJECT,ipt_state,ipt_limit,ipt_LOG,iptable_
> nat,iptable_mangle,iptable_filter
>=20
> Can anyone help me how to solve the error?
>=20
> Thanks in advance,
> Susan
>=20
--=20
Jorge Isaac Davila Lopez
Nicaragua Open Source
+505 808 2478
davila@nicaraguaopensource.com=20


