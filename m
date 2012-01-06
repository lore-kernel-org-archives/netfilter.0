From: =?ISO-8859-1?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: redundancy with Adsl modem
Date: Fri, 06 Jan 2012 18:12:03 +0100
Message-ID: <4F072B63.7060609@freemail.hu>
References: <CAMTjHrw92RRMe4Y2cGfVsS6eBrvL-=1pYCueOC7vOW=RT_-=7g@mail.gmail.com> <1325574854.2270.130.camel@andybev-desktop> <CAMTjHrxMUCb1b4tKeQon9QuJCxp3YunwJ7BiPfBtCokGFLYkWg@mail.gmail.com> <op.v7jefiizx1lyi3@debiandesk2.net> <4F041738.9090908@freemail.hu> <op.v7kb75oyx1lyi3@debiandesk2.net> <4F0493D5.3040001@freemail.hu> <CAMTjHrw4Rrb7c4h5Sv2jRctiUcqWD8O-xZx54M9Dp5jc8qZYdQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAMTjHrw4Rrb7c4h5Sv2jRctiUcqWD8O-xZx54M9Dp5jc8qZYdQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: =?ISO-8859-1?Q?Usu=E1rio_do_Sistema?= <maiconlp@ig.com.br>
Cc: Lloyd Standish <lloyd@crnatural.net>, Andrew Beverley <andy@andybev.com>, Mail List - Netfilter <netfilter@vger.kernel.org>

Hi,

>   yes, I need redundancy. when an line adsl come down all traffic go to
> other line adsl. I couldn't have done this on linux machine. if you
> has any how to about please post here.

How do you want to do that???

If you have two connections then you have two external IP-s...
If one goes down then you can not simply use the other one...

Just think about these steps:

In normal connection:

1. a local host (A - 192.168.1.1) sends a packet from LAN to an external 
host (C - 8.8.8.8)
2. the firewall applies source NAT to the packet and sends it out as if 
it were coming from the firewall's first external IP (B1 - 1.1.1.1)
3. C sends back a reply to B1
4. B1 forwards it with destination NAT to A.
5. go to step 1. or close the connection

If the line goes down between step 2 and step 3 then the reply packet 
will never get back to B1 and A (because the line is down) !!!
If the line goes down after step 4 then you can send it out on the 
second extrenal IP (B2 - 2.2.2.2) but C will see it as a NEW connection !!!

So I think that your request is impossible on IP level.
However you can use a proxy or a mail server, etc. etc. etc.

Swifty
