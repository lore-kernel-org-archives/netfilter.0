From: Knute Johnson <groups@585ranch.com>
Subject: Re: Is "--ctstate RELATED" deprecated ?
Date: Wed, 25 Oct 2017 15:14:52 -0500
Message-ID: <7533b1a6-9886-3289-cd90-8ec5ea4036e4@585ranch.com>
References: <236899556.60177991.1508838174605.JavaMail.root@zimbra65-e11.priv.proxad.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORGFT3430488.onmicrosoft.com; s=selector1-knutejohnson-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=ge81T9vWzI52v8+BTV9mi5a1sUejvxrDM3KthSqXcXE=;
 b=hLwObOhpPv20CvgQYBoBMXXLNuMvo351fuCVQEGWPEGqs58Ag+8+d5lMc/ZStHq0ccZa60FlHEm+HoOIfErYSIWs7pkQGBzYYvlkzpc4xi1Ys4PHaFEbfzp2bOblZ4x0gZ03nms565K1G0GotlW5rjqCmxFDgCfyXN4se7+BM/0=
In-Reply-To: <236899556.60177991.1508838174605.JavaMail.root@zimbra65-e11.priv.proxad.net>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

On 10/24/2017 04:42, marcfun@free.fr wrote:
> Hello,
> 
> Upgrading my gateway rig, my iptables rules broke for some protocols.
> 
> I tracked the issue down to the conntrack rules regarding RELATED packets.
> On a clean archlinux install (that is a 4.13.8 kernel with iptables v1.6.1, conntrack-tools  v1.4.4), I do this :
> 
> [root@archlinux ~]# iptables -t raw -A OUTPUT -p tcp --dport 21 -j CT --helper ftp
> [root@archlinux ~]# iptables -A INPUT -m conntrack --ctstate RELATED -m helper --helper ftp -j ACCEPT
> [root@archlinux ~]# iptables -A INPUT -m conntrack --ctstate RELATED -j ACCEPT
> 
> => That gives :
> 
> [root@archlinux ~]# iptables -nvL
> Chain INPUT (policy ACCEPT 333 packets, 32326 bytes)
>   pkts bytes target     prot opt in     out     source               destination
>      0     0 ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0            ctstate RELATED helper match "ftp"
>      0     0 ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0            ctstate RELATED
> 
> Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
>   pkts bytes target     prot opt in     out     source               destination
> 
> Chain OUTPUT (policy ACCEPT 235 packets, 30284 bytes)
>   pkts bytes target     prot opt in     out     source               destination
> [root@archlinux ~]# iptables -nvL -t raw
> Chain PREROUTING (policy ACCEPT 6 packets, 470 bytes)
>   pkts bytes target     prot opt in     out     source               destination
> 
> Chain OUTPUT (policy ACCEPT 4 packets, 464 bytes)
>   pkts bytes target     prot opt in     out     source               destination
>      0     0 CT         tcp  --  *      *       0.0.0.0/0            0.0.0.0/0            tcp dpt:21 CT helper ftp
> 
> and lsmod shows :
> Module                  Size  Used by
> nf_conntrack_netlink    36864  0
> nfnetlink              16384  1 nf_conntrack_netlink
> xt_helper              16384  1
> iptable_filter         16384  1
> xt_conntrack           16384  2
> nf_conntrack_ftp       20480  1
> nf_conntrack_ipv4      16384  4
> nf_defrag_ipv4         16384  1 nf_conntrack_ipv4
> xt_tcpudp              16384  1
> iptable_raw            16384  1
> xt_CT                  16384  1
> nf_conntrack          110592  6 nf_conntrack_ftp,nf_conntrack_ipv4,xt_helper,nf_conntrack_netlink,xt_CT,xt_conntrack
> libcrc32c              16384  1 nf_conntrack
> [...]
> ip_tables              24576  2 iptable_filter,iptable_raw
> x_tables               32768  7 ip_tables,iptable_filter,xt_tcpudp,iptable_raw,xt_helper,xt_CT,xt_conntrack
> [...]
> 
> 
> I follow the conntrack events for expect with "conntrack -E expect", and i another shell I initiate a PASSIVE FTP session.
> Here's what I get :
> 
> [root@archlinux ~]# conntrack -E expect
>      [NEW] 300 proto=6 src=10.0.2.15 dst=212.27.60.27 sport=0 dport=45647 mask-src=255.255.255.255 mask-dst=255.255.255.255 sport=0 dport=65535 master-src=10.0.2.15 master-dst=212.27.60.27 sport=54004 dport=21 class=0 helper=ftp
> [DESTROY] 300 proto=6 src=10.0.2.15 dst=212.27.60.27 sport=0 dport=45647 mask-src=255.255.255.255 mask-dst=255.255.255.255 sport=0 dport=65535 master-src=10.0.2.15 master-dst=212.27.60.27 sport=54004 dport=21 class=0 helper=ftp
>      [NEW] 300 proto=6 src=10.0.2.15 dst=212.27.60.27 sport=0 dport=27314 mask-src=255.255.255.255 mask-dst=255.255.255.255 sport=0 dport=65535 master-src=10.0.2.15 master-dst=212.27.60.27 sport=54004 dport=21 class=0 helper=ftp
> [DESTROY] 300 proto=6 src=10.0.2.15 dst=212.27.60.27 sport=0 dport=27314 mask-src=255.255.255.255 mask-dst=255.255.255.255 sport=0 dport=65535 master-src=10.0.2.15 master-dst=212.27.60.27 sport=54004 dport=21 class=0 helper=ftp
> 
> ...so far, so good.
> In the raw tables, we see that the packets are correctly assigned the ftp helper :
> 
> [root@archlinux ~]# iptables -nvL -t raw
> Chain PREROUTING (policy ACCEPT 175 packets, 16587 bytes)
>   pkts bytes target     prot opt in     out     source               destination
> 
> Chain OUTPUT (policy ACCEPT 112 packets, 13182 bytes)
>   pkts bytes target     prot opt in     out     source               destination
>     19   853 CT         tcp  --  *      *       0.0.0.0/0            0.0.0.0/0            tcp dpt:21 CT helper ftp
> 
> BUT in the filter table, the RELATED ctstate is not matched...
> [root@archlinux ~]# iptables -nvL
> Chain INPUT (policy ACCEPT 227 packets, 20645 bytes)
>   pkts bytes target     prot opt in     out     source               destination
>      0     0 ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0            ctstate RELATED helper match "ftp"
>      0     0 ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0            ctstate RELATED
> 
> Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
>   pkts bytes target     prot opt in     out     source               destination
> 
> Chain OUTPUT (policy ACCEPT 140 packets, 17006 bytes)
>   pkts bytes target     prot opt in     out     source               destination
> 
> 
> This is on a VM freshly built for the occasion, but I have the same behavior on real hardware (plain intel x64 PC).
> Obviously I'm missing something. Can anyone point me in the right direction ?
> 
> 
> King regards,
> Marc Fundenberger.

I have to preface this that I probably don't know what I'm doing :-). 
I've been fiddling with a Raspberry Pi running Raspbian 9 (Debian for 
ARM) and trying to get passive ftp to work.  I'm using ufw to create the 
rules for the firewall and my 
/proc/sys/net/netfilter/nf_conntrack_helper=0 so I need to use the CT 
target.

Here are the applicable lines from iptables-save (note: no helpers):

-A ufw-user-input -p tcp -m tcp --dport 21 -j ACCEPT
-A ufw-before-forward -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
-A ufw-before-input -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
-A ufw-before-output -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT

and I add:

iptables -A PREROUTING -t raw -p tcp --dport 21 -j CT --helper ftp

and it just works.  I'm running iptables version 1.6.0.

I still haven't figured out how to add this iptables rule to my ufw 
setup so that it will work on startup.  If you have any suggestions on 
that I'd love to hear them.  Also I'm not clear on what the PREROUTING 
chain actually does.

Thanks,


-- 

Knute Johnson
