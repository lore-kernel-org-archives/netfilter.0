From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Session tracking failure - ssh packets dropped as INVALID
Date: Mon, 11 Feb 2008 18:36:51 +0100 (CET)
Message-ID: <Pine.LNX.4.64.0802111828200.16716@blackhole.kfki.hu>
References: <691DA14F-3FD0-4E19-A61C-74F34E095E49@uq.edu.au>
 <47AEA957.2030707@caf.com.tr> <47AF5BAE.7030700@rtij.nl>
 <F7BF9AD4-B6CE-4DCB-A2E1-85E16AC38282@uq.edu.au> <47AFAEA4.2040202@snapgear.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <47AFAEA4.2040202@snapgear.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Philip Craig <philipc@snapgear.com>
Cc: John Zornig <j.zornig@uq.edu.au>, netfilter@vger.kernel.org

On Mon, 11 Feb 2008, Philip Craig wrote:

> John Zornig wrote:
> > echo "1" > /proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_be_liberal
> 
> This is just a workaround for a bug.
> 
> Are you using a recent kernel?
> 
> It would be good to work with Jozsef to get this fixed if you are able
> to help debug it.  Also report it on the netfilter-devel list.
> 
> To debug, I think the first steps are to enable logging with:
> 
> 	modprobe ipt_LOG
> 	echo 255 >/proc/sys/net/netfilter/nf_conntrack_log_invalid
> 
> and check your syslog for errors.
> 
> Also get a tcpdump of the ssh traffic with something like:
> 
> 	tcpdump -i eth0 -s 0 -w dump.pcap tcp port 22

Exactly. By enabling ip_conntrack_tcp_be_liberal you just mask the 
problem. And without dumped traffic to analyze I cannot do anything to 
improve the kernel.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
