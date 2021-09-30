From: Cristian Constantin <const.crist@googlemail.com>
Subject: Re: nft set load metrics
Date: Thu, 30 Sep 2021 17:47:07 +0200
Message-ID: <CANCV4NP-9qTA+ehWNMT5-WEkomWkKrLWg30vcuEYaihs6a3sww@mail.gmail.com>
References: <CANCV4NMrw5m_-DCwnFGahygVnMGuVnU-RouBCqOsg6QX7z4AKQ@mail.gmail.com>
 <YVXC5cPRHyaE3VRL@salvia>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=P/4lyetN9Nki+T1Enu59iVRQut98PaRXlSiC4Lb0QCU=;
        b=OSHAp8BVrqVeyuC1YjsVWkoFlRi9qesPr+/K0IgD/a/A2JUreLI0ymN1Uk/3gzDB/N
         oB0S02PfGDjjVqxqIWRy/9UJ29JQBIlcgzavTqW5oi3YAXt2cKY2uUT3y3YYyccYEyiI
         KQE71cZxaigs1ly7uWDCXuPcQOuhi95m0SKpxgs5AXo59Gxd/+gUGyAx9e7Igme4SULS
         cL/xTqZrNlbLEP/qAUVhW6XGvLEyvtZnnJ7QsdYUKgtujX27CYVvGbgzfeXbyknQxzq3
         OnfWNKwf6tXv63eFkz1UcfEiA90ZloACP8t2P/75GoMG6g6GLmvxwt0uVN1Mctb2qNZn
         6tGA==
In-Reply-To: <YVXC5cPRHyaE3VRL@salvia>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

> It's possible to extend the interface to expose this, but how useful
> is this?

cristian: imo, it is important from the operational point of view to
monitor the size of the sets. from an implementation point of view,
since the sets can grow to very large sizes, reading large packets
over netlink sockets just to count the elements in the sets does not
seem very efficient.

the nft user space tool has a switch which turns off showing the set
content: '-t', however it will only show the name of the set and the
flags. I also did not check if this feature is offered at the socket
layer or if the elements are actually read from the kernel but not
displayed.

thanks,
cristian
On Thu, Sep 30, 2021 at 4:00 PM Pablo Neira Ayuso <pablo@netfilter.org> wrote:
>
> On Thu, Sep 30, 2021 at 01:21:26PM +0200, Cristian Constantin wrote:
> > hi!
> >
> > is there a way to get from the kernel just some metrics about nft
> > sets, without getting
> > all (possibly lots of) elements of the set?
> >
> > e.g.:
> >
> > - number of full ip addresses (i.e. /32 prefix for ipv4);
> > - number of "prefix" elements;
> > - number of intervals;
>
> It's possible to extend the interface to expose this, but how useful
> is this?
