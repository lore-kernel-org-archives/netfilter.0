From: Aleksey Tsalolikhin <atsaloli.tech@gmail.com>
Subject: Re: Should "Transparent web-caching" work with ppp0/pptp? (It 
	doesn't...)
Date: Sat, 25 Apr 2009 11:07:32 -0700
Message-ID: <d17c5b140904251107h511a5075t88d5267cbf2ea5d@mail.gmail.com>
References: <d17c5b140904250034x4b73cd8dsf91846eb5f9dda32@mail.gmail.com>
	 <49F2D789.6090301@plouf.fr.eu.org>
	 <d17c5b140904250631h4278233dh8989758b38ea2831@mail.gmail.com>
	 <49F32073.9040207@plouf.fr.eu.org>
	 <d17c5b140904250811j401614bbje53cce5aedb14fa7@mail.gmail.com>
	 <49F33078.3000406@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=A+Q7UKoGHHFGcIYf9QqjtWp2v+HfOnOyX25YpQ0KtA0=;
        b=mFO12QaBOV7SM1dsP67bCt3TG/zlq3uKTtCbituTZzTbktxrcHpc4N/T9Y4xZv97GS
         PVZKet/unvF3sNkp4UxtFgVtIdhXBf26aGkNe6z8ye9RiLKsMQaQnDRpPtsJjj9tBxN/
         HyCc1x9Umqmg6jATB58s9lkdCNqTnvDKlDmtI=
In-Reply-To: <49F33078.3000406@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Dear Pascal, (and rob0),

On Sat, Apr 25, 2009 at 8:47 AM, Pascal Hambourg
<pascal.mail@plouf.fr.eu.org> wrote:
>
>> Any ideas?
>
> Yes, one :
>
> iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE


  That is a very good idea!    Thank you for the tip re netcat as well (nc).

  I won't get to try it out - I ran out of time on this one, my client
decided to go with the static routing instead of the alternate routing
trick...  It'll do the job for him, though it's less elegant and more
admin overhead...

  I want to say something - this was my first foray into advanced
traffic control, and I found #iptables and this list VERY helpful,
thank you, all, I really appreciate it!   Continue! :)   What a great
community!  You guys are awesome.

Yours very fondly,
Aleksey
