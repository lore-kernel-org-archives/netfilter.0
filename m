From: Martin Gignac <martin.gignac@gmail.com>
Subject: Re: How to troubleshoot (suspected) flowtable lockups/packet drops?
Date: Wed, 17 Mar 2021 22:23:04 -0400
Message-ID: <CANf9dFMzt+mZZS5SSYZbVY1M2VOz1wh3KEyUkfVeRMuMMc96yg@mail.gmail.com>
References: <CANf9dFO+CAuiugQjwKDZ+tOVYuB+HMKeJzDVqekY=vVFE-rxFw@mail.gmail.com>
 <20210316230521.GB981@salvia> <CANf9dFMxabVweO2ipnPL8Ncemc9wQaxeJQs0dazrgf=VeXVjbA@mail.gmail.com>
 <20210317103443.GA18462@salvia> <CANf9dFPDyAU-WKD5SSBv2M+PUoUmT5jQAjLcD1jcwEYzWKPqXQ@mail.gmail.com>
 <20210317204220.GA13211@salvia> <CANf9dFOHgb+QNqVkWVsnP6ALSQxbPzyv8xA0LXyck39w3bUjwg@mail.gmail.com>
 <20210317222854.GA24692@salvia>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PGrHC3TfMTOiTqSTya5qnJA5YxtKaScRbN0hXbKTBUM=;
        b=WokHklVMkm9A/ZZmefA/3+0M0ipol4hWKg8y/Vnhp0S4L9oo1YoVENoLDEWtYhkPkd
         QgNxgraXOIS6VUvbdnjf0uxpe6EC+xmf3zauGiFRS/Md2S3ewsyeLjmeSUiQ64vWanRJ
         WsygkIZe2XTNEgBKBMvSHpd4T+VWvvJjBUsQUKxUf13mRdv1rlMwpMen6q5PAtSqpZhg
         Qz3/khWxyJrMXQ/wrcAWf6768Tt+SWSD565SWB/BwvPjldHJjjdE2BzfZOhy1VBkbdCH
         zesMd27p+gQCkCz74Y2mg/8hT+Pe/Q4xBXOKFyyBVgFm1glnaW6lvJc7jdgPH59PF1vg
         uVUQ==
In-Reply-To: <20210317222854.GA24692@salvia>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

Hi Pablo,

I was finally able to reproduce the IPv6 lockup with the flowtable
counters turned on. I had conntrack -L running under 'watch' with some
greps to isolate the specific flow I wanted to check out. I also had a
tcpdump running on the OpenVPN tun interface and another tcpdump
running on the bonded VLAN interface to compare both.

When a lockup occurred, as I said earlier, I could see some packets
coming in on the bonded VLAN interface but not being sent out the tun0
interface. When those packets came in, I *did* see the packet count
increase by one for the "packet=" metric for that specific direction
for every one of those packets.

Sometimes, after some time being locked up, the state of the session
would move back to "ESTABLISHED [ASSURED]" (but traffic would remain
"stuck") until the point where traffic would suddenly resume, and then
the session would move back to "[OFFLOAD]" state again.

Commenting out the rule that offloaded IPv6 to the flowtable in the
ruleset. and reloading that ruleset with "nft -f rules.txt"
immediately fixed the lockup.

Am I the only person that's reported any kind of issue with flowtable
and IPv6? Maybe it's something about my setup...

-Martin

On Wed, Mar 17, 2021 at 6:28 PM Pablo Neira Ayuso <pablo@netfilter.org> wrote:
>
> On Wed, Mar 17, 2021 at 06:01:43PM -0400, Martin Gignac wrote:
> > If I just run:
> >
> >     nft list ruleset > rules.txt
> >
> > add:
> >
> >     flush ruleset
> >
> > to the top of the file, add the:
> >
> >     counter
> >
> > statement to the flowtable section, and then:
> >
> >     nft -f rules.txt
> >
> > This should atomically add the "counter", but not impact traffic in
> > any way, shape or form, correct?
>
> It turns on packets and bytes counters:
>
> # conntrack -L
> tcp      6 src=10.141.10.2 dst=192.168.10.2 sport=57758 dport=5201 packets=1998758 bytes=87532896157 src=192.168.10.2 dst=192.168.10.1 sport=5201 dport=57758 packets=1966493 bytes=102257896 [OFFLOAD] mark=0 use=2
>
> You also have to enable counters in conntrack:
>
> echo 1 > /proc/sys/net/netfilter/nf_conntrack_acct
