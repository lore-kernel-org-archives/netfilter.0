From: Marek Kierdelewicz <marek@piasta.pl>
Subject: Re: tc and making QoS
Date: Fri, 30 Apr 2010 12:51:46 +0200
Message-ID: <20100430125146.416f05f9@catlap>
References: <u2of1cc03e01004300304gcde0364cxbdf93e74f3fd2661@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <u2of1cc03e01004300304gcde0364cxbdf93e74f3fd2661@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mamadou =?UTF-8?B?VG91csOp?= <e2ia.ci@gmail.com>
Cc: netfilter@vger.kernel.org

Hi Mamadou,

>Is never match for the http downstream. And that make a sense because
>the dport of the downstream is not 80.

Try changing "dport 80" into "sport 80" in following command:

>tc filter add dev  eth2  protocol ip parent 1:  prio 1 u32   match ip
>dst 192.168.2.88/32  match ip protocol  6  0xff match ip dport  80
>0xffff flowid  1:8170

That should do it.

Best regards,
Marek
