From: Bill Bogstad <bogstad@pobox.com>
Subject: Re: Playing nice with incoming traceroutes
Date: Sat, 15 May 2010 23:17:07 -0400
Message-ID: <AANLkTimrjdx9ADP8OpAMmaxC_kfr9Ua1T0auAW3M8M9q@mail.gmail.com>
References: <AANLkTimnTBPl5oayp3tprDmROD4bNpIXyAodkZuF_JlS@mail.gmail.com>
 <AANLkTilTF_pcF5W67BEAhKmNIzpffHhFByKLS2LX7bqy@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pobox.com; h=mime-version
	:in-reply-to:references:date:message-id:subject:from:to:cc
	:content-type; s=sasl; bh=/Dv5vekrMvgSIZdSsLjMDhNF1U4=; b=hkxibA
	aopZPc0G/Z6GUB5dDmhfgKfpllobXHwV+lPkaBWfboDPd2WR03qzZbuTwjOepZDi
	OT5udkQ6/8UzgGVUflpK12xL7NBrHoCCPYTSyPgkINt/0h08sKBcc3TVxznPRr9V
	4jC7h6s39ODRI6EBgbQTHb4Pue+ulFF9FB3JU=
In-Reply-To: <AANLkTilTF_pcF5W67BEAhKmNIzpffHhFByKLS2LX7bqy@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pieter Smit <mlist2010@vigor.co.za>
Cc: Curby <curby@cur.by>, netfilter@vger.kernel.org

On Sat, May 15, 2010 at 12:51 PM, Pieter Smit <mlist2010@vigor.co.za> wrote:
> You would send an ICMP time exceeded (type 11) packet if you receive a
> packet with a ttl=1 you will decrement it one realize it is 0 and send
> the ICMP time exceeded.
>
> Traceroute could also use ping ICMP echo request (type 8).

Or TCP SYN packets.  From "man traceroute" on my Ubuntu system:

       -I     Use ICMP ECHO for probes

       -T     Use TCP SYN for probes

Actually the "LIST OF AVAILABLE METHODS" section is quite extensive.
Apparently people have been hacking
on traceroute while I wasn't watching.

Bill Bogstad
