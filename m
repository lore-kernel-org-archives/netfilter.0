From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: H323..... and getting close! anyone tell me whats going wrong!
Date: Wed, 5 Jun 2002 14:13:54 +0200 (CEST)
Sender: netfilter-admin@lists.samba.org
Message-ID: <Pine.LNX.4.33.0206051410290.8715-100000@blackhole.kfki.hu>
References: <3CFDFECC.8070807@attbi.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <3CFDFECC.8070807@attbi.com>
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
To: Robert La Ferla <robertlaferla@attbi.com>
Cc: Shazad Malik <smalik@vistawiz.com>, netfilter@lists.samba.org

On Wed, 5 Jun 2002, Robert La Ferla wrote:

> I have a question for Jozsef.  Could you tell us the procedure to
> install newnat + h323 from a cvs installation?  You can assume that the
> source code has already been checked out.  This may solve my problem
> too.  I think I ran the runme script when installing it on my system.

Run './runme extra' and try to apply all pending pacthes (if some pending
patches fail, don't bother). Then apply the h323 patch.

That's all.

Regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
WWW-Home: http://www.kfki.hu/~kadlec
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary


