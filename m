From: Pierluigi Frullani Sinergy <p.frullani@sinergy.it>
Subject: Re: Trouble getting SYNPROXY to work.
Date: Tue, 12 Nov 2019 21:42:59 +0100
Message-ID: <13941443.1yEmWJ4apE@topolinux>
References: <3018728.1mgFJ8EcOk@topolinux> <2490043.Bzh1xko5Hd@topolinux> <20191112142326.2ad4acf3@playground>
Reply-To: p.frullani@sinergy.it
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.10.3 orca.frumar.it xACKhmCI007803
In-Reply-To: <20191112142326.2ad4acf3@playground>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Neal, 

> > root@firewall:~# ifconfig br0                                                                                                                                                                                     
> > br0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500                                                                                                                                                         
> >         inet 10.0.1.51  netmask 255.255.255.0  broadcast 10.0.2.255                                                                                                                               
> Broadcast address doesn't match address/mask. Fix and verify you have no other config errors.

Easy fix:

root@firewall:~# ifconfig br0
br0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 10.0.1.51  netmask 255.255.255.0  broadcast 10.0.1.255
        inet6 fe80::44b9:4bff:fe81:89e2  prefixlen 64  scopeid 0x20<link>

but still no joy:
root@firewall:~# tcpdump -n -i any port 82                                       <==== Here I'm using "any" to be sure no routing problems.
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on any, link-type LINUX_SLL (Linux cooked), capture size 262144 bytes


21:40:58.520154 IP 10.0.1.18.34488 > 10.0.1.51.82: Flags [S], seq 900706808, win 29200, options [mss 1323,sackOK,TS val 2805112532 ecr 0,nop,wscale 7], length 0
21:40:58.520154 IP 10.0.1.18.34488 > 10.0.1.51.82: Flags [S], seq 900706808, win 29200, options [mss 1323,sackOK,TS val 2805112532 ecr 0,nop,wscale 7], length 0
21:40:59.585539 IP 10.0.1.18.34488 > 10.0.1.51.82: Flags [S], seq 900706808, win 29200, options [mss 1323,sackOK,TS val 2805113594 ecr 0,nop,wscale 7], length 0
21:40:59.585539 IP 10.0.1.18.34488 > 10.0.1.51.82: Flags [S], seq 900706808, win 29200, options [mss 1323,sackOK,TS val 2805113594 ecr 0,nop,wscale 7], length 0
21:41:01.630401 IP 10.0.1.18.34488 > 10.0.1.51.82: Flags [S], seq 900706808, win 29200, options [mss 1323,sackOK,TS val 2805115642 ecr 0,nop,wscale 7], length 0                                                  
21:41:01.630401 IP 10.0.1.18.34488 > 10.0.1.51.82: Flags [S], seq 900706808, win 29200, options [mss 1323,sackOK,TS val 2805115642 ecr 0,nop,wscale 7], length 0                                                  

Still banging my head on the wall :(

Thx 

Pierluigi
