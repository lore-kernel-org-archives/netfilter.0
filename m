From: "R. DuFresne" <dufresne@sysinfo.com>
Subject: RE: Ping only inside my network
Date: Mon, 20 Dec 2004 02:43:21 -0500 (EST)
Message-ID: <Pine.LNX.4.05.10412200242010.18976-100000@darkstar.sysinfo.com>
References: <20041220073406.E37712F42A@kshira.sterenborg.info>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20041220073406.E37712F42A@kshira.sterenborg.info>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rob Sterenborg <rob@sterenborg.info>
Cc: netfilter@lists.netfilter.org

On Mon, 20 Dec 2004, Rob Sterenborg wrote:

> netfilter-bounces@lists.netfilter.org wrote:
> 
> >   First time to write, i hope i do it the right way :) i want
> 
> Welcome :o)
> 
> > to be able to make pings inside my network. At the moment i
> > am trying to ping my linux box from an windows terminal and i get
> > request timed out. 
> 
> You don't give much information about what you've done already, but you
> have probably set the policy for the INPUT chain to DROP so it will drop
> any packet for which NF has no rule to accept it.
> In that case you'll have to accept ICMP traffic from your LAN :
> iptables -A INPUT -i $IF_LAN -s $IP_LAN -p icmp -j ACCEPT
> 
> If you have also set policy to DROP for the OUTPUT chain, you'll want to
> be able to send the reply packets :
> iptables -A OUTPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
> 

Doesnt; this also require a FORWARD rule for other systems inside the lan
to talk to one another>  And might not the OUTPUT rulke include NEW,
incase he wants replies from the FW tself to be returned?

Thanks,

Ron DuFresne
-- 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        admin & senior security consultant:  sysinfo.com
                        http://sysinfo.com

...Love is the ultimate outlaw.  It just won't adhere to rules.
The most any of us can do is sign on as it's accomplice.  Instead
of vowing to honor and obey, maybe we should swear to aid and abet.
That would mean that security is out of the question.  The words
"make" and "stay" become inappropriate.  My love for you has no
strings attached.  I love you for free...
                        -Tom Robins <Still Life With Woodpecker>


