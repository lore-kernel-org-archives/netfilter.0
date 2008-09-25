From: Brent Clark <brentgclarklist@gmail.com>
Subject: Re: moblock
Date: Thu, 25 Sep 2008 16:54:47 +0200
Message-ID: <48DBA637.3020001@gmail.com>
References: <48DB7391.40609@gmail.com> <48DB9C84.4050405@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48DB9C84.4050405@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: 'Mail List - Netfilter' <netfilter@vger.kernel.org>

Grant Taylor wrote:
> On 09/25/08 06:18, Brent Clark wrote:
>
> It looks like the filtering is done in user space rather than by 
> IPTables.  I don't know what to think about this.  I personally would 
> be more interested in this if it ran in kernel space and you provided 
> it the list of blocked sites via /proc or sysctl or the likes.  But, 
> if it works, more power to it.
But what I have to do is that  I keep having to remind myself is that 
iptables is for layer 3 /4 operation. But then what does layer 7 control?

Well it seems to be the way to go, look at other tools like snort 
inline. And also whats interesting is that I see some of the BSD lot use 
/ recommend this type of filtering (snort2pf).


