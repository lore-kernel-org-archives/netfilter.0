From: Dean Montgomery <dmonty@sd73.bc.ca>
Subject: Re: Redirect outgoing traffic
Date: Wed, 26 Sep 2007 16:46:17 -0700
Message-ID: <200709261646.17702.dmonty@sd73.bc.ca>
References: <1108.24.71.32.203.1190422248.squirrel@webmail.sd73.bc.ca> <46F84FEA.7010008@rtij.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <46F84FEA.7010008@rtij.nl>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Martijn Lievaart <m@rtij.nl>, netfilter@vger.kernel.org




On September 24, 2007, you wrote:
> Dean Montgomery wrote:
> > We have a program for that allows teachers to turn off the Internet their
> > school classrooms.  Thea script shells into each workstations and blocks
> > outgoing traffic to any computer port 80, 8080, etc.
> >
> > This works great.  However we would like something more end-user
> > friendly.
> >
> > I would like to change this so that the outgoing web traffic gets
> > redirected to a small web daemon that displays a message "The teacher has
> > turned off the internet".
> >
> > Setting up the web daemon was easy.
> >
> > However I do not know how to write an iptables firewall rule to redirect
> > all outgoing web traffic from the local workstation to a different ip and
> > port.
> >
> > e.g.
> > redirect any outgoing traffic to any ip on port 80,443,3128,8080 -to-
> > 192.168.0.1 port 55580
> >
> > Any ideas?
>
> This can be done with a DNAT rule, if, and only if, the return traffic
> from the proxy goes back through the firewall. The syntax is trivial,
> use 'iptables -j DNAT -h' to get help on the syntax.

Only problem with this is that I want the rule on the local workstation and 
not on the nat box.  DNAT table is not picked up by local traffic leaving the 
workstation.

So this does not work...
iptables -t nat -A PREROUTING -p tcp -m tcp --dport 80 -j 
DNAT --to-destination :48888



-- 
Dean Montgomery
Network Support Tech./Programmer
School District #73
