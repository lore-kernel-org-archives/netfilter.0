From: Guido Trentalancia <guido@trentalancia.com>
Subject: Re: Port forwarding with iptables on tunnel interface
Date: Thu, 11 Feb 2010 21:05:34 +0100
Message-ID: <1265918734.2985.88.camel@tesla.lan>
References: <1265912094.2985.44.camel@tesla.lan>
	 <4B745327.9020806@trash.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4B745327.9020806@trash.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Patrick McHardy <kaber@trash.net>
Cc: netfilter@vger.kernel.org

And for the sack of completeness, here is the log produced by iptables
for the PRE and POST ROUTING rules (DNAT and MASQUERADING):

Feb 11 20:50:15 gyokuro kernel: PREROUTING: IN=tunl0 OUT=
MAC=45:00:00:4c:d5:6a:00:00:29:04:0d:78:a9:e4:42:fb:c0:a8:01:44:45:00:00:38:55:74:40:00:24:06:62:30:51:58:30:3c:2c:86:f1:01:d7:dc:00:19:a6:fe:a2:4b:00:00:00:00:90:02:16:d0:89:4e:00:00:02:04:05:b4:04:02:08:0a:04:54:f7:3f:00:00:00:00:00:00:00:00:02:00:00:00:00:00:00:00:00:b0:05:08:00:00:00:00:00:00:00:00:00:e0:82:09:00:00:00:00:00:00:00:00:00:00:00:00 SRC=smtppeeripaddress DST=theipaddressoftheiptablesmachineonthetunnelinterface LEN=56 TOS=0x00 PREC=0x00 TTL=36 ID=21876 DF PROTO=TCP SPT=55260 DPT=25 WINDOW=5840 RES=0x00 SYN URGP=0 
Feb 11 20:50:18 gyokuro kernel: PREROUTING: IN=tunl0 OUT=
MAC=45:00:00:4c:d5:e1:00:00:29:04:0d:01:a9:e4:42:fb:c0:a8:01:44:45:00:00:38:55:75:40:00:24:06:62:2f:51:58:30:3c:2c:86:f1:01:d7:dc:00:19:a6:fe:a2:4b:00:00:00:00:90:02:16:d0:88:22:00:00:02:04:05:b4:04:02:08:0a:04:54:f8:6b:00:00:00:00:00:00:00:00:02:00:00:00:00:00:00:00:00:b0:05:08:00:00:00:00:00:00:00:00:00:e0:82:09:00:00:00:00:00:00:00:00:00:00:00:00 SRC=smtppeeripaddress DST=theipaddressoftheiptablesmachineonthetunnelinterface LEN=56 TOS=0x00 PREC=0x00 TTL=36 ID=21877 DF PROTO=TCP SPT=55260 DPT=25 WINDOW=5840 RES=0x00 SYN URGP=0 
Feb 11 20:50:24 gyokuro kernel: PREROUTING: IN=tunl0 OUT=
MAC=45:00:00:4c:d6:de:00:00:29:04:0c:04:a9:e4:42:fb:c0:a8:01:44:45:00:00:38:55:76:40:00:24:06:62:2e:51:58:30:3c:2c:86:f1:01:d7:dc:00:19:a6:fe:a2:4b:00:00:00:00:90:02:16:d0:85:ca:00:00:02:04:05:b4:04:02:08:0a:04:54:fa:c3:00:00:00:00:00:00:00:00:02:00:00:00:00:00:00:00:00:b0:05:08:00:00:00:00:00:00:00:00:00:e0:82:09:00:00:00:00:00:00:00:00:00:00:00:00 SRC=smtppeeripaddress DST=theipaddressoftheiptablesmachineonthetunnelinterface LEN=56 TOS=0x00 PREC=0x00 TTL=36 ID=21878 DF PROTO=TCP SPT=55260 DPT=25 WINDOW=5840 RES=0x00 SYN URGP=0 

What I see from here is that the POSTROUTING did not produce any log.
But it doesn't give me any hint...

Actually I don't see any connection request on the destination smtp
server, so it has nothing to reply and that's probably why there is no
log output for the POSTROUTING table.

But if it does not get any connection is because the address
theipaddressoftheiptablesmachineonthetunnelinterface is not DNAT'ed to
192.168.3.69 as requested by the rule itself. I can't see the DNAT
translation being logged anywhere, not even in the PREROUTING log output
it does mention about it explicitly...

On Thu, 2010-02-11 at 19:57 +0100, Patrick McHardy wrote:
> Guido Trentalancia wrote:
> > Hello !
> > 
> > I have the following problem. I need to forward/redirect all connections
> > to port 25 (smtp) from one host (192.168.3.64) to another host on the
> > same network (192.168.3.69).
> > 
> > I am using the following iptables rules:
> > 
> > -A PREROUTING -p tcp --dport 25 -j DNAT --to-destination 192.168.3.69
> > -A POSTROUTING -p tcp -d 192.168.1.65 --dport 25 -j MASQUERADE
> > 
> > and I have also tried the following alternative rules:
> > 
> > -A PREROUTING -p tcp --dport 25 -j DNAT --to-destination 192.168.3.69
> > -A POSTROUTING -p tcp -d 192.168.1.65 --dport 25 -j SNAT --to-source
> > 192.168.3.64
> > 
> > The connections come from an IP-IP tunnel and they are allowed by the
> > following iptables rules:
> > 
> > -A INPUT -p 4 -i eth0 -j ACCEPT
> > -A OUTPUT -p 4 -o eth0 -j ACCEPT
> > 
> > It used to work until a few days ago. But now it only works from within
> > the LAN and not from the tunnel. I have not changed any iptables rules
> > and I have only upgraded the system to the latest kernel (2.6.32.8).
> > 
> > The version of iptables that I am using is 1.4.3.1.
> > 
> > Any idea on how to get it back working ?
> 
> Try logging the packets coming out of the tunnel to see whats wrong.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 


