From: Akshat Kakkar <akshat.1984@gmail.com>
Subject: Re: H.225.0 NAT packet mangling module?
Date: Fri, 23 Jul 2021 15:39:28 +0530
Message-ID: <CAA5aLPii6_AdERYHc498obSPKBHPsNBqxU_N=k2=NeyCBBadQQ@mail.gmail.com>
References: <009101d1f4ae$c3940680$4abc1380$@elsied.net> <CAA5aLPgk216YxPNxFcxYY1qj0fA0sZsDB2yeTeOFo6U3zebs0w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KBEtOTCjRfyEiMuAZ9O+dY9jfTSgvz2qOzJiET70Gm0=;
        b=X7/0OcB716IkEZcW1KOh5Uy0nndPQFkh77OtPHH8wPZRXadoNUNiqroWkjT3BY3XYp
         BojSl0Q02H+1AocitfGMLdcJTgvtVeg0S6xqTdmeQtVhcof9Bv5bWl/A4nhy7R4w77LZ
         x/l/1E2mEQWnPZb5yNppUkFWa7NgZxkcRresdh4YWWVcr60J60dmqCOUh2TzQy9nV9uO
         VzDxVNTVTlFOST7y5qnTdu8xTfhw339Rx6z6yo7ScnFAnwzYPCJNKZJTdunqgg9fflSR
         USzHtL9Ng4bDf04d2ksBV4dUWWbSbeu8tRic3dplP1UNGxVdgHYQmJ5+Mr/73iy6vy6u
         AWgg==
In-Reply-To: <CAA5aLPgk216YxPNxFcxYY1qj0fA0sZsDB2yeTeOFo6U3zebs0w@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mohamed Elsied Hammad <mohamed@elsied.net>
Cc: netfilter@vger.kernel.org

In my setup, for polycom VC endpoints it works perfectly fine ... both
directions.
However, for Panasonic VC endpoints, issue is still there.
What I observed is, panasonic endpoint send 3 packets CS: Setup, CS:
Call Proceeding and CS: alerting before sending CS:connect packets.
However, polycom endpoint send only 2 packets (CS: Setup and CS:
alerting) before sending CS:connect packets.

Is this causing issue? May be ...

On Fri, Jul 23, 2021 at 3:33 PM Akshat Kakkar <akshat.1984@gmail.com> wrote:
>
> I am also facing exactly same issue. Its almost 5 years since this is
> reported here, but perhaps due to very less reporting of this bug, its
> not addressed uptill now.
>
> Hammad, were you able to find a workaround?
>
> Anyone having any solution to this issue? please guide.
>
> On Fri, Aug 12, 2016 at 9:05 PM Mohamed Elsied Hammad
> <mohamed@elsied.net> wrote:
> >
> > Hi Everyone,
> >
> > I'm scratching my head a bit on this one.
> >
> > I have a video endpoint behind a NAT box that is able to initiate calls with
> > no issues, however it is unable to receive calls from external sources. The
> > call seems to initially connect then just fails.
> >
> > I ran a tcpdump on my NATing box (Ubuntu 16.04, 4.4.0-34-generic) and made a
> > call from an external source to my unit. I observed the following:
> >
> > 1.      Standard incoming TCP SYN, SYN/ACK, ACK packets on port 1720 between
> > my video endpoint and the external video endpoint..
> > 2.      "H.225.0 CS: setup" packet from the external endpoint to my
> > endpoint.
> > 3.      "H.225.0 CS: alerting" packet from my endpoint to the external
> > endpoint.
> > 4.      "H.225.0 CS: connect" packet from my endpoint to the external
> > endpoint. - Here is where I think the problem is. When I inspected the H.323
> > message body in this packet I found that my unit is passing its internal IP
> > (192.168.1.100) as the "h245 ip address", which is expected since it is not
> > aware of the NAT. I need a way to mangle this packet on my NAT box before
> > sending it out. I need to replace the endpoint's internal IP with the NAT
> > box's public IP address in the "h245 ip address" field. The NAT box should
> > then continue to handle forwarding of packets to/from the endpoint as it is
> > currently doing.
> >
> > I did some searching on this list and elsewhere and found a couple of
> > references to modules that are supposed to help with scenarios like this
> > (nf_nat_sip , nf_conntrack_sip , nf_conntrack_h323 and h323_conntrack_nat).
> > I'm a bit confused about which module I should be using and whether I should
> > load it with certain options. Also how should my iptables rules be updated
> > after loading the required module(s)? Am I even going down the right path
> > here?
> >
> > Thanks,
> > Mo
> >
> > --
> > To unsubscribe from this list: send the line "unsubscribe netfilter" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
