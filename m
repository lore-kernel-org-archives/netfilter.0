From: Lucas Willian Bocchi <challado@ampernet.com.br>
Subject: Rate Estimator per destination IP
Date: Wed, 16 Sep 2009 09:08:06 -0300
Message-ID: <4AB0D526.2020002@ampernet.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi Folks. I need your help again!


My question is simple: I can use the rateest module to calculate the 
rate estimator per destination ip?
My idea is calculate the IP connection > 128kbit, mark the packet and 
send it to a TBF to slow down the connections to this IP.

To exemplify:
I have a 192.168.0.0/24 network. For EACH HOST, summarizing all active 
connections, the speed > 128, mark packet.

It's possible? I try to do these with tc filter, without sucess.
My idea is not create queues for each host. I think that have more 
elegant solution.


