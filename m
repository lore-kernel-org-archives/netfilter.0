From: Ramin Alidousti <ramin@cannon.eng.us.uu.net>
Subject: Re: DHCP and conntrack?
Date: Fri, 7 Jun 2002 15:36:10 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020607193610.GO29214@cannon.eng.us.uu.net>
References: <3D00E6A3.30006@athensgroup.com> <20020607173835.GA599@escape.ca>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <20020607173835.GA599@escape.ca>
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
Content-Transfer-Encoding: 7bit
To: sshore@escape.ca
Cc: James Garrison <jhg@athensgroup.com>, netfilter@lists.samba.org

On Fri, Jun 07, 2002 at 12:38:35PM -0500, sshore@escape.ca wrote:

> On Fri, Jun 07, 2002 at 12:00:19PM -0500, James Garrison wrote:
> > Does connection tracking understand incoming DHCP responses as
> > being related to recent outgoing broadcast DHCP requests?  In other
> > words,  if I configure iptables to allow outgoing DHCP broadcast
> > requests, do I have to explicitly open up a hole for the returning
> > response, or will conntrack do it for me with RELATED?
> 
> Since dhcp requests go out on port 68, and responses come back on port 67, 
> connection tracking will not relate them.

It's like you say, http traffic is not being tracked because the
outgoing packets go out on port 8 and the incoming packets come in
on port whatever like 1025. So, no, that's not the reason. The
reason could be this:

15:26:43.933324 vlan6 B 0.0.0.0.bootpc > 255.255.255.255.bootps: xid:0xdefebd43
15:26:43.981708 vlan6 > 10.0.6.1.bootps > 255.255.255.255.bootpc: xid:0xdefebd43

As you can see there is no "regular" src.port/dst.port relationship
here for the general conntrack module to catch this.

I hope that some guru someday will add this intelligence to the
code :-)

Ramin

> you'll need to explicitly open 
> up a hole for the returning response.
> 
> -- 
> Scottie Shore <sshore@escape.ca>
> "You haven't gamed until you've circle-strafed while barrel rolling."
>   - Blair on the Logitech Cyberman II



