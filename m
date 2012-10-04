From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: Strange problems on iptables (FC17) .... need your help
Date: Thu, 4 Oct 2012 11:15:36 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1210041106360.12092@nerf07.vanv.qr>
References: <1349288885.6825.9.camel@indica.cc.iitb.ac.in>  <alpine.LNX.2.01.1210040058160.6228@nerf07.vanv.qr> <1349327392.14307.15.camel@indica.cc.iitb.ac.in>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1349327392.14307.15.camel@indica.cc.iitb.ac.in>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ajit K Jena <ajit@iitb.ac.in>
Cc: netfilter@vger.kernel.org


On Thursday 2012-10-04 07:09, Ajit K Jena wrote:
>On Thu, 2012-10-04 at 01:02 +0200, Jan Engelhardt wrote:
>> On Wednesday 2012-10-03 20:28, Ajit K Jena wrote:
>> 
>> >  c) The "inward" log entry is **NOT** produced in the logfile.
>> >  d) It appears as if the packet is simply dropped.
>> >  How do I go about debugging this further ?
>> 
>> Log all other packets that are not logged by the outward or inward one.
>> Their contents may be sufficiently different that your rules don't fire.
>
>[...] I am beginning to suspect that there is some difference in
>iproute software between FC10 and FC11 (or FC17). The iptables/ipset
>part per se have no problem.

There is sort of a "checklist" one can go through to see what
happens.

1. Make sure the packet does arrive at all at the machine - tcpdump.

2. Determine if the packet passes the routing lookup.
   http://backreference.org/2010/06/11/iptables-debugging/

The log entries will reveal where it is dropped. - Namely, the
absence of entries will. If there is no filter:FORWARD:rule:XXX line
but a xxx:PREROUTING:rule:XXX line, it is an indication that it went
missing between those two points, which can be an indicator that
the route lookup yielded no usable route.
