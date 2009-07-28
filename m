From: Marek Kierdelewicz <marek@piasta.pl>
Subject: Re: now to increase ip_conntrack_max in 2.6.28?
Date: Tue, 28 Jul 2009 08:53:20 +0200
Message-ID: <20090728085320.6046d2ed@catlap>
References: <010b01ca0f4c$50596f10$f10c4d30$@com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <010b01ca0f4c$50596f10$f10c4d30$@com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alec Matusis <matusis@yahoo.com>
Cc: netfilter@vger.kernel.org

Hi Alec,

>On 2.6.28 (ubuntu 9.04) the entire /proc/sys/net/ipv4/netfilter
>directory is missing. Moreover, 

Make sure you have nf_conntrack loaded. It you do, then file you're
looking for is here:
/proc/sys/net/nf_conntrack_max

Cheers,
Marek Kierdelewicz
