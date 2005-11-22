From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Where is TARPIT -- iptables V. 1.3.4
Date: Mon, 21 Nov 2005 23:06:58 -0600
Message-ID: <200511212306.58447.rob0@gmx.co.uk>
References: <462d0fec0511210948v12bf4046i8836b4ba3797abef@mail.gmail.com>
	<43821AF1.7050409@wp.pl>
	<462d0fec0511211335h3a53f7a2n92e00059e4aa9c7c@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <462d0fec0511211335h3a53f7a2n92e00059e4aa9c7c@mail.gmail.com>
Content-Disposition: inline
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

On Monday 2005-November-21 15:35, Richard R wrote:
> It looks like the tarpit module provided by pom won't compile in
> the 2.6.14.2 kernel:

That should come as no surprise.

> Any ideas?

Yes, read the quoted message.

> On 11/21/05, ?ukasz Hejnak <sziftgroup@wp.pl> wrote:
> > Richard R napisa?(a):
> > > am using linux kernel 2.6.14.2
> >
> > hmm.. well afaik the tarpit extension is only for kernels < 2.6
> > *btw, I just checked, here's how it looks
> >
> > http://svn.netfilter.org/cgi-bin/viewcvs.cgi/trunk/patch-o-matic-ng
> >/patchlets/TARPIT/info?rev=4018&view=markup Title: iptables TARPIT
> > target
> > Author: "Aaron Hopkins" <lists@die.net >
> > Status: Works for me
> > Repository: extra
> > Requires: linux < 2.6.0

"Requires: linux < 2.6.0" means it will not work on 2.6.x.

> > > How do I get TARPIT working on a linux kernel 2.6.14.2 based
> > > system?
> >
> > well so far (I have also a 2.6.x kernel) I've been using the pom
> > and just changing the above in the 'info' file to "> 2.4.0" and it
> > didn't complain about a thing ;) I know that's a dirty way of doing
> > it, but hey, it's working fine for me :)

Did you try this suggestion?

If all else fails you could DNAT the traffic you want to TARPIT from 
your 2.6.x machine to a 2.4.x one. If you don't have one available, 
there's always user-mode Linux.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

