From: Marek Kierdelewicz <marek@piasta.pl>
Subject: Re: QoS weirdness : HTB accuracy
Date: Thu, 25 Mar 2010 20:36:30 +0100
Message-ID: <20100325203630.30cf2254@catlap>
References: <067c83163988908ef546d7ff7f560a17@localhost>
	<20100325193140.1593fd51@catlap>
	<9661da2402edd9880c000f38833ea360@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <9661da2402edd9880c000f38833ea360@localhost>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Julien Vehent <julien@linuxwall.info>, netfilter@vger.kernel.org

Hi,

From my point of view, it looks like class 20 is borrowing, so the
>other classes are not authorized to borrow whatever is left.

How do you measure the bandwidth consumed by each fraction of traffic
that you visualise on image? Are values gathered from iptables rule
counters?

Best regards,
Marek
