From: Ramin Alidousti <ramin@cannon.eng.us.uu.net>
Subject: Re: Speed Issues through NAT Firewall
Date: Tue, 9 Jul 2002 14:28:26 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020709182826.GZ25368@cannon.eng.us.uu.net>
References: <001701c2276e$3a94a0a0$6702a8c0@mindtrip.com> <20020709173858.GY25368@cannon.eng.us.uu.net> <006801c22772$6faa9340$6702a8c0@mindtrip.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <006801c22772$6faa9340$6702a8c0@mindtrip.com>
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
To: Travis Crook <travis@visionsbeyond.com>
Cc: Ramin Alidousti <ramin@cannon.eng.us.uu.net>, netfilter@lists.samba.org

On Tue, Jul 09, 2002 at 11:59:56AM -0600, Travis Crook wrote:

>  > Hello,
>  >     I currently have two firewalls running.  Both on Mandrake 8.1 running
> iptables.  I currently have two internet connections (one is a DSL line at
> 1Mb, the other is straight from an ISP at 2.5 Mb).  I can get 700Kb speeds
> through the firewall on the DSL line (which is about as fast as it ever is)
> but I only get about 500Kb speeds through the firewall on the ISP line.
> Shouldn't I be able to get at least 2Mb speeds through this firewall?
> >
> > How do you measure the throughput?
> 
> I used http://promos.mcafee.com/speedometer and http://www.dslreports.com.
> I can get 3Mb testing on the firewall itself but not on a machine behind the
> firewall.

Haven't been able to check the second site but the first one sends you a
file and measures the actual download time. Now, imagine what happens when
there is congestion along the path. Your throughput would show a very low
number while the actual problem does not have anything to do with you and/or
your upstream router.

The reason for your "ISP line" showing 500kb and the "DSL line" showing 700Kb
is IMO irrelevant to the netfilter overhead/througput. However, the delta between
the same test done (a) on the firewall (b) from behind the firewall might
be an indication of how fast (or slow, for that matter) the firewall machine
is forwarding the packets.

Like Patrick has pointed out, first of all you need to make sure that your
devices and the wiring is healthy, though.

Ramin

> 
> > Ramin
> > PS. Line breaks are good things.
> 
> I'll use more linebreaks.  Thanks!

