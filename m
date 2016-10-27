From: Rui Santos <rsantos@ruisantos.com>
Subject: Re: NAT with unique egress port
Date: Thu, 27 Oct 2016 23:41:34 +0100
Message-ID: <CAJxU1QP5OK=eScajCLB_=zNxc=2Q1Sc77iVsQnp4Cccs1iTmtg@mail.gmail.com>
References: <CAJxU1QN4c+5KOBgakYAgRXnR3jRh_s72BKyqT3F5g+oReQp3QQ@mail.gmail.com>
 <7118f027-0f54-7878-6d83-f304beed5430@familie-kuntze.de>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ruisantos-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=XgdG63gCX68B4Egjb7NMvPLeO/yea3V7YooKGUEWZl0=;
        b=0dt2RGya4bXl5Cw5lWEmOpHTkb75fW1o3l1Vlgyen2HCkx7IG2bguHjOo2aqug5+97
         Hb4pzI01yay3Scm7DvCj7UYagE2+zhmBjJQ5cdvAGYdz4TWJleYUgVtelDcO0ds7jo7f
         OpWSgZlXyJ609Ed2MFnD0OZjEVN/aUNx3OffdE69QB6Fn4elkBsST9PEYwYAeTFhdrqR
         qXSYW/LMxp3jmPcrrIfQDY8d0cLLYsHb3aNnh0KuzXDVP0cXx8Gf7dRGPGd1ZBeV//OI
         0CiLQ5RfOPelHm1JMsydpN3zbVOyf184JR2X+iDS+UARCiDcI6grnPwy9cZj9J6C0z+W
         hSCg==
In-Reply-To: <7118f027-0f54-7878-6d83-f304beed5430@familie-kuntze.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Noel Kuntze <noel@familie-kuntze.de>
Cc: netfilter@vger.kernel.org

HI Noel,

Thank you for your reply on this!

I believe you may be referring to the --random of the SNAT target.

Although that is a solution which I will probably take if there is no
other, there are actually two issues with it:
1) AFAIK, it will randomize all egress ports. I would like to keep the
default behavior of NAT, by tampering with connections as little as
possible. On the example I provided, only the connection initiated by
server2, gets a random egress port. server1 connection egress port
will be the same as the origin source port.

2) Random does not necessarily mean unique. What will happen if
client1 and client2, randomly get the same egress port for different
destination IP's? Will --random consider this valid? If it will, I end
up with the same issue (although rare, true) of having two clients
with the same egress port.

Is there any way to accomplish this?

>
> The answer is on the man page (man iptables-extensions).
> Read the text about the SNAT and MASQUERADE targets.
>

-- 
Rui Santos
Veni, Vidi, Linux
