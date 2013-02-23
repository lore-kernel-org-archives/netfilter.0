From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: how to write rule specification according to port availablity
Date: Sat, 23 Feb 2013 10:12:09 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1302231011490.5304@nerf07.vanv.qr>
References: <CAJhv45gug+73Fr4w2s+snYzPn1bMK-BLbvJGpx1cJOQn6jhPfQ@mail.gmail.com> <20130222155020.GM3672@harrier.slackbuilds.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20130222155020.GM3672@harrier.slackbuilds.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On Friday 2013-02-22 16:50, /dev/rob0 wrote:

>On Fri, Feb 22, 2013 at 04:19:12PM +0800, Donghua Liu wrote:
>> Now I have such a scenario that I should write different nat rules
>> according to the designated locally port is open or not.
>> For example, if the port is listening then do the nat operation,
>> otherwise do not use this rule.
>
>There's nothing within Netfilter/iptables to do this.

-m socket?
