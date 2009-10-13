From: Lucas Willian Bocchi <challado@ampernet.com.br>
Subject: Best Kernel QoS Parameters
Date: Tue, 13 Oct 2009 11:22:55 -0300
Message-ID: <4AD48D3F.6000502@ampernet.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello all!

I don't know if this is the right list to send this message, but LARTC 
is dead and I believe that this is the only place that I'll have the 
help that I need!

My question is simple: to a linux router, how are the kernel parameters 
(2.6 kernel tree) to set to make a good and responsive kernel to best 
QoS Shaping (HTB, HFSC, etc)?


Another question is: how are the effect of TX and RX Ring Buffer 
(hardware packet buffer) in QoS? The algoritms use these parameters in 
the QoS configuration? I presume that
this parameters can affect the performance, because the hardware buffer 
can borrow the QoS configuration.


Thanks a lot for answer my question. I believe that it's very important 
to newbies in this world (QoS), like me.

[]'s


