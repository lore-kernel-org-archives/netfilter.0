From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Autoloading h323 module
Date: Fri, 14 Jun 2002 13:41:15 +0200 (CEST)
Sender: netfilter-admin@lists.samba.org
Message-ID: <Pine.LNX.4.33.0206141338310.17402-100000@blackhole.kfki.hu>
References: <20020523172836.GA32496@62-moo-3.acn.waw.pl>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020523172836.GA32496@62-moo-3.acn.waw.pl>
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
To: jmc <jmc@_REMOVE_prioris.mini.pw.edu.pl>
Cc: netfilter@lists.samba.org

On Thu, 23 May 2002, jmc wrote:

> I am trying to autoload <via kmod> some modules from iptables,

Some parts of the netfilter modules can be autoloaded. Others cannot.

> specifically ip_conntrack_h323.o. I can load it manually, but to do it
[..]
> wrongly. I simply expect it to autoload when an h323 connection is made.

No, protocol helper modules cannot be autoloaded and it won't be possible
in the future either. But what's wrong with loading in the modules at boot
time?

Regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
WWW-Home: http://www.kfki.hu/~kadlec
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary


