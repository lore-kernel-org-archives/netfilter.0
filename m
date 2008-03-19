From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Route packets by source IP
Date: Wed, 19 Mar 2008 16:19:40 -0500
Message-ID: <47E1836C.7050707@riverviewtech.net>
References: <47DFCF36.3060500@riverviewtech.net> <43cba8b55bae94158c0580f06e368ea4@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <43cba8b55bae94158c0580f06e368ea4@localhost>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 03/19/08 13:21, Franck JONCOURT wrote:
> This is perhaps not a good way to do, but I was thinking about using 
> the __ip route__ command.
> 
> ip route add 192.168.2.0/24 via 192.168.0.2
> 
> where 192.168.2.0/24 would be the B1 network and 192.168.0.2 would be 
> the B2 ip address.
> 
> Is that wrong ?

"ip route" routes traffic based on destination IP address not 
necessarily the network that it would pass through to get there.  So if 
you have traffic headed to my web server, you can not use "ip route" to 
get it there with out specifying my servers IP address / subnet in the 
ip route command.



Grant. . . .
