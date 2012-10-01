From: Andrew Beverley <andy@andybev.com>
Subject: Re: More that one not ! condition in a single rule.
Date: Mon, 01 Oct 2012 21:37:21 +0100
Message-ID: <1349123841.4663.284.camel@andrew-desktop>
References: <CAP7y58PK9++n7ueLtQd8okKpqhhAeSBFYnO+JLeK60M-_Fqsbg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAP7y58PK9++n7ueLtQd8okKpqhhAeSBFYnO+JLeK60M-_Fqsbg@mail.gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1349123843;
	bh=0ZS9aYUsRrNfrVzL50r+WtMu08YqOwHwWQW7SVh8lXI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:Mime-Version;
	b=VM6mTWjhpNHhoyDOd/vfSgtqfLdrlx+woL5vWyetmhiCWh1iGKMjlsahGupUvYpmR
	 WcY2efgof+SWFB7qr5JM31MkAeyRQBhDWWE7s1fqKktUMsrwWY7Xlsf0rSSzaqaQoy
	 cq4kMuPJMbwyLYSwabyCT/6VXga4j6EvsLpXZVIM=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Net Warrior <netwarrior863@gmail.com>
Cc: netfilter@vger.kernel.org

On Mon, 2012-10-01 at 15:14 -0300, Net Warrior wrote:
> Hi there.
> Does anyone know if it's possible to include more than one ! not
> clause in a single rule ?
> I' have the following
> 
> IPTABLES -A AUDIT-RULE  -d $D_INT  ! -s x.x.x.x \
>          -m limit --limit 10/s -j LOG \
> 
> I'd like to include other IP's, do I have to duplicate the sentence ?

I would use either the iprange match, or ipset, which will make your
rules clearer to read as well.

Andy


