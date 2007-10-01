From: "Morten Egelund Rasmussen" <morten.egelund.rasmussen@gmail.com>
Subject: Re: Where do I start coding?
Date: Mon, 1 Oct 2007 17:45:51 +0200
Message-ID: <d60af9b90710010845y47927665ne562047b85f04d86@mail.gmail.com>
References: <d60af9b90709300856u2642472x2473a630aa3e9cea@mail.gmail.com>
	 <d60af9b90709300858o4f2cba9cx2172c9722219303c@mail.gmail.com>
	 <200710010014.40431.mauricio@campiglia.org>
	 <d60af9b90710010200u64f472a8rd2cd4d951889f8e3@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=Jo0PuwuZ8PP/PAxACcWG8EGWnVSbL0gJM86nIOl9bwI=;
        b=rWnMr9k3sqxtD8OX6GJiYkQibUvy0W36Xdvs4892RWWlL/eE6HfxKNcZO1BPMLXaNQLOA/NTQSOVpOMWLH+mg5HWD4k+lEzjrncVsDVIFRkNDnXy2AXskne2jgyj3QXGFMQ/Nblfd55Xlp65LSIQx4fFYwYvsm4TA6noaQmAyQM=
In-Reply-To: <d60af9b90710010200u64f472a8rd2cd4d951889f8e3@mail.gmail.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Okay. I did this:

> svn co https://svn.netfilter.org/netfilter/trunk/documentation
.....
> svn co https://svn.netfilter.org/netfilter/trunk/iptables
.....
> cd documentation/examples/maintainer/
> make
Retrieving incoming example submissions from example master's incoming
Password:

I went through the README. As far as I understand, I should be able to
get a bunch of example code out from a repository somewhere. I can see
from the Makefile, that it tries to rsync through SSH to this URL:
roux@grace.speakeasy.org:website/netfilter/examples/incoming

Of course I don't know roux' password, so any help would be appreciated. :-)

Best regards,
~Morten

> On 10/1/07, Mauricio Campiglia <mauricio@campiglia.org> wrote:
> > On Sun 30, Morten Egelund Rasmussen wrote:
> > > Could anybody please point me in the right direction....
> >
> > You can find directions at:
> > http://www.netfilter.org/downloads.html
> > Under Subversion Repository you will find how to checkout the branch(s) you
> > need.
>
