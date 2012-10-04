From: Ajit K Jena <ajit@iitb.ac.in>
Subject: Re: Strange problems on iptables (FC17) .... need your help
Date: Thu, 04 Oct 2012 10:39:52 +0530
Message-ID: <1349327392.14307.15.camel@indica.cc.iitb.ac.in>
References: <1349288885.6825.9.camel@indica.cc.iitb.ac.in>
	 <alpine.LNX.2.01.1210040058160.6228@nerf07.vanv.qr>
Reply-To: ajit@iitb.ac.in
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1210040058160.6228@nerf07.vanv.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Engelhardt <jengelh@inai.de>
Cc: netfilter@vger.kernel.org

Hi Jan and Other Listmembers,

Thanks for your quick reply and pointing out my
English deficiencies.

The port range issues u have mentioned are just
for the experimental setup. We will change them
suitably when we go "live".

Continuing with my test environment, I noticed
another issue. I setup a web server in the public
network with IP address 59.162.23.252. I tried to
reach that server from my intranet machine
(with IP 10.209.13.6). Everything works fine in
that test case. If I run tcpdump on the external
ethernet interface I see the request packet
originating from 59.162.23.79 and going out to
59.162.23.252. The reply packet comes back with
target IP 59.162.23.79. Subsequently the reply
packet dst address gets mapped properly to the IP
10.209.13.6 and routed to the intranet machine
properly.

I am beginning to suspect that there is some
difference in iproute software between FC10 and
FC11 (or FC17). The iptables/ipset part per se
have no problem.

Please do share your views and help me out.

Regards.

--ajit

On Thu, 2012-10-04 at 01:02 +0200, Jan Engelhardt wrote:
> On Wednesday 2012-10-03 20:28, Ajit K Jena wrote:
> >
> ># The following is to just produce a log of all outgoing packets from
> ># IPs that are members in the set src_nm_set.
> ># The set has only one member with IP 10.209.13.6.
> >
> >-A FORWARD -p tcp -m set --match-set src_nm_set src \
> >        -m multiport --dports 80:64000 -j LOG --log-level 4 --log-prefix
> >"nm_http_outword: "
> 
> Why would you allow ports 81 through 64000? That seems like the oddest
> range ever, even more so than the usually pointless 1024:65535.
> 
> ># The following is to just produce a log of all incoming packets
> >-A FORWARD -p tcp -m set --match-set src_nm_set dst \
> >        -m multiport --sports 80:64000 -j LOG --log-level 4 --log-prefix
> >"nm_http_inword: "
> 
> (outward - inward. No words here.)
> 
> >  c) The "inward" log entry is **NOT** produced in the logfile.
> >  d) It appears as if the packet is simply dropped.
> >  How do I go about debugging this further ?
> 
> Log all other packets that are not logged by the outward or inward one.
> Their contents may be sufficiently different that your rules don't fire.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


