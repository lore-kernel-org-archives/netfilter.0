From: Martin Gignac <martin.gignac@gmail.com>
Subject: Re: Trying to provision flowtable returns error
Date: Thu, 5 Nov 2020 11:20:48 -0500
Message-ID: <CANf9dFP5fzK7N3eQ3KyW=zC22dpfMuf=yxX7B9dqTpnb0mThLA@mail.gmail.com>
References: <c382354e-4a18-0863-e006-0db6f9fce1f6@heinlein-support.de>
 <CANf9dFMdBgdn5k9fd5QX15kiAbVhQFqAfOBXUj64=wy6a9buBg@mail.gmail.com>
 <20201105005345.GA4263@dimstar.local.net> <CANf9dFMFqjp7MJQy5B52sz3PVc5wm5DWRMrKKGKtqL9n6rXWYw@mail.gmail.com>
 <20201105153822.GE15770@breakpoint.cc>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=et7WLtnffXyyWJ+p1kCbGY1J7UbUZ2xk502wWGCQfT8=;
        b=MPyhEasrOvaHEMrkf90RGe+oZ3ghw1SzNCw/1a/SJx72p5Yh6EMwgfjp2dyuc8Vg0a
         FF23BKCzC/JW+qQ0SQNil67yj31Pc1tRJ2xt3sAKKXrbq1CgH9UhWSXwP1B7kkxRcP8/
         T82+Vyl8+odCuLth+Tsvb3919+NaPRKPFkA0MQtUYTbVBvhg57lPhYKevVIEkNvEh4tg
         JyAx+LhebDjtgAt2mD+Uu9nWw/jP0Yt/YSsvEqw5/4lj7XB+IgMlc0j0FMQ7pPJ8e5Qs
         klxPYBJzp9DBUkIcYukEUYsRD7z0LgmBF13xRlajYbr+TPjwlWN75OdRPw1TJOqpI9vD
         J6Mw==
In-Reply-To: <20201105153822.GE15770@breakpoint.cc>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Florian Westphal <fw@strlen.de>
Cc: netfilter@vger.kernel.org

Hi Florian,

OK, I understand now.

- on RHEL/CentOS 8 I *was* using existing network interfaces, but
there are *no* nf_flow kernel modules available, and
- on Fedora 30/33 there *are* nf_flow kernel modules available, but I
was *not* using existing interface names

Both cases give off the same error message, which confused me.

I guess then this makes it problematic to use logical interfaces such
as bonds or bridges with flow tables, correct? In Fedora the systemd
unit file for the nftables.services states that nftables should start
before the network.pre-target:

    [root@localhost system]# cat nftables.service
    [Unit]
    Description=Netfilter Tables
    Documentation=man:nft(8)
    Wants=network-pre.target
    Before=network-pre.target

    [Service]
    Type=oneshot
    ProtectSystem=full
    ProtectHome=true
    ExecStart=/sbin/nft -f /etc/sysconfig/nftables.conf
    ExecReload=/sbin/nft 'flush ruleset; include
"/etc/sysconfig/nftables.conf";'
    ExecStop=/sbin/nft flush ruleset
    RemainAfterExit=yes

    [Install]
    WantedBy=multi-user.target

At this stage Network Manager hasn't even begun to initialize, much
less create any logical interfaces. Therefore any bond or bridge
logical interface do not yet exist, and if they are referred to in the
*.nft files the nftables.service will simply fail with the "Error:
Could not process rule: No such file or directory" message.

Ideally I'd want to start nftables before the network comes online to
make sure everything is secure, but if I use logical interfaces is my
only recourse to change the nftables.service file so that nftables
only starts up after the network-online.target, which would open a
very short window where the network is up but not yet protected by
nftables yet? Or is there another way that I am not seeing?

Thanks,
-Martin
