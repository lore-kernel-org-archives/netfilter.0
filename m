From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: how to block files with specific extensions
Date: Fri, 6 Sep 2002 11:48:43 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209061048.g86Amnv01907@vulcan.rissington.net>
References: <20020906100410.27681.qmail@web12902.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20020906100410.27681.qmail@web12902.mail.yahoo.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

On Friday 06 September 2002 11:04 am, saravanan sakthi wrote:

> Dear friend,
>  iam usind rc.firewall for NATing. This Linux box acts
> as a gateway for my client systems to connect to the
> internet. now here i want to block files with certain
> extensions passing to my client machines. please help
> me ...

You need a content filtering system (proxy server) to do this - netfilter is 
a packet filter and cannot do what you want.

You might be tempted to use the string match in iptables to match file 
extensions but it will not work completely and you will almost certainly get 
both:
files you want to block actually passing through
files or other commands you want to accept being blocked

I suggest you look into something like Squid or Hogwash.

Antony.

-- 

Documentation is like sex:
when it's good, it's very very good;
when it's bad, it's still better than nothing.

