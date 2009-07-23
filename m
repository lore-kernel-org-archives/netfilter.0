From: Andrew Schulman <andrex-cmaem7PIVQQM4YKboWzA4l6hYfS7NtTn@public.gmane.org>
Subject: Re: Is there any patch that makes iptables get Dynamic Access List?
Date: Thu, 23 Jul 2009 11:41:53 -0400
Message-ID: <t31h65199vtd2hsuvetre90h7p53g56dmq@4ax.com>
References: <ff3811580907230706nfec2577ya45b538d02f6db85@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: netfilter-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

> Dear all,
> I'm learning firewall in both Cisco and iptables. After a long time
> searching, i found no thing in iptables can compare to Cisco
> Lock-n-Key (Dynamic Access List) (i find in the Patch-O-Matic too).

I don't know what Lock-n-Key is, but if you want to filter on dynamically
changeable lists of IP or MAC addresses, then you probably want ipset:
http://ipset.netfilter.org/ .

--
To unsubscribe from this list: send the line "unsubscribe netfilter" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
