From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Load Balance
Date: Mon, 16 May 2011 19:45:45 -0500
Message-ID: <4DD1C539.20404@riverviewtech.net>
References: <BANLkTimUdLO55Bqrv3=VjDo14-BsLP7xWQ@mail.gmail.com>	 <1305480225.1708.2.camel@andybev>	 <BANLkTim4bnzaeD9yny7uV6fBfB=k-XAc6A@mail.gmail.com> <1305581912.2041.15.camel@andybev-desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1305581912.2041.15.camel@andybev-desktop>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 5/16/2011 16:38, Andrew Beverley wrote:
> If you don't do this, then each gateway will only see half the
> packets for a connection stream, which although I am not an expert, I
> guess is not a good thing.

The problem has to do with the fact that most connections are using NAT 
at the edge, not a globally routable IP behind the load balancer with 
multiple routes back in.

So what happens is that some of the traffic for a session is sent out 
one gateway and being NATed to one external IP and the other traffic for 
the same session is being sent out the other gateway and being NATed to 
a different external IP.  Thus, the server sees weird traffic, coming 
from two different IPs.  One connection exhibits drops and the other 
exhibits incorrect sequence (think TCP 3-way handshake).  The server 
will abort the out of order / incorrect state traffic, which really 
causes the client to abort the entire connection.  You end up with a 
mess.  Thus you need to use something like conntrack to make connections 
be persistent when NAT is involved like that.



Grant. . . .
