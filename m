From: Kit Massengill <KitM@FirstEquipment.com>
Subject: How do I get rid of these broadcasts in my logs
Date: Mon, 26 Jan 2004 14:25:40 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E8214FAA4482174EB648559A0AB63F75340F95@astro>
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
To: netfilter@lists.netfilter.org


Hi,

I recently got a beautiful script from jlevie at experts-exchange that fixed
my Linux router, but I need to now how to turn off the following broadcast
loggings (eth1 is internal, obviously):


<snip>
Jan 23 09:35:21 ns1 kernel: Firewalled:IN=eth1 OUT=
MAC=ff:ff:ff:ff:ff:ff:00:0d:88:52:15:15:08:00 SRC=192.168.1.111
DST=192.168.1.255 LEN=249 TOS=0x00 PREC=0x00 TTL=128 ID=1732 PROTO=UDP
SPT=138 DPT=138 LEN=229 
Jan 23 09:35:30 ns1 kernel: Firewalled:IN=eth1 OUT=
MAC=ff:ff:ff:ff:ff:ff:00:50:8b:44:b0:3e:08:00 SRC=192.168.1.50
DST=192.168.1.255 LEN=78 TOS=0x00 PREC=0x00 TTL=128 ID=50311 PROTO=UDP
SPT=137 DPT=137 LEN=58 
Jan 23 09:35:35 ns1 kernel: Firewalled:IN=eth1 OUT=
MAC=ff:ff:ff:ff:ff:ff:00:a0:c9:8d:8d:39:08:00 SRC=192.168.1.33
DST=255.255.255.255 LEN=40 TOS=0x00 PREC=0x00 TTL=128 ID=50577 PROTO=UDP
SPT=2301 DPT=2301 LEN=20 
Jan 23 09:35:36 ns1 kernel: Firewalled:IN=eth1 OUT=
MAC=ff:ff:ff:ff:ff:ff:00:09:6b:1f:78:49:08:00 SRC=192.168.1.104
DST=192.168.1.255 LEN=249 TOS=0x00 PREC=0x00 TTL=128 ID=38960 PROTO=UDP
SPT=138 DPT=138 LEN=229 
Jan 23 09:35:53 ns1 kernel: Firewalled:IN=eth1 OUT=
MAC=ff:ff:ff:ff:ff:ff:00:a0:c9:74:65:60:08:00 SRC=192.168.1.35
DST=192.168.1.255 LEN=78 TOS=0x00 PREC=0x00 TTL=128 ID=35506 PROTO=UDP
SPT=137 DPT=137 LEN=58 
Jan 23 09:35:53 ns1 kernel: Firewalled:IN=eth1 OUT=
MAC=ff:ff:ff:ff:ff:ff:00:a0:c9:74:65:60:08:00 SRC=192.168.1.35
DST=192.168.1.255 LEN=78 TOS=0x00 PREC=0x00 TTL=128 ID=37810 PROTO=UDP
SPT=137 DPT=137 LEN=58 
<snip>

Thanks,
KitM



