From: "Robert Wideman" <rwideman@austin.rr.com>
Subject: RE: [Announce] PacketFlow firewall generator
Date: Tue, 26 Nov 2002 18:03:11 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001201c295a8$6096dfe0$010da8c0@mrboboo.com>
References: <3DE3AA6F.28057.1689A35@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <3DE3AA6F.28057.1689A35@localhost>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

These should be on the ANNOUNCE mailing list and not the user mailing list.
Shouldnt they be????

Robert Wideman 


> I would like to announce the initial public release of a new tool
> called PacketFlow.  It is a free command line XML based iptables
> firewall generator.  I would like to invite you to download and
> evaluate it.
> 
> The basic concept of PacketFlow is that of "security levels."*  Every
> interface has a security level, and it indicates how much the
> interface is trusted.  By  default connections may made from a high
> security interface to a low security interface. By default,
> connections may not be made from  a low security interface to a high
> security interface. Both may be overridden with access lists.
> 
> Several examples are included in the download.  These include dial-up,
> broadband, single DMZ, and multiple DMZ examples.  These should
> illustrate the basics of the configuration file.  There are a few
> features that are not yet shown in the samples, but hopefully they
> will be shown soon.
> 
> PacketFlow is currently able to generate complete rule sets.  Current
> development is focusing on better configuration validation and sanity
> checking.  That said, the rule sets generated from a valid
> configuration file do work well.  You are strongly encouraged to read
> through the generated rules for yourself.
> 
> PacketFlow currently does not support generating NAT rules, but I hope
> to add that in the future.  Any recommendations on a syntax for NAT
> rules would be appreciated.
> 
> I would appreciate any feedback that you could provide.  There is a
> FAQ on the home page listed below, and the source may be downloaded
> from the project page.  Please submit any bugs that you find to the
> bug tracking system on the SourceForge site.
> 
> Sincerely,
> 
> Paul Frieden
> 
> Home page:		http://packetflowfw.sourceforge.net
> Project page:	http://sourceforge.net/projects/packetflowfw/
> 
> 
> * This is very similar to the security-levels used by the PIX firewall
> 
> 
> 

Chris Baker -- technical specialist
614-839-2447x108
cbaker@bbbscolumbus.org
Big Brothers Big Sisters of Central Ohio
www.bbbscolumbus.org


