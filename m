From: Dean Montgomery <dmonty@sd73.bc.ca>
Subject: Re: Redirect outgoing traffic
Date: Mon, 24 Sep 2007 15:32:33 -0700
Message-ID: <200709241532.33886.dmonty@sd73.bc.ca>
References: <1108.24.71.32.203.1190422248.squirrel@webmail.sd73.bc.ca> <46F476EF.9070909@treenet.co.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <46F476EF.9070909@treenet.co.nz>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org
Cc: Amos Jeffries <squid3@treenet.co.nz>

Amos Jeffries wrote:
>
> I think you will find it much easier to pass at least each classrooms
> traffic through a control point where all the 'fancy' configuration
> happens.

We already have a proxy server running that captures all http traffic and 
filters it through dansguardian.

I would prefer to have an iptables rule on the client workstation to redirect 
http traffic to a different server.


e.g.
redirect any outgoing traffic to any ip on port 80,443,3128,8080 -to-
192.168.0.1 port 55580

I'm just looking for the right iptables syntax.

Thanks.




-- 
Dean Montgomery
Network Support Tech./Programmer
School District #73
