From: Brad Pousland <bpousland@izuma.net>
Subject: Re: setting meta priority to select link vlan qos 802.1q priority via
 egress map
Date: Wed, 11 May 2016 15:07:42 -0500
Message-ID: <CAGBdaZ=9bcechsjddxbcFZJGTv7UpkTSi22stnWBnyAsOvxHjw@mail.gmail.com>
References: <CAGBdaZm-3nTMOp=zTF_=h3=epRDDAA13UCwZxnGg5jg8MV1yGg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=izuma-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to;
        bh=pFkShlmYPvLYl8/fY20d06ck/bUHJq9jj361QqNsalI=;
        b=dkoRuCmdE2OE6faecMSX19IYF56oiVOzmB4PQwdgLiCTZvs/emp6Ov0GmmVBTY3TEt
         Uy/O5xssHDX2B9xNm+NDUgv5WLuIPlp26jfUQKR9wHr+uhn84EYVvFeGRbTkczLjpADX
         0vVS3zB9fAjd4Q1kkqxWU4tBnu+ry0ijBmC6xe24IUNlAzuFnswfwg0coWHaifp2H70d
         wAPf5f3BU1FeNTdjYXIKojLHPbtAVvUd2dbHahBsyg+MsKrsiOFrfA4DLayDqLCbz9ww
         5U56654BfoC1yFL2jCFbO2D13QALB+DWgHGJKlhXjSnpCKC0wsqGvNXz+OucU31nJqck
         m6uw==
In-Reply-To: <CAGBdaZm-3nTMOp=zTF_=h3=epRDDAA13UCwZxnGg5jg8MV1yGg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

It appears to be a bug with the nftables userspace utility nft. I
wrote a program to decode nftables rules and found the nft utility is
trying to fill the BPF data register with the priority value in
big-endian format.  If I hack it to use little-endian format for the
meta value, the skb->priority is set appropriately.

Brad



Brad Pousland
Principle Software Engineer
WigWag, Inc.
c - 512-963-2446
www.wigwag.com



On Tue, Apr 12, 2016 at 12:13 PM, Brad Pousland <bpousland@izuma.net> wrote:
> I am trying to control the vlan qos priority of a link by using an
> egress qos map on the vlan link and setting the packet priority using
> an nftables rule.
>
> I have a vlan link defined with an egress map from 3 packet priorities
> to 3 vlan qos priorities as follows:
>
> 30: eth0.2@enx00e07cc8db5b: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500
> qdisc noqueue state UP mode DEFAULT group default
>     link/ether 00:e0:7c:c8:db:5b brd ff:ff:ff:ff:ff:ff promiscuity 0
>     vlan protocol 802.1Q id 2 <REORDER_HDR>
>       egress-qos-map { 0:3 1:2 2:6 } addrgenmode eui64
>
> As a test I am using a simple rule to set the packet priority of any
> packet from the vlan address:
>
> table ip mangle {
>      chain postrouting {
>           type filter hook postrouting priority 0; policy accept;
>           ip saddr 192.168.1.62 meta priority set 0200: counter
> packets 0 bytes 0
>      }
> }
>
> I then send packets from eth0.2 and inspect the packets from the
> physical parent device. The QOS field is always set to 3 as if the
> priority was never modified on the outgoing packet by the rule, even
> though the rule counter shows the rule was invoked.
>
> Does anyone know if the "meta priority set" can be used for this
> purpose?  I  could give up and use tc for vlan priority control but
> that seems overkill since I don't have complex traffic shaping
> requirements.
>
> Thanks,
> Brad
