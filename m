From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Patch o matic
Date: Thu, 05 Oct 2006 19:11:10 +0200
Message-ID: <45253CAE.8080600@plouf.fr.eu.org>
References: <4523FAF7.1070503@gabrix.ath.cx>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4523FAF7.1070503@gabrix.ath.cx>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter <netfilter@lists.netfilter.org>

Hello,

gabrix a =E9crit :
> I have a debian sarge kernel 2.6 i got the patch-o-matic-ng , a kernel=20
> and iptables source ...
>=20
>> root@argo:~# ls /usr/src/
>> iptables-1.3.6  kernel-image-2.6.8_custom.1.0_i386.deb =20
>> kernel-source-2.6.8  patch-o-matic-ng-20040621

Aw. This is a very old and broken patch-o-matic-ng that you have.
There have ben a lot of changes since then. You may want to look at more=20
recent patch-o-matic-ng snapshots. Not too recent though, as some=20
patches have been removed from more or less recent patch-o-matic-ng=20
snapshots over time (some have been merged into recent kernels, some=20
have just been removed).

> I have placed all in the /usr/src/ dir as you can see , compiled the ne=
w=20
> kernel , installed by dpkg -i the new kernel,rebooted,no kernel panic=20
> and i can't find the new ipt modules.Some got built like NOTRACK and TT=
L=20
> but no TARPIT or psd ...
>=20
>> root@argo:~# lsmod | grep ipt
>> ipt_ttl                 2176  0
>> ipt_NOTRACK             2304  0
>> ipt_recent             10252  2
[...]
Well, AFAIK all the listed modules, including ipt_NOTRACK, are already=20
included in the standard 2.6.8 kernel. I don't see ipt_TTL (TTL target)=20
but only ipt_ttl (TTL match). Did you apply the patch-o-matic patches to=20
the kernel source before compiling ? Are you running the new kernel ?

