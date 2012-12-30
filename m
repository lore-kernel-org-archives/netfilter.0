From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Mirroring traffic with iptables TEE target
Date: Mon, 31 Dec 2012 00:28:32 +0100
Message-ID: <20121230232832.GA30047@1984>
References: <20121230091048.GA4575@devnull.qunarservers.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20121230091048.GA4575@devnull.qunarservers.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Aaron Lewis <the.warl0ck.1989@gmail.com>
Cc: netfilter mailing list <netfilter@vger.kernel.org>

On Sun, Dec 30, 2012 at 05:10:48PM +0800, Aaron Lewis wrote:
> Hi,
> 
> I tried to mirror TCP traffic with mangle chain, 
> 
> that all packets sent to 192.168.56.2 would be copied to 192.168.56.1,
> 
> # On 192.168.56.2 I executed,
> iptables -A PREROUTING -p tcp --dport 80 -j TEE --gateway 192.168.56.1
> 
> But on 192.168.56.1 no traffic to port 80 was seen
> 
> Anything wrong?

There was a bug in the 3.6 series that broke TEE, but that is fixed in
-stable. What kernel are you using?
