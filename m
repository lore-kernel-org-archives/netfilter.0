From: Pandu Poluan <pandu@poluan.info>
Subject: Re: Timeout for TCP connections
Date: Thu, 24 Feb 2011 07:41:23 +0700
Message-ID: <AANLkTimK4rgj6qu798WzyH=+eA5Q4p6CRe+j=kcwdjak@mail.gmail.com>
References: <A7B48E1B-130E-4904-9E8F-22AA42418720@aol.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <A7B48E1B-130E-4904-9E8F-22AA42418720@aol.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jobhunts02@aol.com
Cc: netfilter@vger.kernel.org

I think what you're looking for is:

net.ipv4.tcp_fin_timeout

Of course after changing that, you'll have to do
/etc/rc.d/init.d/network restart

Alternatively, recycle:

net.ipv4.tcp_tw_recycle = 1

Rgds,



On 2011-02-24, jobhunts02@aol.com <jobhunts02@aol.com> wrote:
> I am seeing it take several minutes for TCP connections to be closed after
> data has stopped flowing.  I saw the same behavior with UDP connections and
> was able to shorten the time by setting ip_conntrack_udp_timeout and
> ip_conntrack_udp_timeout_stream to 5.
>
> I have tried modifying the TCP variables in /proc/sys/net/ipv4/netfilter and
> nothing seems to lower the time for TCP connections to close.
>
> Any suggestions how to make TCP connections close faster?--
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>


-- 
--
Pandu E Poluan - IT Optimizer
My website: http://pandu.poluan.info/
