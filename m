From: "Mark E. Donaldson" <markee@bandwidthco.com>
Subject: RE: Help with port forwarding
Date: Fri, 24 Oct 2003 21:59:06 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <LFEHKEBEBHAFGJBMNKAOEEIJCDAA.markee@bandwidthco.com>
References: <FDAFEC98D318F74CA26B5A26F2B4965227C54A@exchange.jfctechnologies.com>
Reply-To: <markee@bandwidthco.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <FDAFEC98D318F74CA26B5A26F2B4965227C54A@exchange.jfctechnologies.com>
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
To: "Kleiner, Peter" <kleinerp@smbmicro.com>, netfilter@lists.netfilter.org

Check and see if translation is actually occurring.  The easiest way is to
fire up tcpdump on the out interface, generate some traffic on some known
ports so you can determine the source of the packets, and then check you
tcpdump output and see if the IP was actually translated.  If it is
translating, then you have most likely narrowed your problem down to routing
or an interface configuration problem (run ifconfig and netstat -nr.
If it is not translating, then I would start by checking for properly loaded
modules or kernel configuration (run lsmod).  It has got to be something
fairly simple I would think.

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Kleiner, Peter
Sent: Friday, October 24, 2003 6:34 AM
To: 'netfilter@lists.netfilter.org'
Subject: RE: Help with port forwarding


Thus spake Mark E. Donaldson:
> Peter - I don't see anything obvious in the script that could be
> problematic.  What do you mean by "port forwarding not
> working"?
When I run the script as shown, I can telnet through any of the filtered
ports (110, 143, 443) on the working PC, but not on the not-working PC.

> Are you
> getting any error messages?
None whatsoever.  I tried logging the traffic, but nothing showed up.
Interestingly, when I had logging on, it showed various attempts at
port 135:
Oct 21 16:55:45 gw kernel: IN=eth1 OUT=
MAC=00:30:21:07:ef:94:00:02:b9:91:7d:40:08:00 SRC=63.67.218.114
DST=XX.XX.4.7 LEN=64 TOS=0x00 PREC=0x00 TTL=115 ID=44619 DF PROTO=TCP
SPT=4168 DPT=135 WINDOW=64240 RES=0x00 SYN URGP=0
Oct 21 16:55:46 gw kernel: IN=eth1 OUT=
MAC=00:30:21:07:ef:94:00:02:b9:91:7d:40:08:00 SRC=63.67.218.114
DST=XX.XX.4.7 LEN=64 TOS=0x00 PREC=0x00 TTL=115 ID=44889 DF PROTO=TCP
SPT=4168 DPT=135 WINDOW=64240 RES=0x00 SYN URGP=0
Oct 21 16:55:46 gw kernel: IN=eth1 OUT=
MAC=00:30:21:07:ef:94:00:02:b9:91:7d:40:08:00 SRC=63.67.218.114
DST=XX.XX.4.7 LEN=64 TOS=0x00 PREC=0x00 TTL=115 ID=45129 DF PROTO=TCP
SPT=4168 DPT=135 WINDOW=64240 RES=0x00 SYN URGP=0
Oct 21 16:59:23 gw kernel: IN=eth1 OUT=
MAC=00:30:21:07:ef:94:00:02:b9:91:7d:40:08:00 SRC=66.156.169.85
DST=XX.XX.4.7 LEN=48 TOS=0x00 PREC=0x00 TTL=112 ID=47221 DF PROTO=TCP
SPT=2180 DPT=135 WINDOW=16384 RES=0x00 SYN URGP=0
Oct 21 16:59:24 gw kernel: IN=eth1 OUT=
MAC=00:30:21:07:ef:94:00:02:b9:91:7d:40:08:00 SRC=66.156.169.85
DST=XX.XX.4.7 LEN=48 TOS=0x00 PREC=0x00 TTL=112 ID=47351 DF PROTO=TCP
SPT=2180 DPT=135 WINDOW=16384 RES=0x00 SYN URGP=0
[sorry for the long text lines]
But nothing was recorded when I tried to telnet to ports 110, 143 or 443.

> Is translation being performed
> but the packets
> are not routed?
I'm not sure how to tell that.  Possibly.  Running nmap of the public
address shows:
Starting nmap V. 3.00 ( www.insecure.org/nmap/ )
Interesting ports on  (XX.XX.4.7):
(The 1596 ports scanned but not shown below are in state: closed)
Port       State       Service
22/tcp     open        ssh
25/tcp     open        smtp
110/tcp    filtered    pop-3
143/tcp    filtered    imap2
443/tcp    filtered    https

> I might be able to generate some ideas here
> if you can be
> more specific.
Please let me know what else you need.  I am completely baffled.  Why would
the same
script work on one machine and not the other?  That is why I listed the
lsmod in my
original post.  I wonder if it's something not related to iptables.....?

> By the way, I believe you are meaning to
> block the Auth
> protocol (port 113):  that being the case, you need to
> specify TCP and not
> UDP.
Fixed.  Thanks!

Pete



