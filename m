From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Can I add a module to a prebuilt kernel?
Date: Fri, 4 Jun 2004 09:48:57 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0406040940180.15267-100000@blackhole.kfki.hu>
References: <20040603210133.GN24398@wellnow.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040603210133.GN24398@wellnow.com>
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
To: Jeff Gordon <jeff.gordon@wellnow.com>
Cc: netfilter@lists.netfilter.org

On Thu, 3 Jun 2004, Jeff Gordon wrote:
>
> So I obtained the iptables-1.2.9 source package and compiled it.
>
> On 'make install', however I found libipt_recent.so was NOT placed into
> the loadable modules directory...!

The compilation process of the iptables binary will include whatsoever is
supported in the kernel *source* it was told to look at it. So if the
kernel source does not contain the recent module, it won't be supported
by iptables either.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary


