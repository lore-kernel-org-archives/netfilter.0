From: "Peter Reckmann" <preckmann@online.de>
Subject: Need tech explanation for NFLog TLV type 16 (0x10) - hardware link layer header
Date: Wed, 27 Jan 2016 14:00:40 +0100
Message-ID: <5335FB9FCD34414CBC32917DA4973A03@computer1>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@vger.kernel.org

TLV type 16 (0x10) is "hardware link layer header".  Normally, the data for 
this field has a length of 14 bytes.  6 for the destination MAC, 6 for the 
source MAC, and 2 for the Ethernet type (08 00) which is IP.  This seems to 
be the Ethernet Header for the packet.  But, about 20% of the packets I am 
seeing have a length of 30 bytes.  So in addition to sMac, dMac, type, I am 
seeing an extra 12 bytes.  What is this?  Here is an example:

45:00:00:3C:2B:6A:00:00:80:11:8D:B9

I have seen this in a regular iptables log before.  Here is an example:

owblk_udp_drop IN=eth0 OUT=eth1 
MAC=b8:27:eb:c2:bd:37:00:1b:77:d2:88:62:08:00:45:00:00:3f:06:5a:00:00:7f:11:ab:c5 
SRC=192.168.0.61 DST=192.168.8.1 LEN=63 TOS=0x00 PREC=0x00 TTL=127 ID=1626 
PROTO=UDP SPT=1242 DPT=53 LEN=43.

So MAC= comes back with DesMac, SrcMac, and type again and then there are 
these additional bytes: 45:00:00:3f:06:5a:00:00:7f:11:ab:c5

Again 12 bytes.  They always start with 45:00:00 What are these?  What do 
they represent?

Thanks in advance! 

