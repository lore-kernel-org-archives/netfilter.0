From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: Help with ftp helper please
Date: Sun, 25 Apr 2010 08:49:23 +0200
Message-ID: <4BD3E5F3.4070907@chello.at>
References: <r2ob376a78e1004240948ucaa6e2d5o5f65d4216f7ac936@mail.gmail.com>
Reply-To: mart.frauenlob@chello.at
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <r2ob376a78e1004240948ucaa6e2d5o5f65d4216f7ac936@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 
Cc: Jeff Jensen <jjensen@unyalli.com>, netfilter@vger.kernel.org

On 24.04.2010 18:48, Jeff Jensen wrote:
> Hello netfilter people,
> 
>    I have an email conversation from Jan 9, 2010 between
> mart.frauenlob@chello.at and margoandtodd@gmail.com with the subject
> "passive mode ftp high ports driving me nuts". I have studied this
> intensely and found out about this "helper" thing.
> 
> On a test ubuntu 9.04 box I have these rules and nothing else plus I
> have added nf_conntrack_ipv4 and nf_conntrack_ftp to /etc/modules.
> 
> # Local host
> iptables -A INPUT  -i lo -j ACCEPT
> iptables -A OUTPUT -o lo -j ACCEPT
> # DNS
> iptables -A OUTPUT -o eth0 -p udp -m state --state NEW,ESTABLISHED
> --dport 53 -j ACCEPT
> iptables -A INPUT  -i eth0 -p udp -m state --state ESTABLISHED --sport
> 53 -j ACCEPT
> # FTP Helper Chain
> iptables -N FTPChn
> iptables -A FTPChn -j LOG --log-prefix "FTP "
> iptables -A FTPChn -j ACCEPT
> # FTP
> iptables -A OUTPUT -o eth0 -m helper --helper ftp -j FTPChn
> iptables -A INPUT  -i eth0 -m helper --helper ftp -j FTPChn
> iptables -A OUTPUT -o eth0 -p tcp -m state --state NEW --dport 21 -j FTPChn
> # Log All Else
> iptables -A INPUT   -j LOG --log-prefix "Filter Input   "
> iptables -A OUTPUT  -j LOG --log-prefix "Filter Output  "
> iptables -A FORWARD -j LOG --log-prefix "Filter Forward "
> # And Reject
> iptables -A INPUT   -j REJECT --reject-with icmp-host-prohibited
> iptables -A OUTPUT  -j REJECT --reject-with icmp-host-prohibited
> iptables -A FORWARD -j REJECT --reject-with icmp-host-prohibited
> 
> when I ftp to mirror.anl.gov this shows up in the log (trimmed for easy reading)
> 
> FTP            IN= OUT=eth0 SRC=192.168.128.20 DST=146.137.96.15
> PROTO=TCP SPT=36826 DPT=21 WINDOW=5840 SYN URGP=0
> Filter Input   IN=eth0 OUT= SRC=146.137.96.15 DST=192.168.128.20
> PROTO=TCP SPT=21 DPT=36826 WINDOW=5792 ACK SYN URGP=0
> Filter Output  IN= OUT=eth0 SRC=192.168.128.20 DST=146.137.96.15
> PROTO=TCP SPT=36826 DPT=21 WINDOW=5840 SYN URGP=0
> 
> Any idea what I'm missing?
> 
> Thank you
> 
> Jeff
	
you don't allow sport 21 back incoming traffic.
btw: nf_nat_ftp is also loaded?
