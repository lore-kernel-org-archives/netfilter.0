From: Marek Kierdelewicz <marek@piasta.pl>
Subject: Re: iptaccount/shaping
Date: Thu, 1 Sep 2011 20:19:18 +0200
Message-ID: <20110901201918.390de5b4@catus>
References: <1314894806.28901.574.camel@worklian.computerisms.bob>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1314894806.28901.574.camel@worklian.computerisms.bob>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bob Miller <bob@computerisms.ca>
Cc: netfilter@vger.kernel.org

>Hello,

Hi,

>I have a firewall that provides internet to two networks, a private one
>...
>My question is: is it somehow possible I am leaking data on my outside
>port that would trigger the ISP counter but not iptaccount?  Is there
>some layer 2 traffic of which I am not aware that would tell the ISP
>what the intended traffic before shaping might be?  I have been dumping
>and analyzing traffic for hours and found nothing, but maybe there is
>something I don't know about that would explain this.

First of all try to compare isp data with what you see on ethernet
interface connected to that isp:
ip link show -s dev ethX

You should get something like this:

    RX: bytes  packets  errors  dropped overrun mcast   
    714301652  713443   0       0       0       3494   
    TX: bytes  packets  errors  dropped carrier collsns 
    79328329   501677   0       0       2       0

Stats show actual data sent/received (since reboot) including layer2
headers. Gathered data should exacly match your isp stats.

Best regards,
Marek Kierdelewicz

