From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: clear the ip_conntrack entry
Date: Wed, 25 Jun 2003 09:22:55 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0306250920310.7456-100000@blackhole.kfki.hu>
References: <20030625110648.E38F.YOUNGH0702@21cn.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030625110648.E38F.YOUNGH0702@21cn.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: =?GB2312?B?0e67qg==?= <youngh0702@21cn.com>
Cc: netfilter@lists.netfilter.org

On Wed, 25 Jun 2003, [GB2312] =D1=EE=BB=AA wrote:

> =09I have notice that many request about how to clear the
> /proc/net/ip_conntrack entry , and someone suggest that it have no
> resolution except restart the interface .
> =09I think the answer : send a fake ip packet (with RST set) to
> firewall , to let it think the connection terminate .
> =09By this methode , I have the following script written , it work
> well for me.

Nice solution and script!

But please note, it won't work with TCP window tracking patch applied.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary



