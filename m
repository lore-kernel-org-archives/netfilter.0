From: "Jonothan Kane" <jonothan.kane@gmail.com>
Subject: Re: Kernel 2.6.21: 802.3 frames not hitting netfilter filter table FORWARD chain
Date: Wed, 3 Dec 2008 16:18:12 -0800
Message-ID: <217983a50812031618t11cbbb9dlac327dbce5f3c116@mail.gmail.com>
References: <217983a50812021437s415bbba9jea2f8ce70edd5e1a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=SNGYNQjpD9FuXs4NhtbbmnQHVCiCqRHG9dSfEEP9BnY=;
        b=hsQx1QxDn8mjP3fbe/d7WW8GhO7MPgPfi6R8IUQz5nUT27FGyPFFdKKmXecYiCUgg5
         RhT2PKMUYRsdZ3AL8bKAhrdEyNk4GkMwzOjc/H2vNWvppCjX/53PL56njMbI4shol9Ho
         Z88KxxvCqpHJ4BYiI9+Wv2pwyBrlvHPWa9UAE=
In-Reply-To: <217983a50812021437s415bbba9jea2f8ce70edd5e1a@mail.gmail.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Tue, Dec 2, 2008 at 2:37 PM, Jonothan Kane <jonothan.kane@gmail.com> wrote:
> Hey all;
>
> I've got some old gear on a network with a couple of Linux transparent
> bridge firewalls protecting the network.
> For the regular Ethernet II frames the filtering in the netfilter
> filter table FORWARD chain works well.
>
> All old style 802.3 frames hit the ebtables  tables but not the
> netfilter filter table FORWARD chain.
> The 802.3 frames are carrying IP datagrams.  Is there a trick to get
> them into the FORWARD chain ?
> preferably without changing the bridging firewalls to routing firewalls.
>
> Thanks for any info.
>
> J Kane.
>

Well,  I did some poking around in the bridging code with some sk_buff printks.
Those 802.3 frames carrying IPv4 payload are coming in and being classified with
 sbk->protocol type of 802.2 (ETH_P_802_2)  and the skb->nh.raw
pointer is set to
the start of the LLC portion of the datalink header instead of the
start of the IPv4 payload.
( off by 8 bytes ).

The IPv4 payload never seems to get processed by the netfilter  filter
table rules.
I thought that the IPv4 payload would get detected and processed by
netfilter correctly.

Anyone else have any experience getting 802.3 frames carrying IPv4
payload through netfilter ?

J Kane.
