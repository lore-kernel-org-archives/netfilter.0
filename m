From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: A really buggy official release ?
Date: Fri, 9 Jul 2004 18:33:43 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0407091829350.17924-100000@blackhole.kfki.hu>
References: <005401c4658e$c5319960$f301a8c0@groupecpro.local>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <005401c4658e$c5319960$f301a8c0@groupecpro.local>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Wilfried BARNAVON (Fire)" <wbarnavon@on-fire.net>
Cc: netfilter@lists.netfilter.org

On Fri, 9 Jul 2004, Wilfried BARNAVON (Fire) wrote:

> I've downloaded iptables-1.2.11, kernel 2.6.7 and pom-ng-20040621
>
> kernel and pom-ng seem OK however, even without any patch, iptables won't
> compile !
>
> I'm on Fedora Core 2.
>
> It says that there is no rule to build the target "extensions/libipt_!!!.c"
> needed by "extensions/libipt_!!!.d". Stopped !
>
> The return code of make is 2.

Did you set the KERNEL_DIR environment variable before issuing the make
command? If not, what kind of kernel source can be found at
/usr/src/linux?

We have never seen such error. There is no extensions/libipt_!!!.c in
iptables-1.2.11 or pom-ng.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary


