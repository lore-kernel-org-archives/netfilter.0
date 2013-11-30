From: Phil Oester <kernel@linuxace.com>
Subject: Re: iptables redirects packets to local proxy
Date: Sat, 30 Nov 2013 12:17:50 -0800
Message-ID: <20131130201749.GB23089@home>
References: <529A42E6.7030504@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <529A42E6.7030504@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Antonio Prado <thinkofit@gmail.com>
Cc: ilic_68@yopmail.com, netfilter@vger.kernel.org

On Sat, Nov 30, 2013 at 07:56:22PM +0000, Antonio Prado wrote:
> On 30/11/13 17:40, Phil Oester wrote:
> > Use -j REDIRECT --to 12345
> 
> If I get it correctly, the OP wants to redirect to 127.0.0.1:12345 after
> having changed destination address and port to the packets.
> Is that possible anyway?

You have to pick where you want to change the destination to.  Either x:12345
or y:40000 - can't have it both ways.  Seems the socks proxy should be configured
to send the traffic to y:40000.  

Phil
