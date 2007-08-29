From: "Andy Cristina" <acristin@gmail.com>
Subject: Re: Netfilter_queue test program question
Date: Wed, 29 Aug 2007 08:21:38 -0500
Message-ID: <6043bfd00708290621o432827e2scbd241aebcdbdf75@mail.gmail.com>
References: <6043bfd00708290113j38b0f153k7acd38d09ab9c16e@mail.gmail.com>
	<46D53FA3.9030805@freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=eH4qOhciUV0k8Vqx9nXHv0zBZcCRa2KH3BUSs0+csGDY0ncDJNS4ZuRwzh4Ih/v6psAs6I7c6GlcXVXajG3CbiDl1hoSsV0BGzV1fan15HKJ+UUsZmkQ6vMsMHmEvnEnH1p5GfOaJQong6OFe8Tsc6csV5ag8nAECe1GO0YDW5w=
In-Reply-To: <46D53FA3.9030805@freemail.hu>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

On 8/29/07, G=E1sp=E1r Lajos <swifty@freemail.hu> wrote:
> Andy Cristina =EDrta:
> > I've been attempting to play with netfilter_queue to see how effective
> > a certain similarity hashing technique would work for identifying
> > parts of documents being sent out over the network, but I haven't had
> > much progress even getting the test program to work.
> Just a few questions:
>
> - Why do you want to do such things?
> - How would you come over on the compressed files, MIME encodings?
> - Are you attempting to stop some information thiefing?
> > I can compile and link nfq_test.c fine, using both the old versions of
> > libnfnetfiler and libnetfilter_queue available from ubuntu's apt, and
> > by using the newest released versions compiled from source.
> >
> > However, in any case when I run the compiled nfq_test, the program
> > seems to do nothing after setting the packet copy mode.  So it seems
> > to me as if it is perpetually waiting for a packet to be sent over the
> > netlink, but one never arrives, no matter how much network traffic I
> > have.
> >
> > Am I missing some vital piece of setup?  When I run nfq_test, there
> > are two netfilter modules loaded.  Should there be more?  Do they need
> > to be configured somehow?  Is this the expected behavior?
> >
> > I have tested this both on my ubuntu install and on a friend's debian,
> > both machines exhibit the same behavior.  Any help is certainly
> > appreciated.
> >
> >
> Swifty
>
>
>

