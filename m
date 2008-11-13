From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: [ANNOUNCE] ipset-2.4.4 released
Date: Thu, 13 Nov 2008 18:43:01 +0100 (CET)
Message-ID: <alpine.DEB.2.00.0811131839140.10251@blackhole.kfki.hu>
References: <alpine.DEB.2.00.0811131040050.9639@blackhole.kfki.hu> <7259d7020811130631g1d826818pf72980da11e18831@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <7259d7020811130631g1d826818pf72980da11e18831@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: JC Janos <jcjanos245@gmail.com>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

On Thu, 13 Nov 2008, JC Janos wrote:

> I've downloaded from the ipset.sf.net site, but, I notice you offer
> also the SVN repo.
> 
> The netfilter site (http://netfilter.org/downloads.html#git) says,
> 
> 	Subversion Repository (obsolete)
> 	The SVN repository is not updated anymore and only exists for
> historical reference.

ipset hasn't been converted to git from svn yet. So it is still kept, 
updated and available from svn.
 
> and the extensions HOWTO
> (http://netfilter.org/documentation/HOWTO//netfilter-extensions-HOWTO-2.html#ss2.1)
> says,
> 
> 	"First, you should get the latest CVS tree, to be sure that you are
> using the latest extensions."

Ohh, that's a highly outdated information in the HOWTO. There's no cvs at 
all for ages.
 
> Which is the right repo for ipset?  It sounds like we should use git?
> I don't see ipset as a separate repo at
> http://git.netfilter.org/cgi-bin/gitweb.cgi ...

Everything is in git, except ipset. When ipset will be moved to git too, 
I'll announce it on the mailing lists.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
