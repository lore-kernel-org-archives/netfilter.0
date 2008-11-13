From: "JC Janos" <jcjanos245@gmail.com>
Subject: Re: [ANNOUNCE] ipset-2.4.4 released
Date: Thu, 13 Nov 2008 06:31:51 -0800
Message-ID: <7259d7020811130631g1d826818pf72980da11e18831@mail.gmail.com>
References: <alpine.DEB.2.00.0811131040050.9639@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=sxADFIGnMst5+d3Eby+84fqZnKsbw8uT26tFtvtmhZs=;
        b=P+z+XLZiDiHZZJxi5t3HXVAEImUS5jHs0k7v1ihjLzvEJJ49vG4lkHXFJsw88kfXFX
         N9MbNJj2K5qM4nnZQ1ksE+DxHVq0JMTlOVEvanwKoRSUMKg/N803gH7k9TebNpRocqHX
         abOk34j8AFCWLu83E1L8Yl2taB6SVypnB4STI=
In-Reply-To: <alpine.DEB.2.00.0811131040050.9639@blackhole.kfki.hu>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

Jozsef,

On Thu, Nov 13, 2008 at 1:43 AM, Jozsef Kadlecsik
<kadlec@blackhole.kfki.hu> wrote:
> I'm happy to announce the new version of ipset - the list of the changes
> is as follows:

Thanks for the fixes/release.

I've downloaded from the ipset.sf.net site, but, I notice you offer
also the SVN repo.

The netfilter site (http://netfilter.org/downloads.html#git) says,

	Subversion Repository (obsolete)
	The SVN repository is not updated anymore and only exists for
historical reference.

and the extensions HOWTO
(http://netfilter.org/documentation/HOWTO//netfilter-extensions-HOWTO-2.html#ss2.1)
says,

	"First, you should get the latest CVS tree, to be sure that you are
using the latest extensions."

Which is the right repo for ipset?  It sounds like we should use git?
I don't see ipset as a separate repo at
http://git.netfilter.org/cgi-bin/gitweb.cgi ...

--JC
