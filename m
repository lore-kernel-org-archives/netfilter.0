From: Jorge Davila <davila@nicaraguaopensource.com>
Subject: Re: iptables-1.3.5 patch-o-matic-ng policy patch does not build
Date: Mon, 27 Feb 2006 18:53:23 -0600
Message-ID: <1141088004.2594.3.camel@davila.nicaraguaopensource.com>
References: <44025206.7020805@masonc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <44025206.7020805@masonc.com>
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
To: Chris Mason <lists@masonc.com>
Cc: netfilter@lists.netfilter.org

I suggest you use a vanilla kernel from http://www.kernel.org/ to avoid
any customization in your kernel.

Jorge.

El dom, 26-02-2006 a las 21:12 -0400, Chris Mason escribi=F3:
> I am trying to patch iptables-1.3.5 using patch-o-matic-ng to include=20
> the policy patch. I am building against the 2.6.12 kernel from an sourc=
e=20
> rpm. I get these errors when I build:
>=20
> cc -O2 -g -pipe -m32 -march=3Di386 -mtune=3Dpentium4=20
> -I/usr/src/redhat/BUILD/iptables-1.3.5/include -fPIC -Wall -Wunused=20
> -I/usr/include -Iinclude/ -DIPTABLES_VERSION=3D\"1.3.5\"  -fPIC -o=20
> extensions/libipt_policy_sh.o -c extensions/libipt_policy.c
> extensions/libipt_policy.c: In function `parse_direction':
> extensions/libipt_policy.c:104: error: `POLICY_MATCH_IN' undeclared=20
> (first use in this function)
> extensions/libipt_policy.c:104: error: (Each undeclared identifier is=20
> reported only once
> extensions/libipt_policy.c:104: error: for each function it appears in.=
)
> extensions/libipt_policy.c:106: error: `POLICY_MATCH_OUT' undeclared=20
> (first use in this function)
> extensions/libipt_policy.c: In function `parse_policy':
> extensions/libipt_policy.c:113: error: `POLICY_MATCH_NONE' undeclared=20
> (first use in this function)
> extensions/libipt_policy.c: In function `parse_mode':
> extensions/libipt_policy.c:122: error: `POLICY_MODE_TRANSPORT'=20
> undeclared (first use in this function)
> extensions/libipt_policy.c:124: error: `POLICY_MODE_TUNNEL' undeclared=20
> (first use in this function)
> extensions/libipt_policy.c: In function `parse':
> extensions/libipt_policy.c:143: error: `POLICY_MATCH_IN' undeclared=20
> (first use in this function)
> extensions/libipt_policy.c:143: error: `POLICY_MATCH_OUT' undeclared=20
> (first use in this function)
> extensions/libipt_policy.c:160: error: `POLICY_MATCH_STRICT' undeclared=
=20
> (first use in this function)
> extensions/libipt_policy.c:200: error: incompatible types in assignment
> extensions/libipt_policy.c:201: error: incompatible types in assignment
> extensions/libipt_policy.c:215: error: incompatible types in assignment
> extensions/libipt_policy.c:216: error: incompatible types in assignment
> extensions/libipt_policy.c:246: error: `POLICY_MAX_ELEM' undeclared=20
> (first use in this function)
> extensions/libipt_policy.c: In function `final_check':
> extensions/libipt_policy.c:268: error: `POLICY_MATCH_IN' undeclared=20
> (first use in this function)
> extensions/libipt_policy.c:268: error: `POLICY_MATCH_OUT' undeclared=20
> (first use in this function)
> extensions/libipt_policy.c:272: error: `POLICY_MATCH_NONE' undeclared=20
> (first use in this function)
> extensions/libipt_policy.c:273: error: `POLICY_MATCH_STRICT' undeclared=
=20
> (first use in this function)
> extensions/libipt_policy.c:290: error: `POLICY_MODE_TUNNEL' undeclared=20
> (first use in this function)
> extensions/libipt_policy.c:291: error: `POLICY_MODE_TRANSPORT'=20
> undeclared (first use in this function)
> extensions/libipt_policy.c: In function `print_mode':
> extensions/libipt_policy.c:303: error: `POLICY_MODE_TRANSPORT'=20
> undeclared (first use in this function)
> extensions/libipt_policy.c:306: error: `POLICY_MODE_TUNNEL' undeclared=20
> (first use in this function)
> extensions/libipt_policy.c: In function `print_flags':
> extensions/libipt_policy.c:369: error: `POLICY_MATCH_IN' undeclared=20
> (first use in this function)
> extensions/libipt_policy.c:374: error: `POLICY_MATCH_NONE' undeclared=20
> (first use in this function)
> extensions/libipt_policy.c:379: error: `POLICY_MATCH_STRICT' undeclared=
=20
> (first use in this function)
> make: *** [extensions/libipt_policy_sh.o] Error 1
> error: Bad exit status from /var/tmp/rpm-tmp.86614 (%build)
>=20
--=20
Jorge Isaac Davila Lopez
Nicaragua Open Source
+505 808 2478
davila@nicaraguaopensource.com=20


