From: "Pablo Sanchez" <pablo@blueoakdb.com>
Subject: RE: P-O-M:  connrate for 2.6.14-4
Date: Mon, 2 Oct 2006 21:52:22 -0400
Message-ID: <003901c6e68e$918561e0$0419a8c0@fly>
References: <359840230.09436@mail.nankai.edu.cn>
Reply-To: pablo@blueoakdb.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <359840230.09436@mail.nankai.edu.cn>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

 

> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org 
> [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Bo Yang
> Sent: Monday, October 02, 2006 9:47 PM
> Cc: netfilter@lists.netfilter.org
> Subject: Re: P-O-M: connrate for 2.6.14-4
> 
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>  
> Pablo Sanchez ??:
> > Hi,
> >
> > I'd like to get connrate installed on my 2.6.14-4 kernel.  When I
> > run P-O-M extra, it doesn't show up as an option.  I've checked out
> > revision 6677 of the P-O-M trunk:
> >
> > # svn co https://svn.netfilter.org/netfilter/trunk/patch-o-matic-ng
> >  Checked out revision 6677.
> >
> > Any ideas how to patch my kernel to get connrate implemented?
> I think the patch Document will tell you how to do it .
> Or you can man patch !

Unfortunately, the document doesn't instruct.  

I think I'm going to try to emulate connrate.  I'll see if I can pen some
thoughts and run it by the list.  Perhaps someone else may find it useful
(or not).

Cheers,
-pablo


