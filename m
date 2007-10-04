From: John Madden <jmadden@ivytech.edu>
Subject: Re: "DNAT" w/o changing source address?
Date: Thu, 04 Oct 2007 09:14:02 -0400
Message-ID: <1191503642.13379.12.camel@localhost.localdomain>
References: <1191424890.25752.27.camel@localhost.localdomain>
	 <47042728.1060508@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <47042728.1060508@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Grant Taylor <gtaylor@riverviewtech.net>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

> Um, correct me if I'm wrong, but Destination NATing should not alter the 
> source IP address of the packet that is being NATed.
> 
> Honestly, I wonder how you are doing your DNATing and if you are not 
> also possibly unknowingly SNATing as well.

Hmm, well here are the rules I'm running.  The port forward:

echo "1" > /proc/sys/net/ipv4/ip_forward
iptables -t nat -A PREROUTING -d $EXTIP -p tcp --dport 25 -j DNAT --to
$MAILSERVER:25

And the SNAT for return traffic:

iptables -t nat -A POSTROUTING -d $MAILSERVER -j SNAT --to $EXTIP

...At least, I found that traffic wouldn't flow without this additional
rule.  Have I gotten something else fundamentally wrong here?

John



-- 
John Madden
Sr. UNIX Systems Engineer
Ivy Tech Community College of Indiana
jmadden@ivytech.edu

