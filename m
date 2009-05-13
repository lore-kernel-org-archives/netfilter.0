From: Billy Crook <billycrook@gmail.com>
Subject: Re: Dead mailinglist ???
Date: Wed, 13 May 2009 10:49:57 -0500
Message-ID: <a43edf1b0905130849o1d45bccdqf9b0d1bf473d68fe@mail.gmail.com>
References: <4A0AB427.6030102@freemail.hu> <4A0AC3D3.3030902@lab.vectoris.fr> 
	<1242220099.10622.36.camel@enterprise.ims-firmen.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :from:date:message-id:subject:to:cc:content-type
         :content-transfer-encoding;
        bh=TgVYL6bFs3JQf37XK6qeK6eTGmeyLwvSjP3wQdYVVfc=;
        b=Yn9YgohXvWyEFNuKi4xpXCebq9jIr1+my2GSsFrzRv6tITv+4tobzakDiUjpH1T7/0
         AfnkYKeJoZOktc2ldzdOqN/nVns3dROxsX43EmLi7d+bs8mCDK/hwnNx6fz+rnERSB40
         j+aIkcKvQzwyZGeuRelG4YfJcdIGOLT1+GfBE=
In-Reply-To: <1242220099.10622.36.camel@enterprise.ims-firmen.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Thomas Jacob <jacob@internet24.de>
Cc: "Mihamina Rakotomandimby (R12y)" <mihamina@lab.vectoris.fr>, netfilter@vger.kernel.org

On Wed, May 13, 2009 at 08:08, Thomas Jacob <jacob@internet24.de> wrote=
:
> On Wed, 2009-05-13 at 15:57 +0300, Mihamina Rakotomandimby (R12y) wro=
te:
>> > Is there a problem?
>>
>> Iptables rules became user friendly! ;-)
>
> I cannot leave that unreplied. I'd really like to know of a system wh=
ich
> offers the same or better fine grained control and so many features
> which is significantly more user friendly than iptables ;-)
>
> The complexity of iptables stems for the most part from the complexit=
y
> of the problem at hand. Sure you can hide that complexity behind fanc=
y
> web front ends and there are plenty of those for iptables, in fact, t=
he
> firewall configurations in many consumer router boxes today are just
> that.
>
> But doing this also takes away most of the power of iptables or indee=
d
> any other sophisticated firewalling system, and being reduced to that
> would be a terrible thing for me at least ;)
>
> In summary, iptables is appropriately user friendly for its feature s=
et,
> and if you don't need most of that feature set, simply use a front en=
d
> instead.
>
> =A0 =A0 Thomas

Agreed.  It's just lists of if-match-then-act rules.  iptables is
already quite easy and simple.  How could it be any simpler?  I can
imagine very little that one could remove or change without reducing
functionality.  A good example would be -j REJECT in -t nat, and
that's already been resolved.  It might be nice to merge ip and eb,
and as I understand, that work is already under way.
