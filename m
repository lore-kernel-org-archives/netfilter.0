From: Martijn Lievaart <m@rtij.nl>
Subject: Re: Redirect outgoing traffic
Date: Tue, 25 Sep 2007 02:01:46 +0200
Message-ID: <46F84FEA.7010008@rtij.nl>
References: <1108.24.71.32.203.1190422248.squirrel@webmail.sd73.bc.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1108.24.71.32.203.1190422248.squirrel@webmail.sd73.bc.ca>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Dean Montgomery <dmonty@sd73.bc.ca>
Cc: netfilter@vger.kernel.org

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

This can be done with a DNAT rule, if, and only if, the return traffic 
from the proxy goes back through the firewall. The syntax is trivial, 
use 'iptables -j DNAT -h' to get help on the syntax.

As the webdeamon is trivial, you can also set it up on the firewall 
itself. That way you don't have the issue with the return traffic.

For https do note that the client will always get an ugly certificate 
warning (certificate does not match requested name and probably a second 
one that the root certificate is not trusted). This cannot be helped 
(easily).

HTH,
M4

