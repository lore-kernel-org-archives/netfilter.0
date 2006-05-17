From: Petr Pisar <petr.pisar@atlas.cz>
Subject: Re: Iptables + extensions + Fedora 3
Date: Wed, 17 May 2006 09:04:54 +0200
Message-ID: <446ACB16.60101@atlas.cz>
References: <48135.82.214.211.1.1143052290.squirrel@webmail.imagiro-1.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <48135.82.214.211.1.1143052290.squirrel@webmail.imagiro-1.com>
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

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

diegoa@imagiro-1.com wrote:
> 6. I ran the iptables command to apply the quota patch: iptables -A INPUT
> -p tcp -m quota --quota 2147483648 -j ACCEPT
> 
> and I got this error: iptables v1.2.11: Couldn't load match
> `quota':/lib/iptables/libipt_quota.so: cannot open shared object file: No
> such file or directory
> 
iptables is userspace tool. It needs to know, how to comunicate with
netfilter in kernel. For this purpose there exist shared libraries in
/lib/iptables. Almost every netfilter module has its own "mirror" in
this directory. You need to recompile iptables (not kernel) using new
kernel header files. If libipt_quota is not standard part of iptables,
you will need to patch it too.

- -- Petr
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)

iD8DBQFEassWuR4f4nEwzHIRAjnYAJ9953b1xr0K968iROdUp1KsJg8hQQCcDpoD
w80Om/4mqfzqae1aTR5FBrs=
=V8Df
-----END PGP SIGNATURE-----


