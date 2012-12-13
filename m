From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: Formal submission of Xtables2
Date: Thu, 13 Dec 2012 12:36:21 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1212131214100.20007@nerf07.vanv.qr>
References: <alpine.LNX.2.01.1212130601210.9421@nerf07.vanv.qr> <20121213110046.GA22337@1984>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
In-Reply-To: <20121213110046.GA22337@1984>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Netfilter Developer Mailing List <netfilter-devel@vger.kernel.org>, Netfilter user mailing list <netfilter@vger.kernel.org>

On Thursday 2012-12-13 12:00, Pablo Neira Ayuso wrote:

>On Thu, Dec 13, 2012 at 07:00:07AM +0100, Jan Engelhardt wrote:
>[...]
>> Please consider for merging.
>
>nftables and its compatibility layer already provide this and we will
>not have to maintain two different netlink interfaces, which is too
>much overhead.

I refer you to our previous discussion on the topic
for the justifications:
http://www.spinics.net/lists/netfilter-devel/msg23919.html

Netlink is not the main selling point.
