From: Khanh Tran <khanh@slc.edu>
Subject: RE: netfilter/iptables LOG not logging MAC addresses
Date: Sat, 1 Feb 2003 17:41:57 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <01CEA3A5B8B2D511890F0002A5870AEC5FB573@EXCHANGE>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
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
Content-Transfer-Encoding: 7bit
To: "Alexander W. Janssen" <yalla@ynfonatic.de>
Cc: "'netfilter@lists.samba.org'" <netfilter@lists.samba.org>

The source IP from this log line is on the LAN local to the firewall box and
I still don't get the MAC address.  I don't even get "MAC=" without the MAC
address.  It just isn't there!

Feb  1 13:19:03 Weir-01 kernel: [IPTABLES FORWARD] : IN=eth1 OUT=eth2
SRC=172.16.14.136 DST=x.x.x.x LEN=1500 TOS=0x00 PREC=0x00 TTL=127 ID=56689
DF PROTO=TCP SPT=1485 DPT=3943 WINDOW=32767 RES=0x00 ACK URGP=0

Thanks again for the help...

Khanh Tran
Network Operations
Sarah Lawrence College

 

-----Original Message-----
From: Alexander W. Janssen [mailto:yalla@ynfonatic.de]
Sent: Saturday, February 01, 2003 6:18 PM
To: Khanh Tran
Cc: 'netfilter@lists.samba.org'
Subject: Re: netfilter/iptables LOG not logging MAC addresses


You'll see the MAC only if the source- or destination host are really on the
local LAN where the firewall-box is connected iirc.

Alex.

-- 
"Mr Data, when I said 'Fire at Will', I didn't mean for you to be so
literal."
Instructions for use of this post: Insert tounge in cheek. Read as normal.


