From: Matteo <matteo.king@libero.it>
Subject: RE:RE IPTABLES && Invalid Argument
Date: Sun, 23 Mar 2003 20:05:15 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200303232005.15994.matteo.king@libero.it>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
To: netfilter@lists.netfilter.org

Alle 18:46, domenica 23 marzo 2003, hai scritto:
> Hello,
>
> at first try iptables -V to look whether you really call iptables
> 1.2.7a. Maybe an
> old version is in /sbin, and the new one in /usr/local/sbin, so probabl=
y
> the old
> version would be found earlier in your PATH.

ok  i try iptables -V and it's a iptables  1.2.7a and in /sbin there is n=
ot a=20
old version

> If that's not the problem and you're callng the right version, then
> recompile
> iptables 1.2.7a from source. The "Invalid Argument" often refers to an
> user space
> version (iptables) incompatible to the kernel portion (netfilter).

How to recompile iptables??. Beacuse i try to recompile do : make KERNEL_=
DIR=20
but it return this error : EXTENSION FOUND .......... (INVALID KERNEL HEA=
DERS)


>
> Hope this helps.
>
> Sven
>
Thanks!


> Matteo wrote:
> >Hi all,
> >I have a little problem..... I use a Redhat 7.3 with kernel 2.4.20 . I
> > have installed iptables 1.2.7a and patch o matic and recompilated the
> > Kernel and it works.
> >But the problem is when I launch this command:
> >iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
> >That produced : Invalid Argument
> >I have loaded first the modules but the result is the same!!!
> >
> >Can i help me??
> >
> >Thanks a lot!!!
> >Bye
> >
> >Matteo


