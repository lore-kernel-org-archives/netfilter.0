From: Gerry Reno <greno@verizon.net>
Subject: Re: fwknop: use with Fedora?
Date: Sun, 23 Sep 2007 08:33:18 -0400
Message-ID: <46F65D0E.6050005@verizon.net>
References: <46F5B7F8.2060502@verizon.net> <46F5C161.7090908@verizon.net>
 <46F5CF0C.3060004@verizon.net> <20070923043058.GA2940@minastirith>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-reply-to: <20070923043058.GA2940@minastirith>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Mike,
I'm going to try building the RPM on my system.

Here are a few things that I think the RPM should take care of though:

in a %post rule:
set permissions: (I notice that 'other' has too much access in 1.8.2)
/etc/fwknop/*
/usr/lib/fwknop/*
/usr/bin/fwknop*

=======================================

And a question about SPA. If I switch to this mode will I still be able 
to keep this system completely stealthy? That is no ports open anywhere? 
I know I can do this with port knocking. I didn't know whether this was 
possible with SPA mode.

Thanks,
Gerry

