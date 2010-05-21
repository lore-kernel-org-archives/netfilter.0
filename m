From: martin.nuernberger@ratiodata.de
Subject: Iptable drops DUP ACK Packets
Date: Fri, 21 May 2010 11:16:47 +0200
Message-ID: <OF4A5CE26C.B7EF6C6A-ONC125772A.0032E3DF-C125772A.0032F9D4@ratiodata.de>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi, 

we face a strange Problem with the Retransmission of Packets. 
We have changed our Firewall from Open SuSE 9.0 to OpenSuSE 10.3 some time 
ago. That includes a Kernel Update from 2.4.21-99 to 2.6.22.5-31 and an an 
update of iptables from 1.2.8 to 1.3.8. Hardware is both 32-Bit Systems 
with Intel Gigabit e1000 Interfaces. 
The iptables Ruleset is cerated by FWBuilder and is the same on both 
Firewalls. 
When we switched from the old Firewall to the new one we got Problems with 
retransmission of Packets. The new iptables Version dropped many DUP ACK 
which are send with SACK TCP Option so that some connections broke after a 
timeout. 

Example of a log Entry of those Packets: 
May 20 13:42:57 DMZFW103neu kernel: RULE 177 -- DENY IN=eth1 OUT=eth0 
SRC=sourceip DST=destip LEN=52 TOS=0x00 PREC=0x00 TTL=120 ID=33462 DF 
PROTO=TCP SPT=1842 DPT=21000 WINDOW=64512 RES=0x00 ACK URGP=0 OPT 
(0101050A45C7BC0B45C7BE01) 

So my Question is: 
Is there any change in Settings, /proc/sys/net Parameters or so between 
the two iptables Versions? Or ist there any other hint someone could give 
where I can check? 

We just did a fallback to the old Firewall and the Problems are gone. I'm 
out of Ideas at the moment why those Packets are rejected on the new 
Version of Iptables but accepted on the older Version. 

Thanks in Advance! 

Regards, 
Martin 
