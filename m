From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: H323..... and getting close! anyone tell me whats going wrong!
Date: Wed, 5 Jun 2002 09:00:12 +0200 (CEST)
Sender: netfilter-admin@lists.samba.org
Message-ID: <Pine.LNX.4.33.0206050854120.8715-100000@blackhole.kfki.hu>
References: <3051.24.168.132.35.1023234953.squirrel@mail.vistawiz.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <3051.24.168.132.35.1023234953.squirrel@mail.vistawiz.com>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Shazad Malik <smalik@vistawiz.com>
Cc: netfilter@lists.samba.org

On Tue, 4 Jun 2002, Shazad Malik wrote:

> I have the following settings:
> iptables 1.2.6a
> linux kerbel 2.4.18
> pwlib (latest)
> and openh323 (latest)

pwlib and openh323 are not required for the h323 helper of netfilter.

> This is what I have done:
> 1) I have grabbed the latest newnat from the CVS directory which is
> newnat13 from the samba.netfiler web site.

Stop here. All next steps you wrote were unnecessary and could only broke
the patches. If you grab the cvs, you can forget about patch-o-matic from
iptables, because the cvs contains the up to date version. Do not use the
patches from my webpage - it is written there that "this page is kept for
historical reasons only and not maintained anymore."

> 4) Then I run ./runme; ./runme suite and then I jump onto ./runme newnat
> and thats when I get the error.

Regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
WWW-Home: http://www.kfki.hu/~kadlec
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary


