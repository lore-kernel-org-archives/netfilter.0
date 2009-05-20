From: Robert L Mathews <lists@tigertech.com>
Subject: Re: conntrack and RSTs received during CLOSE_WAIT
Date: Wed, 20 May 2009 13:24:22 -0700
Message-ID: <4A1466F6.8070304@tigertech.com>
References: <4A0DE859.7000209@tigertech.com> <alpine.DEB.2.00.0905162348430.4156@blackhole.kfki.hu> <4A0F7FEE.3010405@tigertech.com> <4A139222.2020505@tigertech.com> <alpine.DEB.2.00.0905200904310.10018@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.0905200904310.10018@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Jozsef Kadlecsik wrote:

> No, you are correct.

Hmmm, okay. I must say I'm a little surprised by that. I've seen plenty 
of people using connlimit and connbytes (for example) to protect against 
all kinds of things, and I don't think it's widely known that it's 
trivial for an attacker to bypass those restrictions.

Anyway, though:

>If you want to eliminate the possibility to bypass 
> connlimit with properly crafted RST segments, probably you should use the 
> recent match and count the created NEW connections.

My goal with connlimit is to limit simultaneous connections so that it 
prevents a single client from using up all the Apache process slots.

However, I don't want to limit how many connections they can open in a 
period of time.

For example, it's perfectly fine for someone to open, say, 500 
connections per minute, as long as they don't open more than 40 at a 
time. But I do need to block the 41st simultaneous connection even from 
people who open up connections very slowly, such as someone who opens up 
just five connections per hour and never closes them.

Is that something the "recent" feature can help with? I'm not seeing how 
that's possible, but perhaps I'm missing something.

Thanks again for the help!

-- 
Robert L Mathews, Tiger Technologies    http://www.tigertech.net/
