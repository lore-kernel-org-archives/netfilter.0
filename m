From: Vladimir <ml@foomx.de>
Subject: Re: ipset - understanding hash size and maxelem
Date: Fri, 12 Apr 2013 10:53:43 +0200
Message-ID: <20130412105343.40ba965d@vd.bk.hosteurope.de>
References: <20130410141955.590b9ef8@vd.bk.hosteurope.de>
	<1365689159.25705.39.camel@BEWS005.euractiv.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1365689159.25705.39.camel@BEWS005.euractiv.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jimmy Thrasibule <thrasibule.jimmy@gmail.com>
Cc: netfilter@vger.kernel.org

On Thu, 11 Apr 2013 16:05:59 +0200
Jimmy Thrasibule <thrasibule.jimmy@gmail.com> wrote:

> hashsize default value is 1024, minimum seems to be 64 on my system.
> You can specify hashsize to gain memory or have a bigger hash. If you
> already know the maximum size of your set, you can specify hashsize
> near to that value and maxelem to limit the set (for example to
> prevent accidental additions).  

Thanks for your answer. Is there a way to calculate the memory footprint
of certain number of ipset entries? For example 100.000 entries need
100.000 x 2 byte... Or is it possible to display it somehow for an
existing set? 

@jimmy: sorry for double sending. 
