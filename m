From: Richard Horton <richard.horton@solstans.co.uk>
Subject: Re: correct net fitler rule
Date: Wed, 28 Oct 2009 12:53:40 +0000
Message-ID: <56378e320910280553o7e7f246fk8f3dbe5f6f7fb5c8@mail.gmail.com>
References: <4AE7C1CF.2070807@gmail.com> <4AE820AF.70109@chello.at>
	 <4AE83DCE.5080102@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:received:in-reply-to
         :references:date:x-google-sender-auth:message-id:subject:from:to:cc
         :content-type;
        bh=vNTVlpczRnPZPgMZ8gqmoY+ILxKhVXKjeLimseQmR/c=;
        b=msbuLBYf/JhPuGPJ2MEKngiIeJbt5rgTcFmrXHaMpSJknYP/sqnDuqkGJcoms4LBM5
         ev/73HZYi96EY1UIKCPROMR5E87hScBhkKtb0/KHpX9TN92tj7hxTIDU1r9AsDMokeS8
         DS+Vo4qwPHNNfpDyACuldeArQGYEgUm9JME5E=
In-Reply-To: <4AE83DCE.5080102@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ralph Blach <rcblach@gmail.com>
Cc: netfilter@vger.kernel.org

2009/10/28 Ralph Blach <rcblach@gmail.com>:
> Ok,
>
[snip]
> Since I get attached, I want to drop and log from any attaching network.
>
> This happens on a daily bassis, so I am constally updating the list.
>
> What is the best set of rules to accomplish this

If you only wish to allow traffic from your internal network and the
external nameservers then its simple.

set your iptables policies, as said earlier, to DROP.

Then create explicit rules to accept the traffic you want in each
chain as needed.
If you want to log any DROP traffic then just make the LAST rule in
each chain a logging rule...

If you use DROP as a policy and only allow specific traffic you will
not have to keep updating your rule set to block additional networks.


-- 
Richard Horton
Users are like a virus: Each causing a thousand tiny crises until the
host finally dies.
http://www.solstans.co.uk - Solstans Japanese Bobtails and Norwegian Forest Cats
http://www.pbase.com/arimus - My online photogallery
