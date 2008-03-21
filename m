From: Martijn Lievaart <m@rtij.nl>
Subject: Re: Bandwith Distribition
Date: Fri, 21 Mar 2008 09:15:10 +0100
Message-ID: <47E36E8E.8070802@rtij.nl>
References: <1205813150.8137.4.camel@tarak.lk.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1205813150.8137.4.camel@tarak.lk.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Tarak Ranjan <contacttrm@yahoo.co.in>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Tarak Ranjan wrote:
> Hi List,
>         i have one 1mbps Internet connection, but the thing is that,
> everyone is getting not more than 30 kbps bandwidth . 25 users we have ,
> using iptables how can i manage my bandwidth ....
>   

Don't use iptables, use tc. Also google for wondershaper.

M4

