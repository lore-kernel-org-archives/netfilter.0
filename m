From: Jan Engelhardt <jengelh@computergmbh.de>
Subject: Re: New connlimit: how to use?
Date: Sun, 9 Mar 2008 22:37:25 +0100 (CET)
Message-ID: <Pine.LNX.4.64.0803092236310.21961@fbirervta.pbzchgretzou.qr>
References: <20071207105645.586a0f23@penpal4u.net> <20080304135201.7df21ed1@penpal4u.net>
 <Pine.LNX.4.64.0803091725340.26142@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.0803091725340.26142@fbirervta.pbzchgretzou.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christian Lerrahn <lists@penpal4u.net>
Cc: netfilter@vger.kernel.org


On Mar 9 2008 17:26, Jan Engelhardt wrote:
>On Mar 4 2008 13:52, Christian Lerrahn wrote:
>>
>>One thing that I have found out in the meantime, however, is that I do
>>see something in my kernel logs which is
>>
>>cannot load conntrack support for address family 2
>>
>>and does help me just as much as the errors above because conntrack
>>seems to be in the kernel.
>
>Hmmm.... I'll see if I can reproduce that.

No problem detected on my side. Make sure that conntrack *IS*
in the kernel or as a module, because you _definitely_
lack nf_conntrack_ipv4.
