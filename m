From: Greg Folkert <greg@donor.com>
Subject: Re: clarification on the use of --state parameter within  conntrack
 command
Date: Fri, 13 Sep 2013 14:22:20 -0400
Message-ID: <1379096540.16443.33.camel@bigboy.gregfolkert.net>
References: <FC9EDC96CA021943AB23AE4C96151F620DC4D5@van-mail14-n4.exchange.electric.net>
	,<20130913174546.GA903@linuxace.com>
	 <FC9EDC96CA021943AB23AE4C96151F620DC517@van-mail14-n4.exchange.electric.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=donor.com; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :organization:content-type:mime-version:content-transfer-encoding;
        bh=vn6k2549cot1EVAkFv45B8BQduBhUECFggXYUZZFU/k=;
        b=Wb4hmKcsYjypUwKtwASOo2QOL29l1FPkhM8T5iYcns4KYmKo9VHis8SF8kAC2kYoDn
         Lp+d3ju1HOsYsLBHNtY4P3ovf7Euag+OSjoMDWDeRwkPoTwvHe6nvGTCbYHX2iAQvP6B
         5BdllOySWRqsNEb2plxYiMikaAFzCVTaAX5n0=
In-Reply-To: <FC9EDC96CA021943AB23AE4C96151F620DC517@van-mail14-n4.exchange.electric.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alexis Salinas <alexis.salinas@inmotiontechnology.com>
Cc: Phil Oester <kernel@linuxace.com>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Fri, 2013-09-13 at 17:55 +0000, Alexis Salinas wrote:
> Thanks Phil, that works.
> And to your knowledge is there a way to do something similar with UDP.
> Like to filter the entries in UNREPLIED state?

Isn't that kind of the point of UDP? Wouldn't that be breaking it?

IIRC, UDP, was designed to communicate without having to setup a session
or other control/handshaking dialogues. I mean it is a "best effort"
protocol, with "time sensitive" payload, right? Also used as a fire and
forget protocol, also know as streaming,.. right?

Or am I missing something?
-- 
greg folkert - systems administration and support
web:    donor.com
email:  greg@donor.com
phone:  877-751-3300 x416
direct: 616-328-6449 (direct dial and fax)
"Our actions are the results of our intentions and our intelligence."
    -- E. Stanley Jones

