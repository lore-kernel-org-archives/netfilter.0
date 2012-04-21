From: Arif Hossain <aftnix@gmail.com>
Subject: Re: concatenate udp payloads of multiple packet
Date: Sat, 21 Apr 2012 15:12:47 +0600
Message-ID: <CAGuaRCsyjc53pKrWWKhfLSPczZQtif4zRPqwuAvYN2fdZBhV2Q@mail.gmail.com>
References: <CAGuaRCt0Jmj4_prCZVvXi2oijOTprTqUntphjx_9cQqk-nqhCQ@mail.gmail.com>
	<471DE477E2B1F549A58F3A14A27180BE01687C@HQ-EX01.bytemobile.com>
	<CAGuaRCs6iYTL-Teci4GpOPD8Cm-6CbLUh2gYbDQMteA=nF29ug@mail.gmail.com>
	<471DE477E2B1F549A58F3A14A27180BE0169BE@HQ-EX01.bytemobile.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=jdECYZ4ZuF/lVui8NS3tALdZdmaRtRpeNQHUtq74CWI=;
        b=KwSLgP0o3p+is05r7h22lOW+IDquD/Or4EPBTBiFyXVXaQvfJDKKJEjIEG1S57jf1y
         GiqBkAg3G5ff+OREQm0gd0yDEzMWfdmzPv6B4tUZ09q6wQ1DO/Zy9qA4++HpiXh/D44N
         dN55raqjtegAbtG3mhatJDZrBU2NtbhKN3zf1Pm5Pvdbv8Cwo6lm2WhOZhG8XNoocS7z
         hxm3roOxDku+g9tJgDYryj9ntWn61x2x/eMOSAAFUNr7ZVqBoesRuh5YG7EQz64F7I2o
         lrloHiZlPTmwPYlW/FaNnKgeVidzF/dvq2rihnZWWa5fnTKUk/xaVzCBpq+VfZ72OfdW
         vCLw==
In-Reply-To: <471DE477E2B1F549A58F3A14A27180BE0169BE@HQ-EX01.bytemobile.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff Haran <jharan@bytemobile.com>
Cc: netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org

On Fri, Apr 20, 2012 at 11:17 PM, Jeff Haran <jharan@bytemobile.com> wrote:
> Nothing prevents you from having multiple NFQUEUEs using the queue-balance option to the NFQUEUE target. From the iptables man page:
>
> "NFQUEUE
>
> This target is an extension of the QUEUE target. As opposed to QUEUE, it allows you to put a packet into any specific queue, identified by its 16-bit queue number. It can only be used with Kernel versions 2.6.14 or later, since it requires the nfnetlink_queue kernel support. The queue-balance option was added in Linux 2.6.31.
> --queue-num value
> This specifies the QUEUE number to use. Valid queue numbers are 0 to 65535. The default value is 0.
> --queue-balance value:value
> This specifies a range of queues to use. Packets are then balanced across the given queues. This is useful for multicore systems: start multiple instances of the userspace program on queues x, x+1, .. x+n and use "--queue-balance x:x+n". Packets belonging to the same connection are put into the same nfqueue."
>
> However, on each of those queues, when you read a packet from the socket to the queue you have to return a verdict on that packet before you get any more packets off that socket. At least that's what I've observed.
>
> Jeff Haran
>

I do use the queue-balance option to use multiple cores of the
machines by means of separate application.

But for my purpose, concatenation of udp payload this does not help.
What i've come to understand that there is no straight forward way to
achieve this.

But if i do this in following way would that work:

I will save the udp payload in a user   managed queue and set the
verdict as NF_DROP to every packet. after creating the concatenated
packet, i will forward the message to the udp daemon.

What are difficulties i may face if i chose to do it in this way?



-- 
-aft
