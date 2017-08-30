From: Akshat Kakkar <akshat.1984@gmail.com>
Subject: Re: NFCT writing localhost conntrack entries too
Date: Wed, 30 Aug 2017 23:10:33 +0530
Message-ID: <CAA5aLPh6g2w2wfhWfo8==0J7Pa=8tMNp8VXKsBEWfkSKQUR0=g@mail.gmail.com>
References: <CAA5aLPg0PnUuiNFq=pvcOXerJJugcLF1bFgwxSC3KV4yEsv0DQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to;
        bh=VHv8sYUaW+j1GIoPludpTGRoGYDDS9iijiFnoSex/wk=;
        b=K8wuX2LmqfBzDQ/iNdZJXtZoGQuSTgV2xWRvoapqL4cRnQkuqVFXLAG7EkM/A0Xly1
         OywVufV4UBfb3hzoSaZd0jIyaao8O0n3BZScOVzS/ZfmLgUY2sNd2fVXYZ/SSRd+dZ6H
         15qcHcw3zLQJU5p3ECyFSlAwkdsXY+FFQslUo28ozPGKz351axizC5V3hXqlXDw1qaEQ
         eW7eO4U/CfczuTGT53+ya7+sDu2XWD7+EKRx6Oy53sRUkOtw8yAw5FZBBYjo6+Bbin20
         TS737zAnFuIYw2h21j/xXrHRO9e4KbE0Us3be/MWDV478GizXzd1e0b6xL8ipwE42kt2
         AQLg==
In-Reply-To: <CAA5aLPg0PnUuiNFq=pvcOXerJJugcLF1bFgwxSC3KV4yEsv0DQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Anybody? Please help ...

On 8/24/17, Akshat Kakkar <akshat.1984@gmail.com> wrote:
> With ulog, NFCT plugin, is it possible to not log entries with src ip
> as 127.0.0.1
>
> I can see following options in ulogd.conf
> #accept_src_filter=192.168.1.0/24,1:2::/64 # source ip of connection
> must belong to these networks
> #accept_dst_filter=192.168.1.0/24 # destination ip of connection must
> belong to these networks
> #accept_proto_filter=tcp,sctp # layer 4 proto of connections
>
>
> ... but what I am looking for is like deny_src_filter.
>
> Is it possible?
>
