From: Greg Wilson-Lindberg <gregw@spacex.net>
Subject: Re: Multiple interfaces with the same IP address
Date: Wed, 7 Oct 2009 13:52:31 -0700
Message-ID: <4ACCFF8F.1010000@spacex.net>
References: <4ACCEDDA.9020508@spacex.net> <4ACCF3F0.5040703@hp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4ACCF3F0.5040703@hp.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Rick Jones <rick.jones2@hp.com>
Cc: Greg Wilson-Lindberg <Greg.Wilson-Lindberg@spacex.com>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>


Rick Jones wrote:
...

> 
> Is there a specific reason you cannot further subnet the 10.0.0.0/8 network for 
> your HDLC channels and eschew the NAT?  Then at least ignoring the issue of 
> "routing" broadcast datagrams (these are IP broadcasts and not simply ethernet 
> broadcasts right?) reaching-out and touching the HDLC devices from the WAN would 
> seem to be more straightforward.
> 
> rick jones
> visions of many static routing table entries floating through his head

The 10.0.0.0/8 network is an existing network that has 100's of computers on it.  We are planning on 
  using some 10.x.0.0/16 addresses to NETMAP to the 172.16.0.0/16 addresses in some limited 
situations, but this doesn't solve the problem of routing to the correct HDLC channel to get to the 
final destination.

Greg
