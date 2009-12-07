From: Slava Garaschenko <slava@maze.ambernet.kiev.ua>
Subject: Re: kernel panic when adding QUEUE to OUTGOING
Date: Mon, 07 Dec 2009 11:56:12 +0200
Message-ID: <4B1CD13C.4000905@maze.ambernet.kiev.ua>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

I have the same problem. Kernel 2.6.31 FC12, x86_64
Problem appear ONLY then first packet go into imq, which connected to
outgoing. If I add IMQ to OUTGOOING to interface which don`t have any
routing to it, and not connected (no packets sent to this interface) -
all OK, but then first packet send to this interface - I have "kernel
trap". If it will be help, I can try to make screen-shot of screen then
"kernel trap".

-- 
     Garashchenko Vyacheslav

