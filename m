From: "Brent Scriver" <bscriver@speakeasy.org>
Subject: Re: iptables and their use..
Date: Sun, 2 Jun 2002 08:59:12 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <003501c20a4e$70827580$4000a8c0@thought>
References: <200206021136.51855.ve1drg@av.eastlink.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Ted Gervais <ve1drg@av.eastlink.ca>, netfilter@lists.samba.org


Well, I have a list of things I'm covering in my scripts, which I have
available at http://www.oneoddsock.com/resources/linuxrouter.html.  I set up
everything coming in to DROP in the PREROUTING chain consistent with the
drop everything except what you want.  I ensure DHCP works.  I allow
ESTABLISHED,RELATED connections.  I ensure that packets coming in from
outside don't have a source address from inside my network, and similarly
that packets going outside don't have a source address from outside on the
internet.  After that, I allow inside to internet connections since I have 3
machines on the inside and can see them all :) so I trust them, and I open
up a small set of ports and NAT them to the web server (1 of the 3 machines)
such as for http, ftp, etc.  An extra note is I have ICMP blocked from the
outside, so you can't even ping any of the machines and you also don't get
an ICMP packet back saying a connection was denied, just as if the box
wasn't there.  This helps reduce scans because your machine doesn't look
like it even exists on the network...

HTH,
Brent

----- Original Message -----
From: "Ted Gervais" <ve1drg@av.eastlink.ca>
To: <netfilter@lists.samba.org>
Sent: Sunday, June 02, 2002 7:36 AM
Subject: iptables and their use..


>
> I am looking at using iptables and have been reading. I have an
understanding
> on how to set up some basic commands to make a firewall but what I have a
> problem with, is what do I filter?
>
> I don't know what is important (to me) to filter.  I know we all need some
> sort of firewall to protect ourselfs and systems against 'sutff'  out
there,
> but just what is that.  I suppose one could start with making certain
subnets
> available to myself and deny/reject all others, but I am not sure that is
how
> to go about it..
>
> So - as a general rule, what does one do?  What do people block and what
do
> they accept??
>
> --
> Ted Gervais
> Coldbrook, Nova Scotia Canada.
> 1-902-679-2253
>
>


