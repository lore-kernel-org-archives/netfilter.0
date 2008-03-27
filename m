From: Whit Blauvelt <whit@transpect.com>
Subject: Re: Why does ipv6 enabled interfere with ipv4 SNAT?
Date: Thu, 27 Mar 2008 10:15:02 -0400
Message-ID: <20080327141502.GB3288@transpect.com>
References: <20080325012807.GA15637@transpect.com> <alpine.LNX.1.10.0803250254100.9368@fbirervta.pbzchgretzou.qr> <20080325024424.GA16089@transpect.com> <Pine.LNX.4.64.0803251156560.1535@blackhole.kfki.hu> <20080325142553.GA8783@transpect.com> <Pine.LNX.4.64.0803261036220.3620@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.0803261036220.3620@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: Jan Engelhardt <jengelh@computergmbh.de>, netfilter@vger.kernel.org

On Wed, Mar 26, 2008 at 10:45:29AM +0100, Jozsef Kadlecsik wrote:

> But which netfilter modules are loaded in? Again, there can be some 
> auto-loading problem which we cannot figure out without the list of the 
> modules. And as Patrick suggested: do you see the connections in 
> /proc/net/nf_conntrack? Or you have got /proc/net/ip_conntrack instead?

I've just posted the modules list. What should I be looking for between
/proc/net/nf_conntrack vs /proc/net/ip_conntrack? Anything that matches the
internal or external IP? What should be there so I can check for anomoly,
since I don't want to just put raw data to the list.

Thanks,
Whit
