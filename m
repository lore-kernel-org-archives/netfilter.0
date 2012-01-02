From: Anton Melser <anton@linux.com>
Subject: Re: Advice on best way to set up multi-route NAT for lots of IPs
Date: Mon, 2 Jan 2012 14:17:51 +0100
Message-ID: <CAKywjPqGyr+eX=BHhn65ehNn=KH9jw76SoqG6awb8AYh+htOeg@mail.gmail.com>
References: <CAKywjPrbjoLhcvPXVYg+8kZ53rPRJ5+dhePx4FB=OkpNjqUGxw@mail.gmail.com>
 <4F01A53A.6040704@wildgooses.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:sender:in-reply-to:references:from:date
         :x-google-sender-auth:message-id:subject:to:cc:content-type
         :content-transfer-encoding;
        bh=P+k6DYhPsxkrO4E5yC3XxLd8/6fVGVY0d6DocOvSY4k=;
        b=sD0FYNfZ3upd5oYPLiAgSI9S9GDz/Dh4DYW263AIZlkeczygHDZYnMX4qyZj9KOYCn
         iugiz19Hyr60aJjtJmwWeRQY0EWPIN0krYawa3yoSzGp2YE6IgNN6KzjbRnKLlXk+wAP
         WgrwCIpZz9RhV0/qzMBR+OxsMXWA28HyrMARk=
In-Reply-To: <4F01A53A.6040704@wildgooses.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Ed W <lists@wildgooses.com>
Cc: netfilter@vger.kernel.org

=2E..
> Although NAT would seem to be the most flexible solution (seems like =
you
> just need to read up on SNAT?
I have been doing that but thought I'd ask here for the advice from
the experts... There are many bad ways to skin a cat and I just wanted
to make sure I was using a reasonable way.

> Probably also some network stack tuning needed
> for such a large amount of NAT..?),
That was what I was hoping to avoid...

> you can probably also do this by adding
> the public IPs to your mailserver?
Definitely, makes load shifting very complicated though...

>=C2=A0Eg with Postfix you can either lightly
> overload settings per transport in master.cf (
> http://www.postfix.org/master.5.html ), or if you need something whic=
h more
> closely emulates a virtual machine then see the multi-instance stuff =
(
> http://www.postfix.org/MULTI_INSTANCE_README.html ). I see no theoret=
ical
> reason you couldn't have a (very) multihomed machine with the IPs on =
the
> servers themselves? The benefit might be that mailservers under high =
load
> will normally have a lot of connections open (hence high NAT requirem=
ents)
>
> Postfix also has some interesting options to add connection caching a=
nd some
> other tricks which are helpful for larger installations and large out=
bound
> queue volumes.
Postfix wasn't really designed for sending newsletters for lots of
companies efficiently, and it doesn't do a very good job compared to
some highly targeted products (PowerMTA, Message Systems, etc.)

> You should probably spend some time on followup questions covering wh=
y you
> aren't a spam sender. Many technical folks will jump to the conclusio=
n that
> anyone asking for help pumping large volumes of mail is likely to be =
up to
> no good. =C2=A0Just saying how it is...

:-). I was hoping to avoid that but you are right. Funnily enough,
pretty much no one sends bulk newsletters with their own servers any
more, and we have spammers to thank for that! Probably something like
90% of fortune 500s use specialist providers, hence why IBM and other
megacorps decided they needed in. The problem being that "technical
folks" usually don't have the time or patience to properly take care
of the "marketing folks" - mail servers need to be set up with sending
newsletters in mind because if they aren't then the MSPs (Mailbox
Service Providers, like Hotmail, Yahoo, GMail) or ISPs (like Comcast,
etc.) will just block and say "this is probably spam". Most
postmasters don't know or care (or do but don't have the time) about
this, so tell the marketing people to send them from elsewhere, hence
the development of an email broadcasting outsourcing sector. Receivers
set up http://www.maawg.org/, and have welcomed in broadcasters (and
senders) so there can be a forum for them to tell us how to send to
them. People DO sign up for newsletters, and that means they want
them, so ISPs can't (and don't) just block everything. ISPs and MSPs
WANT individual clients to have dedicated IPs, so they can more easily
identify and whitelist/throttle/trash/block. That means if you have
many thousands of clients, you need many thousands of IPs... But you
don't need many thousands of machines (save the planet! :-)) -
particularly if you can set up SNAT efficiently!
Cheers
Anton
