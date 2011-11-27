From: Amos Jeffries <squid3@treenet.co.nz>
Subject: Re: TPROXY getting the remote/destination address via sockets API
Date: Sun, 27 Nov 2011 16:56:29 +1300
Message-ID: <4ED1B4ED.4090808@treenet.co.nz>
References: <4ED1A034.9030802@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4ED1A034.9030802@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Brian <unixman83@gmail.com>
Cc: netfilter@vger.kernel.org

On 27/11/2011 3:28 p.m., Brian wrote:
> Using the latest TPROXY, how does one accurately get the 
> destination/remote (and the source/localish) addresses of the 
> transparent proxy connection?

Very reliable. At least we (Squid proxy) have had no problems with the 
kernel 2.6.39+ TPROXY. Just some screwups on our side of the implementation.

>
> I would assume one address would be returned by the accept() call, 
> which one, and how do I get the other?

You assume correct. The other is available from getsockname() on the new FD.

With TPROXY the IPs are reversed. That is; the IP which for normal 
traffic would arrive on accept() appears instead on getsockname(), and 
vice versa. So any software receiving TPROXY traffic is required to 
isolate the listening port from normal traffic listening ports to avoid 
problems interpreting the IPs.

HTH
AYJ

