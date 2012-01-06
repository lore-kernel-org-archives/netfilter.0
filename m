From: Andrew Beverley <andy@andybev.com>
Subject: Re: Advice on best way to set up multi-route NAT for lots of IPs
Date: Fri, 06 Jan 2012 07:28:24 +0000
Message-ID: <1325834904.2270.362.camel@andybev-desktop>
References: <CAKywjPrbjoLhcvPXVYg+8kZ53rPRJ5+dhePx4FB=OkpNjqUGxw@mail.gmail.com>
	 <1325748924.2270.334.camel@andybev-desktop>
	 <CAKywjPrGnmOg9Zh4T-VzCJHrhJ52s1jmBJsKq4R=D2viFZHmsA@mail.gmail.com>
	 <1325788784.2606.18.camel@kushiel.sterenborg.info>
	 <CAKywjPoHa_0kjvC0H_YT+RQ-pjeTN1aUoyULbhzYOmFT51giZw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1325834906;
	bh=F2OqXiajsnOJmqTKlJbjsJqiW1r9tuwqKToW25QdPP8=;
	h=Subject:From:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-ID:Mime-Version:Content-Transfer-Encoding;
	b=NiI8Txn2dv1K5+76pwC1ufcgc/XuXutAxwBMnuWTroWrKH1UcsHsa6hdJYBvLkFFd
	 cW2T7CmYhw/jwnluTL5sDZDuQk1r9/l+fJh8ybag4pcs69NcFOEw5Cs2gS8Mb/BhAO
	 zUCUuo7+yc/wfOdrnBmqOFZGyUpLDDxCjwdtekkw=
In-Reply-To: <CAKywjPoHa_0kjvC0H_YT+RQ-pjeTN1aUoyULbhzYOmFT51giZw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Anton Melser <melser.anton@gmail.com>
Cc: "Rob Sterenborg (Lists)" <lists@sterenborg.info>, netfilter@vger.kernel.org

On Fri, 2012-01-06 at 06:15 +0100, Anton Melser wrote:
> If the only way to do the NAT is with 1600 rules then I'll stop
> looking elsewhere, thanks!

I think it probably is the only option from what you've said, especially
given the variety of different networks you have. I can't comment on the
performance though, which was one of your original questions.

> There is also the matter of routing though. I agree that this question
> is more an iproute2 issue, and could/should be better asked on the
> iproute2 list.

Well, there isn't really an iproute2 list as such...

There's netdev and LARTC, both also hosted at VGER, but by all means try
your question here if you'd like.

>  In my mind marking the packets for ToS or fwmark was
> actually for use at the routing level.

Sounds like the way to go. Gives you plenty of flexibility.

> ps. I'll do a blog post when I get a coherent config set up and post
> back here for reference and your comments. It will need failover using
> connection tracking so could end up being a nice little article.

That would be excellent. The more "real life" examples there are, the
better.

Andy


