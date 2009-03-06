From: Mr Vandeley <mr.vandeley@gmail.com>
Subject: Re: Nated connection behavior
Date: Fri, 6 Mar 2009 08:50:57 -0300
Message-ID: <87fa72960903060350n5bc33f37n309af95db55be24b@mail.gmail.com>
References: <87fa72960903051002g75faf755vcf16d10241de04dc@mail.gmail.com>
	 <c1dd97640903051012j60998ea1o179195f0a3037a26@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=N8oE2nH5ICrfa51SwIZSiTn7i8SYn7rUYSKpgFDC6Rg=;
        b=s+dS5nSOT/TMIuHuP1KwNyTxDYWWYp4A+wgQJ6sOgYqv3fIM/39bjFY7F5CzIG30Ea
         pyacTbkM5aL3JWwsyRr/G8vpOABkDFFWvcVNyCYPvZx5bQp0z/aqM9tygO8UuHbBO3r8
         //pqhZI+ryGnjmmeGAJJn2WGY1lV+16fg/JY8=
In-Reply-To: <c1dd97640903051012j60998ea1o179195f0a3037a26@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Thu, Mar 5, 2009 at 3:12 PM, James Stull <rivitir@gmail.com> wrote:
> NAT doesn't rewrite that section of a packet. Instead it "saves" the
> communication in memory this way your computer thinks it's talking directly
> to the server.
>
> You can kind of think of it like if you sent a letter to a friend:
>
> |You|<----->[Postal Service]<---->|Friend|
>
> Neither of you think about the postal service between you and how it works,
> instead you only think your talking to each other via your letters.
>
> Hope this helps.
>
> --James

Great, thanks James for your answer.

So, this "saved communication" is saved by NAT or by the conntrack module?

I ask this,  because I see that on CISCO routers, NAT doesn't behave
the same way. If I replace the Linux Router for a Cisco router,
configured nating everything that comes out on its external interface,
answers come from the router and client just ignore that answer,
right?
