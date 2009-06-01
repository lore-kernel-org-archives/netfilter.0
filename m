From: Fabio Marcone <fabio.marcone@duet.it>
Subject: info on dequeue
Date: Mon, 01 Jun 2009 14:01:20 +0200
Message-ID: <4A23C310.7050009@duet.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi all,
I'm studiyng traffic shaping but I didn't find an answer to this 
question: what method is used by kernel to send a packet?
I will explain better...

We suppose to have and htb qdisc with 3 leafs (queue).
How these queues are served by kernel? round robin? in which order?
How kernel knows that a queue contains at least a packet to send? 
polling? interrupts?

Thanks in advance,
Fabio Marcone
