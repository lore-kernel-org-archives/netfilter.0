From: Bo Yang <struggle@mail.nankai.edu.cn>
Subject: Re: Marks set in PREROUTING got lost
Date: Fri, 29 Sep 2006 12:44:24 +0800
Message-ID: <359505300.29036@mail.nankai.edu.cn>
References: <359401435.12133@mail.nankai.edu.cn>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Message-ID: <451CA4A8.5080402@mail.nankai.edu.cn>
In-Reply-To: <359401435.12133@mail.nankai.edu.cn>
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
Cc: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1
 
Clemens :
> Hi everyone,
>
> after experimenting with setting marks (--set-mark) in the
> PREROUTING chain in the mangle table, I found out, that those marks
>  were not accessible/matchable in PREROUTING nat table. I was able
> to see the marks in chain FORWARD mangle table though :-(
I think this has something to do with the kernel netfilter framework
internal .
In the netfilter , there are five points in which user defined
funtions to be
called by the kernel , they are PREROUTING , FORWORD , POSTROUTING ,
INPUT , OUTPUT . So , you mark a package in the prerouting point , and
then
you must can see it in the forword point , because the package go from
the prerouting
to the forward . But if you mark a package in the prerouting point but
also want to
see it in the same point , there is must some trick here .
If the mangle table's  funtion called before the nat table , I think
you can see the mark ,
if it isn't , you can't .

But you can just complete your task without go into the troubles here .
If you want to distinguish packages , you can just do that in the nat
prerouting chain ,
why do you mark it in the mangle table and find it in the nat table ?
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (MingW32)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org
 
iD8DBQFFHKSn7tZp58UCwyMRAqXOAJ9j8HjpvPYFKsODrT8PDkyWzm/jUACeLYBX
/rcGTiWbFi3gekD/EsL3Er4=
=ZIlb
-----END PGP SIGNATURE-----


