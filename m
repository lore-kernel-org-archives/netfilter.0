From: Arturo Borrero Gonzalez <arturo.borrero.glez@gmail.com>
Subject: Re: Linux Firewall Active/Active
Date: Wed, 5 Nov 2014 21:40:56 +0100
Message-ID: <CAOkSjBgMu_wdy0_oJ=yQqtYHeRz0yiTy1C-LO-qO3xiE0gPDCg@mail.gmail.com>
References: <CADuigkVbB2nt5P6y-JCaW_bh6v_GhjL9BRBiHRyvA_yH81v4RA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=GJa2uZzyjRpN5HGYB63HHFCtHLJBN0g97UYf8IBKkj8=;
        b=viFKRQ8LL8nZqA79QNZhQio9Bl7cQhE6+AJN0tlzM10eQm4DH+eBPrdSExGGu+sQvU
         Ljdz017qVVYAEScnaUD+ETQkxHV62tQoETeI9EAHI9XIZ9SFuLvwrtBvG0+k15qnyPMD
         FoS4dz0WAu5DKaA/ol27Bv7wzPgiA18g7LmVRJNlhwe4ftaboi2zGKv8/LmCsg1VSrgb
         Q8BGF+Q/4zsII19eB3X1GJP8CXJHQtu7bni0VBO4RJFuBDKLGKMQXKo3VtthuITBCjlH
         NnJgti7RiAjMIhMZMO7BPCnHvrTX9Kd+JFeSQPn6V9qX0O5uAcnfPd3at4CdWNXHiH7j
         dV6w==
In-Reply-To: <CADuigkVbB2nt5P6y-JCaW_bh6v_GhjL9BRBiHRyvA_yH81v4RA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: Ricardo Klein <klein.rfk@gmail.com>
Cc: netfilter <netfilter@vger.kernel.org>

On 5 November 2014 20:15, Ricardo Klein <klein.rfk@gmail.com> wrote:
> Hi there,
>
> I need to build a scenario with 2 linux servers (probably CentOS7)
> acting as active/active firewall servers. What tools should I use?
> I saw some articles with:
>  - conntrackd + keepalived
>  - conntrackd + corosync + pacemaker
>
> But, what is the most used/stable?
>

I would recommend Debian, corosync + pacemaker.

I guess an active-passive cluster will do the job.

Setting up an active-active firewall cluster is very difficult and
presents some challenges hard to face (like proper statefull filtering
in two nodes simultaneously, and a consistent ruleset management
between nodes of the cluster).

--=20
Arturo Borrero Gonz=C3=A1lez
