From: "Michael K" <micke@klintan.se>
Subject: RE: Mailserver
Date: Sun, 30 Mar 2003 13:38:40 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000b01c2f6b0$e93273f0$0200a8c0@klintan.local>
References: <NEBBICCJKLGJHMMNBPIKMEACEJAA.sbisgaard@xtrasource.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <NEBBICCJKLGJHMMNBPIKMEACEJAA.sbisgaard@xtrasource.com>
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

> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org 
> [mailto:netfilter-admin@lists.netfilter.org] On Behalf Of 
> Steffen Bisgaard
> Sent: Monday, March 31, 2003 10:19 AM
> To: netfilter@lists.netfilter.org
> Subject: Mailserver
> 
> 
> Hallo list,
> 
> hopefully someone can help me here. I keep getting the below error (or
> similar) on my mailserver.
> 
> CHAININ= OUT=eth0 SRC=m.y.i.p DST=66.162.207.18 LEN=52 
> TOS=0x00 PREC=0x00
> TTL=64 ID=32008 DF PROTO=TCP SPT=25 DPT=41018 WINDOW=11584 
> RES=0x00 ACK FIN
> URGP=0
> END OF OUTPUT
> CHAININ= OUT=eth0 SRC=m.y.i.p DST=66.162.207.18 LEN=52 
> TOS=0x00 PREC=0x00
> TTL=64 ID=32008 DF PROTO=TCP SPT=25 DPT=41018 WINDOW=11584 
> RES=0x00 ACK FIN
> URGP=0
> END OF INPUT
> CHAININ=eth0 OUT= MAC=00:06:5b:ed:67:6a:00:90:7f:1f:8d:e9:08:00
> SRC=66.162.207.18 DST=m.y.i.p LEN=52 TOS=0x00 PREC=0x00 
> TTL=44 ID=65006 DF
> PROTO=TCP SPT=41018 DPT=25 WINDOW=6432 RES=0x00 ACK FIN URGP=0
> END OF INPUT
> CHAININ=eth0 OUT= MAC=00:06:5b:ed:67:6a:00:90:7f:1f:8d:e9:08:00
> SRC=66.162.207.18 DST=m.y.i.p LEN=52 TOS=0x00 PREC=0x00 
> TTL=44 ID=65006 DF
> PROTO=TCP SPT=41018 DPT=25 WINDOW=6432 RES=0x00 ACK FIN URGP=0
> END OF OUTPUT
> 
> How would I allow that through? Sorry for a simple question 
> but as you can
> guess I am very new to iptables.
> 
> Kind Regards
> 
> 

Iptables -A INPUT -p TCP -d m.y.i.p --dport 25 -s 0/0 --sport 1024: -j
ACCEPT
Iptables -A OUTPUT -p TCP -s m.y.i.p --sport 25 -d 0/0 --dport 1024: -m
state ESTABLISHED -j ACCEPT

/Klintan



