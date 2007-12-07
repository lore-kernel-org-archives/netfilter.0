From: Christian Lerrahn <lists@penpal4u.net>
Subject: Re: New connlimit: how to use?
Date: Fri, 7 Dec 2007 23:55:14 +1100
Message-ID: <20071207235514.592f568c@penpal4u.net>
References: <20071207105645.586a0f23@penpal4u.net>
	<001d01c838a6$b80326c0$0220a8c0@rs>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <001d01c838a6$b80326c0$0220a8c0@rs>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Fri, 7 Dec 2007 08:56:47 +0100
<sadrafal@o2.pl> wrote:

> Do you see " kernel: ip_tables: connlimit match: invalid size 32 !=
> 16" in /var/log/messages ?
> Use the latest iptables snapshot (pom not needed) - problem fixed
> Kernel 2.6.24-rc4
> iptables v1.4.0rc1-20071205

No, I don't see any message like that in the logs. But I'll give the new
kernel and iptables versions a shot sometime. Thanks for the hint.

Cheers,
Christian
