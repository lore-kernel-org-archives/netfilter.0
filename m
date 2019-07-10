From: Naruto Nguyen <narutonguyen2018@gmail.com>
Subject: Re: Question about nf_conntrack_proto for IPsec
Date: Wed, 10 Jul 2019 13:55:25 +0700
Message-ID: <CANpxKHGa6DpV-9n8La7wh6r7MbEZpzGTWOO1AhmhWv072b4LAg@mail.gmail.com>
References: <CANpxKHHXzrEpJPSj3x83+WE23G1W0KPz9XbG=fCVzS21+-BpfQ@mail.gmail.com>
 <20190626111322.gks5qptax3iqrjao@breakpoint.cc>
Mime-Version: 1.0
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YmPlcvb5bObvvDqCeZdD+v5H0phZt2AX9Ycj4zrkFrk=;
        b=ftOUDOpkpab4eKuULhmrS+FRLyxVGC8+twax0G/we2OtMAwdLncDIdGpusWvby4wXx
         qaw+gRSt5+Ndd0+73JmbFNQzlTuiSuqpqRy/NLPOucRMiHZGuY1KiXFgCHlKc4jkTmIS
         mzIpZsj5ZjF35wRnL9wZc3ck5KqcxXUfffThPNv1l2da+xc0IOHRqsO2Nr4/RQBxdSnP
         +2f+m9SJiaHvwPRBJly9/5dNyl2QqrNiu1NNGojridE4P/SMWCHO11eCumK1+OPbiqFS
         Uz5YMXYLKjqmZIiNVKgpTtig9JIMuXm9y5LliSjb0v4mJWL14ZwmNy5BY+Dp/74t5BVF
         cJJg==
In-Reply-To: <20190626111322.gks5qptax3iqrjao@breakpoint.cc>
Sender: netdev-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Florian Westphal <fw@strlen.de>
Cc: netfilter-devel@vger.kernel.org, netdev@vger.kernel.org, netfilter@vger.kernel.org

Hi Florian,

Thanks a lot for your reply.

Could you please elaborate more on how generic tracker tracks ESP connection?

Brs,
Bao

On Wed, 26 Jun 2019 at 18:13, Florian Westphal <fw@strlen.de> wrote:
>
> Naruto Nguyen <narutonguyen2018@gmail.com> wrote:
> > In linux/latest/source/net/netfilter/ folder, I only see we have
> > nf_conntrack_proto_tcp.c, nf_conntrack_proto_udp.c and some other
> > conntrack implementations for other protocols but I do not see
> > nf_conntrack_proto for IPsec, so does it mean connection tracking
> > cannot track ESP or AH protocol as a connection. I mean when I use
> > "conntrack -L" command, I will not see ESP or AH  connection is saved
> > in conntrack list. Could you please help me to understand if conntrack
> > supports that and any reasons if it does not support?
>
> ESP/AH etc. use the generic tracker, i.e. only one ESP connection
> is tracked between each endpoint.
