From: Czezz <czezz@o2.pl>
Subject: UnhandledForward
Date: Thu, 16 Oct 2003 20:41:11 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4010444067.20031016204111@o2.pl>
Reply-To: Czezz <czezz@o2.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

Hello everyone,

here is my question:
I added this  line to my rc.firewall

   iptables -A FORWARD -i eth1 -j LOG --log-prefix "IPT:UnhandledForward:"

to check why I cant connect to some server...and in syslog it received
me this:
   Oct 16 19:05:59 slack kernel: IPT:UnhandledForward:IN=eth1 OUT=ppp0 SRC=192.168.1.251 DST=62.111.129.3 LEN=36 TOS=0x00 PREC=0x00 TTL=127 ID=17885 PROTO=UDP SPT=23083 DPT=13073 LEN=16
   Oct 16 19:07:44 slack kernel: IPT:UnhandledForward:IN=eth1 OUT=ppp0 SRC=192.168.1.251 DST=62.111.129.3 LEN=36 TOS=0x00 PREC=0x00 TTL=127 ID=18107 PROTO=UDP SPT=23083 DPT=13073 LEN=16
   Oct 16 19:10:27 slack kernel: IPT:UnhandledForward:IN=eth1 OUT=ppp0 SRC=192.168.1.251 DST=62.111.129.3 LEN=36 TOS=0x00 PREC=0x00 TTL=127 ID=18888 PROTO=UDP SPT=23083 DPT=13073 LEN=16
   Oct 16 19:11:08 slack kernel: IPT:UnhandledForward:IN=eth1 OUT=ppp0 SRC=192.168.1.251 DST=62.111.129.3 LEN=36 TOS=0x00 PREC=0x00 TTL=127 ID=19078 PROTO=UDP SPT=23083 DPT=13073 LEN=16

Does anyone can help my to analize this lines above and maybe give my
some hint?
   
 --
Best regards,


