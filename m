From: Thomas Jacob <jacob@internet24.de>
Subject: Re: Local to Local via firewall
Date: Fri, 31 Jul 2009 18:06:21 +0200
Message-ID: <1249056381.27177.12.camel@enterprise.ims-firmen.de>
References: <20090731144247.01a4f9bb@zeus.int.pccl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20090731144247.01a4f9bb@zeus.int.pccl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Clayton <andrew@digital-domain.net>
Cc: netfilter@vger.kernel.org

On Fri, 2009-07-31 at 14:42 +0100, Andrew Clayton wrote:
[.. accessing outside IPs on a NAT router from
the inside network ...]

> I can't help but think I'm missing something simple. Then again does
> what I'm trying to do make sense?

Just don't DNAT/SNAT packets from the internal network to
your public IPs, there is no need for it anyway.

e.g. do something like this before your other DNATs

$IPTABLES -t nat -A PREROUTING -i eth1 -s 192.168.0.0/16 -p tcp -d
$HOST_E -j RETURN

Plus, of course, you need to allow access to that IP/port from the
internal network in the INPUT chain of the filter table.


