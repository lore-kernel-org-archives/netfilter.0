From: Khaled Hussein <khaled@bisan.com>
Subject: Re: Diskless and Firewall
Date: Sat, 03 Apr 2010 10:28:30 +0300
Message-ID: <1270279710.3340.2.camel@khaled-laptop>
References: <1270117547.3335.15.camel@khaled-laptop>
	 <4BB4AB9E.3080208@ait.ac.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4BB4AB9E.3080208@ait.ac.at>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Roman Fiedler <roman.fiedler@ait.ac.at>
Cc: netfilter <netfilter@vger.kernel.org>

Dear Roman, 

how can i set conntrack liberal globally (via proc)? 


Best Regards,
==========================
Khaled J. Hussein
Senior System Engineer
Bisan Systems Ltd.
Tel: +970-22985941
Fax: +970-22985942
Web: www.bisan.com
Email: khaled@bisan.com
========================== 


On Thu, 2010-04-01 at 16:20 +0200, Roman Fiedler wrote: 
> Khaled Hussein wrote:
> > Dear All,
> > 
> > I am running a machine with diskless boot, it is running CentOS, i have problem with iptables, when i restart iptables i lost connection with NFS server so i lost my hard disks and machine become unreachable, this happened when i use DROP as default policy on INPUT and OUTPUT and FORWARD chains, i tried to use mangle table with default ACCEPT on these chains but the same, if i changed default policy to ACCEPT on above chains, so is there any way to avoid this problem
> 
> I had same problem with autosetup thingy recently. I think that the following fixed the problem for me (and not something else, that I overlooked while tuning the configs):
> 
> * Set conntrack liberal globally (via proc)
> 
> * Load minimal iptables set with accept on all chains (which is as secure as having no rules, like before, so nothing lost)
> 
> * Make sure to have traffic on all connections your want to keep alive, netfilter seems to create conntracks for them (you might use the conntrack tools for the same work also). In your case you might open a file, you haven't read yet to force NFS traffic.
> 
> * Switch to your final ruleset, that has a --state ESTABLISHED -j ACCEPT at the beginning of each chain (I loaded with iptables-restore to avoid glitches that might kill a connection)
> 
> * Disable conntrack liberal
> 
> The final rules were strict, with output filtering and stateful connection tracking.
> 
> Hope this is helpful,
> 


*************
This  message has been scanned for viruses and dangerous content by Bisan Systems Ltd  MailScanner, and is believed  to be clean. Bisan Systems Ltd  does  not  represent  that  any  attachment  is free from computer viruses or defects and the user assumes all responsibility  for any  loss, damage  or  consequence  resulting  directly  or  indirectly  from  the use of any attachment. The information  contained  in  any  email  does not necessarily  reflect the views of Bisan systems or any other related entities or persons.

