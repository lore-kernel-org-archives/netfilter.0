From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: moblock
Date: Thu, 25 Sep 2008 09:13:24 -0500
Message-ID: <48DB9C84.4050405@riverviewtech.net>
References: <48DB7391.40609@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48DB7391.40609@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 09/25/08 06:18, Brent Clark wrote:
> Anyone use this.
> 
> http://moblock.berlios.de/

No, I can't say as I do.

> If so, what do you think of it, and more importantly, does it work?

It looks like the filtering is done in user space rather than by 
IPTables.  I don't know what to think about this.  I personally would be 
more interested in this if it ran in kernel space and you provided it 
the list of blocked sites via /proc or sysctl or the likes.  But, if it 
works, more power to it.




Grant. . . .
