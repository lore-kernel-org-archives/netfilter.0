From: Gavin Hamill <gdh@acentral.co.uk>
Subject: New not syn (again...)
Date: Fri, 1 Aug 2003 12:17:21 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200308011217.21953.gdh@acentral.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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

Hi :)

I've been happily building a firewall with iptables and kernel 2.4.20 over the 
last few weeks, and it's now gone live quite happily. All our webstats show 
that the amount of web traffic hasn't gone down, so I'm not blocking stuff 
that was previously getting through, and that pleases me :)

My question is regarding syn packets, and probably statefulness... I'm getting 
a lot of log messages like this:

Aug  1 12:01:13 fw-ws kernel: New not syn:IN=br0 OUT=br0 PHYSIN=eth1 
PHYSOUT=eth0 SRC=194.200.209.12 DST=195.76.168.52 LEN=52 TOS=0x00 PREC=0x00 
TTL=64 ID=2543 DF PROTO=TCP SPT=2720 DPT=25 WINDOW=16560 RES=0x00 ACK PSH FIN 
URGP=0

Aug  1 12:01:58 fw-ws kernel: New not syn:IN=br0 OUT=br0 PHYSIN=eth0 
PHYSOUT=eth1 SRC=20.138.254.2 DST=194.200.209.11 LEN=40 TOS=0x00 PREC=0x00 
TTL=47 ID=16936 PROTO=TCP SPT=36128 DPT=80 WINDOW=65535 RES=0x00 ACK FIN 
URGP=0

Aug  1 12:01:58 fw-ws kernel: New not syn:IN=br0 OUT=br0 PHYSIN=eth1 
PHYSOUT=eth0 SRC=194.200.209.13 DST=207.45.248.19 LEN=1500 TOS=0x00 PREC=0x00 
TTL=64 ID=36534 DF PROTO=TCP SPT=80 DPT=48847 WINDOW=6912 RES=0x00 ACK URGP=0

Aug  1 12:02:00 fw-ws kernel: New not syn:IN=br0 OUT=br0 PHYSIN=eth0 
PHYSOUT=eth1 SRC=217.7.162.45 DST=194.200.209.17 LEN=40 TOS=0x00 PREC=0x00 
TTL=114 ID=50109 DF PROTO=TCP SPT=38555 DPT=80 WINDOW=0 RES=0x00 RST URGP=0

Aug  1 12:02:00 fw-ws kernel: New not syn:IN=br0 OUT=br0 PHYSIN=eth0 
PHYSOUT=eth1 SRC=217.7.162.45 DST=194.200.209.17 LEN=40 TOS=0x00 PREC=0x00 
TTL=114 ID=50110 DF PROTO=TCP SPT=38554 DPT=80 WINDOW=0 RES=0x00 RST URGP=0

We have busy webservers saturating a 2Mbps link during most of the day, and 
whilst things seem to be working fine, I don't understand what the logs are 
telling me.  I've certainly googled enough, and read a lot of mail, FAQs and 
tutorials, but if someone could point me in the right direction, I'd be very 
grateful :)

A cut-down version of the entire fw script is at http://gdh.ca/fw.txt if some 
kind soul would like to take a gander...

Cheers,
Gavin.


