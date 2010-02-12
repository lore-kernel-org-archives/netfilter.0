From: Guido Trentalancia <guido@trentalancia.com>
Subject: Re: Port forwarding with iptables on tunnel interface
Date: Fri, 12 Feb 2010 14:28:12 +0100
Message-ID: <1265981292.2980.67.camel@tesla.lan>
References: <1265912094.2985.44.camel@tesla.lan>
	 <4B745327.9020806@trash.net> <1265916014.2985.72.camel@tesla.lan>
	 <4B74E736.2020307@trash.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4B74E736.2020307@trash.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Patrick McHardy <kaber@trash.net>
Cc: netfilter@vger.kernel.org

Hello again Patrick,

and thanks for your kind reply.

The decapsulated packets are shown in the PREROUTING log output that I
attached in another message and that I am quoting here again:

Feb 11 20:50:15 gyokuro kernel: PREROUTING: IN=tunl0 OUT=
MAC=45:00:00:4c:d5:6a:00:00:29:04:0d:78:a9:e4:42:fb:c0:a8:01:44:45:00:00:38:55:74:40:00:24:06:62:30:51:58:30:3c:2c:86:f1:01:d7:dc:00:19:a6:fe:a2:4b:00:00:00:00:90:02:16:d0:89:4e:00:00:02:04:05:b4:04:02:08:0a:04:54:f7:3f:00:00:00:00:00:00:00:00:02:00:00:00:00:00:00:00:00:b0:05:08:00:00:00:00:00:00:00:00:00:e0:82:09:00:00:00:00:00:00:00:00:00:00:00:00 SRC=smtppeeripaddress DST=theipaddressoftheiptablesmachineonthetunnelinterface LEN=56 TOS=0x00 PREC=0x00 TTL=36 ID=21876 DF PROTO=TCP SPT=55260 DPT=25 WINDOW=5840 RES=0x00 SYN URGP=0 

So, because we have smtppeeripaddress (the host that originally
requested a connection on port 25 smtp), then they are decapsulated.

Consider the log output you are talking about is produced with:

-A INPUT -p 4 -j LOG --log-prefix "ipencap (in): "

therefore I was expecting it to only print packets with the IPIP
encapsulation protocol and not the decapsulated IP packets.

However, after further investigation I discovered that the problem lies
in the tunnel itself and perhaps in the way the iptables machine deals
with the packets from the tunnel interface. This is because even
connection directed to the iptables machine and not being redirected
anywhere are not working.

The point is that everything from the tunnel is allowed:

-A INPUT -p 4 -i eth0 -j ACCEPT
-A OUTPUT -p 4 -o eth0 -j ACCEPT

Despite that, I can't see decapsulated packets directed to port 25 (even
not considering host redirection with DNAT) using :

-A INPUT -m state --state NEW -m tcp -p tcp --dport 25 -j LOG
--log-prefix "SMTP: "

or using:

-A INPUT -m state --state NEW -m tcp -p tcp --dport 25 -j LOG
--log-prefix "SMTP: "

The only way I can see decapsulated packets, as already mentioned, is
through the PREROUTING log output. And in general I can see IPIP packets
using tcpdump or with the above mentioned "-p 4 -j LOG" rule.

How can I debug this decapsulation issue further. There might be
something wrong with the tunnel itself, perhaps not related to
iptables ?

I configure the tunnel using:

/sbin/ip tunnel add mode ipip local
theipaddressoftheiptablesmachineonthetunnelinterface dev tunl0
/sbin/ifconfig tunl0
theipaddressoftheiptablesmachineonthetunnelinterface mtu 512 up

One thing that I have observed is that when rp_filter is set to 0 for
the tunnel, then something appears in the log:

Feb 12 14:21:25 gyokuro kernel: SMTP (in): IN=tunl0 OUT=
MAC=45:00:00:4c:d2:2a:00:00:2a:04:0f:b8:a9:e4:42:fb:c0:a8:01:44:45:00:00:38:5f:e2:40:00:24:06:57:c2:51:58:30:3c:2c:86:f1:01:a2:12:00:19:eb:82:6c:3f:00:00:00:00:90:02:16:d0:73:a2:00:00:02:04:05:b4:04:02:08:0a:04:b5:33:dd:00:00:00:00:00:00:00:00:02:00:00:00:00:00:00:00:02:f4:0e:24:00:00:00:00:00:00:00:00:00:f0:7b:08:00:00:00:00:00:00:00:00:00:00:00:00 SRC=smtppeeripaddress DST=theipaddressoftheiptablesmachineonthetunnelinterface LEN=56 TOS=0x00 PREC=0x00 TTL=36 ID=24546 DF PROTO=TCP SPT=41490 DPT=25 WINDOW=5840 RES=0x00 SYN URGP=0 

Still smtppeeripaddress doesn't get a connection and anyway I am not
sure at all that rp_filter should be set to 0...

Any idea ? Thanks for your help !

Regards,

Guido

On Fri, 2010-02-12 at 06:29 +0100, Patrick McHardy wrote:
> Guido Trentalancia wrote:
> > Hello Patrick,
> > 
> > thanks very much for your message !
> > 
> > By the way, some IP addresses in the original message are wrong (read
> > 192.168.3.69 instead of 192.168.1.65), but that's just a typo.
> > 
> > Here is the log produced by iptables on 192.168.3.64:
> > 
> > Feb 11 20:09:58 gyokuro kernel: ipencap (in): IN=eth0 OUT=
> > MAC=macaddressofreceiverandsender SRC=senderipaddress DST=192.168.3.64
> > LEN=76 TOS=0x00 PREC=0x00 TTL=41 ID=26562 PROTO=4 
> > Feb 11 20:10:01 gyokuro kernel: ipencap (in): IN=eth0 OUT=
> > MAC=macaddressofreceiverandsender SRC=senderipaddress DST=192.168.3.64
> > LEN=76 TOS=0x00 PREC=0x00 TTL=41 ID=28099 PROTO=4 
> > Feb 11 20:10:07 gyokuro kernel: ipencap (in): IN=eth0 OUT=
> > MAC=macaddressofreceiverandsender SRC=senderipaddress DST=192.168.3.64
> > LEN=76 TOS=0x00 PREC=0x00 TTL=41 ID=28322 PROTO=4 
> 
> I don't see any decapsulated packets.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 


