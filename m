From: Johnoel Ancheta <johnoel@hawaii.edu>
Subject: Re: RE: PPTP server behind firewall
Date: Fri, 27 Jun 2003 11:48:39 -1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7056c36feb11.6feb117056c3@hawaii.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-language: en
Content-Disposition: inline
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

> > i building a floppy router.  it works except for the vpn
> > support.  i've had this working before using Brian Kuschak
> > pptp kernel patches a long time ago.  since then i lost my notes.
> 
> Are you aware that Brian Kuschak's patch is obsolete as of 2.4.19 
> or so?
> The equivalent patch is known as the pptp-conntrack-nat patch and is
> bundled in the netfilter patch-o-matic utility.
i used Kuschak's patch for kernel 2.4.12or15 (i can't remember) and it
worked.  i spent about a week trying to get the patch-o-matic-20030107
working.  i watched packets fly and were unable to make the connection.
so, i gave up and decided to use 2.4.19 with Brian Kuschak's patch and
iptables-1.2.8.  in one hour everything worked.

i think i patched linux-2.4.20 correctly since i can see these files in
the kernel src.
+++
linuxppc-020802-newnat14-h323/include/linux/netfilter_ipv4/ip_conntrack_pptp.h
     Fri Aug  2 14:37:28 2002
+++
linuxppc-020802-newnat14-h323/include/linux/netfilter_ipv4/ip_conntrack_proto_gre.h
Fri Aug  2 14:37:28 2002
+++
linux-2.4.18-pptp3.01//include/linux/netfilter_ipv4/ip_conntrack_tuple.h
   Mon Apr  8 12:42:36 2002
+++
linuxppc-020802-newnat14-h323/include/linux/netfilter_ipv4/ip_nat_pptp.h
   Fri Aug  2 14:37:28 2002
+++ linux-2.4.18-pptp3.01//net/ipv4/netfilter/ip_conntrack_core.c      
Mon Apr  8 13:30:11 2002
+++ linux-2.4.18-pptp3.01//net/ipv4/netfilter/ip_conntrack_pptp.c      
Mon Apr  8 16:40:37 2002
+++ linux-2.4.18-pptp3.01//net/ipv4/netfilter/ip_conntrack_pptp_priv.h 
Mon Apr  8 12:42:36 2002
+++ linux-2.4.18-pptp3.01/net/ipv4/netfilter/ip_conntrack_proto_gre.c  
2002-08-29 13:01:00.000000000 +0200
+++ linux-2.4.18-pptp3.01//net/ipv4/netfilter/ip_nat_core.c     Mon Apr
 8 13:21:45 2002
+++ linux-2.4.18-pptp3.01//net/ipv4/netfilter/ip_nat_pptp.c     Mon Apr
 8 16:40:47 2002
+++ linux-2.4.18-pptp3.01//net/ipv4/netfilter/ip_nat_proto_gre.c       
Mon Apr  8 16:40:56 2002
+++ linuxppc-benh-190302-newnat-pptp2.06/net/ipv4/netfilter/Config.in  
Thu Apr  4 16:12:41 2002
+++ linuxppc-benh-190302-newnat-pptp2.06/net/ipv4/netfilter/Makefile   
Thu Apr  4 16:12:41 2002

anyhow, i should try and trace the problem in the src but i don't 
understand what going on there.  thanks all for your help.

johnoel@hawaii.edu




