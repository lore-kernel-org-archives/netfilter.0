From: Anton Melser <anton@linux.com>
Subject: Re: Advice on best way to set up multi-route NAT for lots of IPs
Date: Mon, 2 Jan 2012 22:14:39 +0100
Message-ID: <CAKywjPr8zd3bYDBStPR6xNA-VfoiAstfRZe_hZ+XiDgoD72d_Q@mail.gmail.com>
References: <CAKywjPrbjoLhcvPXVYg+8kZ53rPRJ5+dhePx4FB=OkpNjqUGxw@mail.gmail.com>
 <op.v7e9nhxox1lyi3@debiandesk2.net> <CAKywjPpKpVdBz9boAhgj=-F488ayAtoLK1ua=GWKZ1hjNMWpZA@mail.gmail.com>
 <op.v7fekow7x1lyi3@debiandesk2.net> <20120102180115.GA17749@pusher.nrth.lab>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:sender:in-reply-to:references:from:date
         :x-google-sender-auth:message-id:subject:to:content-type
         :content-transfer-encoding;
        bh=ja0sq0Qcg1m1rbSL4uCpftx9tZG5hSCaVwUfg6RLz3A=;
        b=f8k9luSSznN87sVd6kKj733SO/lfe0IKgeEvOiMXMANbn+fuHZkJdMfo9m0oYBtUfP
         N87xM4O35HC91nMLCQyuLyRau+jZO6UW+uUbwdtvLTw8WnE1go6ICblCoGEBY05NYVtM
         qZD16C4jYyod6CNVVOjSmK0fqJG7oK0qGsI08=
In-Reply-To: <20120102180115.GA17749@pusher.nrth.lab>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

>> Frankly, this looks to me like bulk-email-laundering. =C2=A0That is,=
 it's a
>> way to convey email "reputation" from one of 3-8 "trusted" IPs to th=
e
>> 1600 "unknown" ones.
>
> This discussion is very intriguing to myself, no matter how OT. I'm
> quite sure I'm not the only one.
>
> It sounds to me like someone needs help on how to hide a botnet using=
 an
> iptables script at first glance. It can't be that of course so why ar=
e
> 1600 hosts wanting to send bulk email ?
>
> spam has given email marketing such a bad reputation that I'd really
> like to know why there are 1600 hosts that need to send
> business/marketing email. Why 1600 ?
>
> Sorry I'm new to the list and I realise I am contributing to the
> OT-ishness of this thread.

I said to myself "don't mention port 25, you'll get a barrage of
insults..."! But I realise it is intriguing to many people, and it's
very easy to jump to conclusions. I suppose the simplest way to
explain why 1600 is the following. If we accept that it is valid for a
client to have an IP and this client will send their newsletters from
only this IP and build reputation on this IP, then it is trivial: 1600
IPs =3D 1600 clients. If an intern for company X makes a booboo
(something like
http://it.slashdot.org/story/11/12/28/1929232/new-york-times-hacked
for example!) then company Y shouldn't suffer, should they? They will
need different IPs then.  Mailchimp claims (or claimed at one point)
to have 100,000 clients (I am not involved with Mailchimp in any way,
they are one of the biggest in the industry so I'm picking on them).
So 100000 IPs? It's more complicated than that unfortunately, as MSPs
and ISPs require certain minimum levels of traffic. The blog link
above in the thread mentions why you might not want a dedicated IP if
you don't send enough. The problem being that if you don't send for a
while, and then suddenly start sending again, everything gets
completely blocked or put in the spam folder. The vast majority of
companies can't warrant employing someone who spends their days
researching the latest requirements for sending newsletters, so they
sub-contract that to an application service provider (an Email Service
Provider). So we need lots of IPs and we need to manage them
efficiently on behalf of our clients.
Actually we don't use nearly 1600, as currently IP management is not
as optimised as it would be with a NAT (or similar) solution. We have
a lot of ad agencies as clients though, and they are only working for
their clients (white label or not), and we have many, many more than
1600 "end clients". We also definitely have clients that want to have
redundancy on connection providers (going over different backbones,
etc.), and bandwidth is cheaper on X but more reliable on Y, etc. so
we need different providers. My solution needs to be able to support
more than we could ever throw at it, so I want it to be able to
support 1600 IPs from the start.
Cheers
Anton
ps. Also see my response to Lloyd's last post.
