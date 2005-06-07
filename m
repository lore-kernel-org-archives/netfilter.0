From: Samuel =?utf-8?B?RMOtYXogR2FyY8OtYQ==?= <samueldg@arcoscom.com>
Subject: Re: I can't install patch-o-matic-ng-20050606 in Mandrake 10.1
Date: Tue, 07 Jun 2005 14:16:04 +0200
Message-ID: <20050607121604.11479.qmail@arcoscom.com>
References: <20050607125741.zumvm8w28c8goc4s@webmail.nctu.edu.tw>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050607125741.zumvm8w28c8goc4s@webmail.nctu.edu.tw>
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: yhan.cm89@nctu.edu.tw
Cc: netfilter@lists.netfilter.org

You need your iptables source tree, not the kernel netfilter. 

Install it from your distro repository or:
  1) download sources from netfilter.org
  2) untar them
  3) use that directory as your iptables-src.
  4) apply your pom needed patches
  5) make your kernel
  6) make your iptables
  7) uninstall your iptables-xxxx package
  8) install your compiled iptables 

Surely you need some "substeps". 

Good Luck 

yhan.cm89@nctu.edu.tw writes: 

> Hi:
>     I have set the paths of kernel and iptables source codes as followi=
ng:
>     KERNEL_DIR=3D/usr/src/linux-2.6.8.1-24mdk/
>     IPTABLES_DIR=3D/usr/src/linux-2.6.8.1-24mdk/net/ipv4/netfilter 
> 
>     But when I tried to run ./runme extra ,  it said " Your iptables ve=
rsion is
> unknown for patch-o-matic at ./runme line 214" 
> 
>     How can I solve it ?  thanks! :-) 
> 
> -------------------------------------------------
> This mail sent through NCTU WebMail System: https://webmail.nctu.edu.tw=
 
> 
> 
 


Samuel D=EF=BF=BDaz Garc=EF=BF=BDa
Director Gerente
ArcosCom Wireless, S.L.L. 

mailto:samueldg@arcoscom.com
http://www.arcoscom.com
m=EF=BF=BDvil: 651 93 72 48
tlfn.: 956 70 13 15
fax:   956 70 34 83 



