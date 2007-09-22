From: Amos Jeffries <squid3@treenet.co.nz>
Subject: Re: Redirect outgoing traffic
Date: Sat, 22 Sep 2007 13:59:11 +1200
Message-ID: <46F476EF.9070909@treenet.co.nz>
References: <1108.24.71.32.203.1190422248.squirrel@webmail.sd73.bc.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1108.24.71.32.203.1190422248.squirrel@webmail.sd73.bc.ca>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Dean Montgomery wrote:
> We have a program for that allows teachers to turn off the Internet their
> school classrooms.  Thea script shells into each workstations and blocks
> outgoing traffic to any computer port 80, 8080, etc.
> 
> This works great.  However we would like something more end-user friendly.
> 
> I would like to change this so that the outgoing web traffic gets redirected
> to a small web daemon that displays a message "The teacher has turned off the
> internet".
> 
> Setting up the web daemon was easy.
> 
> However I do not know how to write an iptables firewall rule to redirect all
> outgoing web traffic from the local workstation to a different ip and port.
> 
> e.g.
> redirect any outgoing traffic to any ip on port 80,443,3128,8080 -to-
> 192.168.0.1 port 55580
> 
> Any ideas?
> 

I think you will find it much easier to pass at least each classrooms 
traffic through a control point where all the 'fancy' configuration happens.

I'll admit to some bias being a Squid proxy developer. But take a good 
look at proxy software in general. They can do so much more for web 
traffic control based on many criteria than simple allow/deny at the 
firewall.


Amos Jeffries
