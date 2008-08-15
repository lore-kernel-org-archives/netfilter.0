From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: VPN (interface) access for and all traffic through from single
 user -- how to do it?
Date: Fri, 15 Aug 2008 10:29:49 -0500
Message-ID: <48A5A0ED.8010502@riverviewtech.net>
References: <200808151255.44987.janklodvan@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <200808151255.44987.janklodvan@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 08/15/08 04:55, Jan Klod wrote:
> There is one thing really troubling me for fourth day and I hope, 
> this is the right place to ask for advices: I have VPN access through 
> LAN NIC, I managed to log in the VPN server and, using ping -I ppp0 
> some.host.domain got an answer. Nothing more this far, but the 
> initial goal was simply to grant an user access to VPN as toppic 
> subject describes. Just like I would have started firefox -I ppp0!
> 
> (all user's traffic through ppp0, while other users can still go 
> through eth1!)
> 
> Also this created an extra question: how web browser "knows", which 
> interface should be used, if there are multiple?

(With out having even looked at the links you provided I'm going to take 
a stab in the dark.)

I believe you are wanting to have your traffic go through the VPN as a 
default rather than through your existing default gateway.  (Presuming 
that this is the case.)

Add a route to the IP address of your remote VPN end point via your 
current default gateway.  (Bring the VPN up if it is not already up.) 
Add a new default gateway of the *inside* remote end of the VPN.  Remove 
your existing local default gateway.  Or if you would like you can 
change the metric of your existing local default gateway so that it is 
higher (thus less preferred) than the default gateway on the other end 
of the VPN.

Doing this will allow anything on the VPN client computer to route its 
traffic through the VPN with out having to modify any thing specific to 
each program.



Grant. . . .
