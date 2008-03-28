From: Scott MacKay <scottmackay@yahoo.com>
Subject: Re: pre 2.6.14 ip_queue - packet shrink issues?
Date: Fri, 28 Mar 2008 07:05:52 -0700 (PDT)
Message-ID: <418076.8475.qm@web52412.mail.re2.yahoo.com>
References: <20080328134723.GA23603@khasse.inl.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20080328134723.GA23603@khasse.inl.fr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Eric Leblond <eric@inl.fr>
Cc: netfilter@vger.kernel.org


--- Eric Leblond <eric@inl.fr> wrote:

> Hello,
> 
> On Friday, 2008 March 28 at  6:07:47 -0700, Scott
> MacKay wrote:
> > With ip_queue, under the older libipq style
> interface
> > I seem to be having a problem resizing a mangled
> > message smaller under 2.6.  It seems like the
> contents
> > could be changed, but the receiver got the
> original
> > packet size, like the trim failed or something. 
> Still
> > need to check the details in ethereal, but from
> anyone
> > using ip_queue or noting improvements in the new
> > style, does an issue like this ring any bells? 
> Thanks
> > in advance!
> 
> I think remember such an issue. It has been fixed
> and should work with
> up-to-date code (I mean with libnetfilter_queue).
> 
> BR,
> -- 
> Eric Leblond
> INL: http://www.inl.fr/
> NuFW: http://www.nufw.org/
> 
Aah...so possibly no fix in the older style?  The new
design seems easy enough to port to, I was just hoping
on not hopping too many revisions from the kernel rev
I have in (RHEL 4.5) if possible.  I was glad a minor
UG within the up2date cleared my huge issue (panic
when returning a payload thru libipq) but this of
course is just as bad...I had a hope to keep in the
RHEL available kernel distros but understand if this
was rolled in outside of what is convenient.

-Scott


      ____________________________________________________________________________________
Looking for last minute shopping deals?  
Find them fast with Yahoo! Search.  http://tools.search.yahoo.com/newsearch/category.php?category=shopping
