From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: VPN behind Linux Firewall
Date: Mon, 24 Jun 2002 17:57:41 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206241657.RAA16900@slate.rockstone.co.uk>
References: <00ff01c21b9e$fafe0790$0327a8c0@kayegee>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <00ff01c21b9e$fafe0790$0327a8c0@kayegee>
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
To: netfilter@lists.samba.org

On Monday 24 June 2002 5:48 pm, kayegee wrote:

> I have a LINUX firewall protecting my local LAN. I have 2 computers that
> use the Nortel VPN client to connect to my office. I can make the VPN
> connection, but I can't seem to stay connected for more than 10 to 15 min.
> Suddenly the system stops responding. If you look at the VPN icon, only the
> top half of the icon blinks. When things are working properly, both the top
> and bottom half of the VPN icon flash. While this is happening, other
> computers connected to the Internet continue to work without a problem. I
> was looking in /proc/net/ip_conntrack file and notice that I seem to lose
> my connection every time I get an entry like the following in that file:
>
> unknown  50 523 src=192.168.XX.X dst=192.128.166.44 src=192.128.166.44
> dst=XX.XXX.XXX.XX use=1
>
> I'm not sure why I'm getting an unknown packet. I'm also not sure how
> iptables should handle an unknown packet. If anyone can shed some light on
> this subject, I'd greatly appreciate it.

'unknown' in this context simply means that the logging system doesn't know 
what to call protocol 50, which is ESP.   Therefore I surmise that the Nortel 
application is using IPsec.

Are you saying that this entry is *not* present in the connection tracking 
table whilst the VPN connection is operational ?

 

I think it might be interesting to add a logging rule, or use tcpdump / 
ethereal etc, to look for UDP packets from source port 500 to source port 
500, and see if these appear soon before the connection goes downj ?

UDP 500 is the Internet Key Exchange (IKE) protocol, and the two end systems 
might be trying to re-key (although 10-15 minutes is a bit quick), and 
something might be blocking that ?

Just a thought.

 

Antony.

