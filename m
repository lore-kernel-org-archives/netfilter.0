From: "Ethy H. Brito" <ethy.brito@inexo.com.br>
Subject: Re: IPTables
Date: Wed, 11 Apr 2012 10:06:40 -0300
Message-ID: <20120411100640.1182b257@babalu.inexo.com.br>
References: <047d7b10cb31c8716404bd5f56a7@google.com>
	<e89a8ff2474fc99c5604bd608a88@google.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <e89a8ff2474fc99c5604bd608a88@google.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: BigAl.NZ@gmail.com, netfilter <netfilter@vger.kernel.org>

On Wed, 11 Apr 2012 05:30:49 +0000
BigAl.NZ@gmail.com wrote:

> As an update. When I try to connect I ran tcptrack on wlan0 and it
> shows the incoming connection with:
> 
> Client Server State Idle Speed
> 118.92.xx.55:58674 192.168.1.71:80 RESET 1s 0 b/s
> 118.92.xx.55:58673 192.168.1.71:80 RESET 1s 0 b/s
> 118.92.xx.55:58676 192.168.1.71:80 RESET 1s 0 b/s
> 
> Does this seem normal?

it does. But it seems something before Ubuntu is not right.

If I got it right, you should see something like this:

118.92.xx.55:58674 192.168.1.71:5555 ...(forward to port 5555 and not 80.
this way the iptables DNAT rule won't match)

I think your redirections at the router (192.168.1.254) is not doing what
you intended it to do.

> If I monitor eth0 I see no traffic, so the fault must be in my rule  
> somewhere?

You see no traffic because 192.168.1.7 thought it was a connection to itself
at port 80 and RESETed it.

Ethy
