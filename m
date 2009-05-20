From: Robert L Mathews <lists@tigertech.com>
Subject: Re: conntrack and RSTs received during CLOSE_WAIT
Date: Tue, 19 May 2009 22:16:18 -0700
Message-ID: <4A139222.2020505@tigertech.com>
References: <4A0DE859.7000209@tigertech.com> <alpine.DEB.2.00.0905162348430.4156@blackhole.kfki.hu> <4A0F7FEE.3010405@tigertech.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4A0F7FEE.3010405@tigertech.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

I haven't received any more followups on this, so I'll try to hack some 
solution around the problem.

But I will mention that I'm surprised that this didn't generate more 
discussion. Unless I'm confused (which is possible), sending 
out-of-sequence RST packets appears to be a trivial way to bypass connlimit.

It seems that all an attacker needs to do is send invalid RST packets 
with a sequence number one less than the last ACK received from the 
server. Then conntrack will forget about the connection, allowing the 
attacker to open as many connections as desired, regardless of connlimit 
limits.

I wrote a little perl script that I can leave running in the background 
on the client to send the necessary RST packets. In my testing, it does 
allow me to bypass connlimit restrictions on a server:

  http://www.tigertech.net/patches/rawip.pl

This seems to make connlimit less useful than I'd previously believed. 
Am I just misunderstanding something?

-- 
Robert L Mathews, Tiger Technologies     http://www.tigertech.net/
