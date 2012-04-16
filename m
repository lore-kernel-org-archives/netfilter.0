From: Ed W <lists@wildgooses.com>
Subject: Re: ipset causes reverse dns lookups?
Date: Mon, 16 Apr 2012 02:15:39 +0100
Message-ID: <4F8B72BB.4010307@wildgooses.com>
References: <4F8B5925.5020307@wildgooses.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4F8B5925.5020307@wildgooses.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter <netfilter@vger.kernel.org>

On 16/04/2012 00:26, Ed W wrote:
> In particular if I lock down iptables (-P DROP), then the above 
> command takes quite some seconds to complete, rather than instantly if 
> I open up iptables.  This is causing me some problems with startup 
> scripts
>
> Am I missing some configuration option? Is this a bug? Why is a 
> reverse DNS lookup needed?

eg

$ iptables -I INPUT -j REJECT
$ time ipset create cp2 bitmap:ip,mac range 192.168.1.1/24
ipset v6.9.1: Set cannot be created: set with the same name already exists
Command exited with non-zero status 1
real    0m 45.11s
user    0m 0.01s
sys     0m 0.00s

$ iptables -F
$ time ipset create cp2 bitmap:ip,mac range 192.168.1.1/24
ipset v6.9.1: Set cannot be created: set with the same name already exists
Command exited with non-zero status 1
real    0m 0.01s
user    0m 0.00s
sys     0m 0.00s


/var/log/messages:
Apr 16 01:14:55 localhost daemon.info dnsmasq[6272]: query[PTR] 
1.1.168.192.in-addr.arpa from 127.0.0.1
Apr 16 01:14:55 localhost daemon.info dnsmasq[6272]: config 192.168.1.1 
is NXDOMAIN-IPv4

What am I doing wrong?
