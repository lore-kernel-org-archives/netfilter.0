From: Vladislav Kurz <vladislav.kurz@webstep.net>
Subject: Re: Iptables find invalid packets
Date: Mon, 21 Jul 2008 15:06:29 +0200
Message-ID: <200807211506.29492.vladislav.kurz@webstep.net>
References: <48847F16.8040604@itool.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48847F16.8040604@itool.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Monday 21 of July 2008, Dimitri GOURDON wrote:
> Hi all,
>
> I've setup LVS on a box using Keepalived (and Iptables) to load balance
> traffic between 2 web servers. I have a problem :
>
> A lot of TCP packets with FIN or RST flags (all I think) from clients
> are dropped by Iptables as state INVALID. The consequence is that I have
> a lot of connection in FIN_WAIT state (shown by netstat) on the 2 web
> servers...

I have similar problem, and asked about it here. I was told to try newer 
kernel (I run debian stable - 2.6.18). However I didn't upgrade yet, but If 
you run the same kernel as I do and upgrade would help you I'd like to here 
about that.

-- 
Regards
        Vladislav Kurz
