From: "William Lima" <wrochalima@linuxit.com.br>
Subject: Re: Passive FTP sees remote's _internal_ IP!!??
Date: Sun, 26 Nov 2006 17:18:13 -0300
Message-ID: <774b63b30611261218l243de934tc399f3d197573609@mail.gmail.com>
References: <456957FF.807EA6C@iswest.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <456957FF.807EA6C@iswest.com>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: gypsy <gypsy@iswest.com>
Cc: netfilter@lists.netfilter.org

Dear,

Load modules:

modprobe ip_nat_ftp

Abs,

2006/11/26, gypsy <gypsy@iswest.com>:
> In our network, we have 2 gateways.  The main GW is a Slackware 10.0 box
> and the other is a SonicWALL firewall appliance.  Each connects to a
> different external IP but both are in the same /29 network.
>
> Note: No machine in our LAN has an IP of 192.168.1.11.
>
> When the default GW is set to the linux box (192.168.223.254) and
> passive FTP to a remote server is initiated, the FTP fails after
> connection because the internal IP of the remote machine (192.168.1.11)
> is seen rather than its external IP.  This problem occurs only when
> passive FTP is used.
>
> We do not believe that the OS or FTP daemon of the remote host matters
> because when the default GW is set to the SonicWALL (192.168.223.1), the
> passive FTP succeeds.
>
> Therefore, we conclude that there is something wrong with our linux box.
>
> But WHAT?
>
> Note that the connection has already occurred when port negotation is
> attempted - which is when the FTP fails.
>
> If anyone has advice, we will sincerely appreciate it.
>
> The kernel is 2.4.32.
>
> #!/bin/bash
> iptables -P FORWARD ACCEPT
> iptables -P INPUT DROP
> iptables -P OUTPUT DROP
> iptables -t nat -A POSTROUTING -o eth1 -s 192.168.223.0/24 -j SNAT --to
> 68.171.136.91
> iptables -A FORWARD -j LOG
>
> Nov 26 00:32:10 GWbox kernel: IN=eth0 OUT=eth1 SRC=192.168.223.4
> DST=192.168.1.11 LEN=52 TOS=0x00 PREC=0x00 TTL=63 ID=56473 DF PROTO=TCP
> SPT=1069 DPT=1090 WINDOW=60352 RES=0x00 SYN URGP=0
> Nov 26 00:32:10 GWbox kernel: IN=eth0 OUT=eth1 SRC=192.168.223.4
> DST=192.168.1.11 LEN=52 TOS=0x00 PREC=0x00 TTL=63 ID=56500 DF PROTO=TCP
> SPT=1070 DPT=1091 WINDOW=60352 RES=0x00 SYN URGP=0
> Nov 26 00:32:14 GWbox kernel: IN=eth0 OUT=eth1 SRC=192.168.223.4
> DST=192.168.1.11 LEN=52 TOS=0x00 PREC=0x00 TTL=63 ID=56506 DF PROTO=TCP
> SPT=1070 DPT=1091 WINDOW=60352 RES=0x00 SYN URGP=0
> Nov 26 00:32:20 GWbox kernel: IN=eth0 OUT=eth1 SRC=192.168.223.4
> DST=192.168.1.11 LEN=52 TOS=0x00 PREC=0x00 TTL=63 ID=56507 DF PROTO=TCP
> SPT=1070 DPT=1091 WINDOW=60352 RES=0x00 SYN URGP=0
> --
> gypsy
>
>


-- 
William R. Lima
wrochalima@linuxit.com.br

