From: Jan Engelhardt <jengelh@computergmbh.de>
Subject: Re: port forwarding question
Date: Mon, 17 Mar 2008 19:13:33 +0100 (CET)
Message-ID: <Pine.LNX.4.64.0803171912010.18817@fbirervta.pbzchgretzou.qr>
References: <1205771195.2681.14.camel@dev002.ctekproducts.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1205771195.2681.14.camel@dev002.ctekproducts.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Phil Sutter <phil@ctekproducts.com>
Cc: netfilter@vger.kernel.org


On Mar 17 2008 09:26, Phil Sutter wrote:
>
>I thought I could do the following but it does not work:
>
>iptables -t nat -A PREROUTING -i ppp0 -p tcp --dport 5080:5085 -j DNAT
>--to 192.168.1.10:80-85
>
>Is there a way to do what I want to do with a single command or do I
>have to forward each port with an individual command?

To do it with a single rule requires your own target extension.

:80-85 just tells it to choose any one of it.
