From: Konstantin Dorichev <kdorichev@epicinvest.ru>
Subject: LOG entry format: MAC field
Date: Wed, 19 Feb 2003 12:36:04 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <auto-000013214373@frontend4.aha.ru>
Reply-To: kdorichev@epicinvest.ru
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
To: netfilter@lists.netfilter.org

Hi, folks:

Could anyone please comment on MAC field in iptables log entry? Why does it 
have 14 bytes instead of 6 as it should be for Ethernet card MAC address? Or 
this field means something else?

Also, since my firewall is being scanned, there are many entries in log file 
with different source IPs, yet the same MACs. Is there a way to trace the 
scanning host back?

Thanks for whatever you may suggest.

Below are a few log entries for your consideration:

Feb 11 16:34:10 gateway kernel: IPT INPUT packet died: IN=eth0 OUT= 
MAC=00:50:04:a2:08:91:00:01:42:1b:57:20:08:00 SRC=80.117.120.207 
DST=212.85.17.62 LEN=52 TOS=0x00 PREC=0x00 TTL=48 ID=21343 DF PROTO=TCP 
SPT=4504 DPT=57 WINDOW=60352 RES=0x00 SYN URGP=0

Feb 11 17:56:27 gateway kernel: IPT INPUT packet died: IN=eth0 OUT= 
MAC=00:50:04:a2:08:91:00:01:42:1b:57:20:08:00 SRC=61.139.69.22 
DST=212.85.17.62 LEN=404 TOS=0x00 PREC=0x00 TTL=106 ID=51580 PROTO=UDP 
SPT=1305 DPT=1434 LEN=384

Feb 11 19:35:40 gateway kernel: IPT INPUT packet died: IN=eth0 OUT= 
MAC=00:50:04:a2:08:91:00:01:42:1b:57:20:08:00 SRC=204.31.160.26 
DST=212.85.17.62 LEN=404 TOS=0x00 PREC=0x00 TTL=107 ID=14329 PROTO=UDP 
SPT=1367 DPT=1434 LEN=384

P.S. Many thanks to Ockar Andreasson for his Iptables Tutorial.
-- 
Best regards,

Konstantin Dorichev
EPIC Advisors (Russia) Ltd.
System Administrator

