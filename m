From: Michele Petrazzo - Unipex <michele.petrazzo@unipex.it>
Subject: Re: Port Forwarding Question
Date: Fri, 08 May 2009 17:57:20 +0200
Message-ID: <4A045660.3070605@unipex.it>
References: <8ec0428d0905061125n7aad6c74nc3b63bfedf890fa8@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <8ec0428d0905061125n7aad6c74nc3b63bfedf890fa8@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Aaron Clausen <mightymartianca@gmail.com>
Cc: netfilter@vger.kernel.org

Aaron Clausen wrote:
>  With the 3Com router, I can, from another internal computer,
> access that server via the external interface (ie, by going
> http://publicaddress).  When I throw in my Linux router, it does not
> do that, and user's have to use the internal IP or host name to access
> the device.
>

What rules have you wrote?
an
iptables -t nat -A PREROUTING -s local_addrs/mask -d ip_addrs \
	 -p tcp --dport http -j DNAT --to-destionation internal_web
and the respective
iptables -t nat -A POSTROUTING -d internal_web -p tcp --dport http -j 
SNAT --to-source gw_ip

must to the trick.

So the request stay inside the lan and there is no "loops"

Michele
