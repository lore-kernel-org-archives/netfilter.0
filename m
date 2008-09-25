From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: moblock
Date: Thu, 25 Sep 2008 11:36:59 -0500
Message-ID: <48DBBE2B.1070603@riverviewtech.net>
References: <48DB7391.40609@gmail.com> <48DB9C84.4050405@riverviewtech.net> <48DBA637.3020001@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48DBA637.3020001@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 09/25/08 09:54, Brent Clark wrote:
> But what I have to do is that I keep having to remind myself is that 
> iptables is for layer 3 /4 operation. But then what does layer 7 control?

Keep in mind that IPTables can filter on layers 2, 3, 4, and 7, 
depending on how it is used.

> Well it seems to be the way to go, look at other tools like snort 
> inline. And also whats interesting is that I see some of the BSD lot use 
> / recommend this type of filtering (snort2pf).

I'm not saying that there is any thing wrong with moblock.  I just find 
it a little odd that we are passing traffic from kernel space to user 
space to filter (as I (mis)understood it) by IP, a layer 3 address.  So 
I guess my question is why not just filter with IPTables on layer 3? 
Why pass from kernel space to user space to do the filtering if we don't 
have to.

Now, if one of moblock's advantages is that it can take pre-generated 
files of IPs to filter and use them directly, then that is a plus.  I 
would just be more interested in something that could feed those IPs in 
to something like an IP Set and do the filtering in kernel space.

It is my (mis)understanding that Snort (and the likes) do a lot more 
than simple layer 2 / 3 / 4 / 7 filtering.  I.e. they take notice of a 
LOT more different things including timing between what is done.  In 
some ways I look at things like Snort as doing stateful filtering across 
multiple layers as a whole rather than each layer individually.  There 
is also the added advantage that things like Snort tend to be platform 
agnostic and thus easier to update where as IPTables / pf / etc are 
platform dependent and not portable.

Back to above, I'd be very interested in something that could translate 
the guarding.p2p and p2p.p2b files in to something like an IPSet.  I 
think that would be a wonderful use.  Download platform independent 
libraries and then translate them in to platform dependent and native in 
kernel filtering.  Just my $0.02 worth.



Grant. . . .
