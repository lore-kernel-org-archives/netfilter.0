From: "He Jiafu-MPNB73" <JHe@Motorola.com>
Subject: RE: Default server DNAT port remapping problem
Date: Wed, 10 Feb 2010 17:37:12 -0500
Message-ID: <83EB8CF7119A7C47A6425E352065A72B071F86E4@ct11exm64.ds.mot.com>
References: <83EB8CF7119A7C47A6425E352065A72B071F83D6@ct11exm64.ds.mot.com> <4B71CDE9.6020004@chello.at> <83EB8CF7119A7C47A6425E352065A72B071F8474@ct11exm64.ds.mot.com> <4B72F565.202@chello.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-class: urn:content-classes:message
In-Reply-To: <4B72F565.202@chello.at>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org
Cc: Mart Frauenlob <mart.frauenlob@chello.at>

 

> On 10.02.2010, Mart wrote: 
> 
> > 
> > kernel version: 2.6.25.20
> > iptables version: v1.4.0
> > 
> > I used "nmap -r -sU -p80-90 1.2.3.4" to scan the ports, at the 2nd 
> > round, the logs showed the port shifting out-of-range. See the 
> > following logs for an example. In the logs, 192.168.1.254 
> is the wan 
> > ip and while 192.168.1.220 is the lan, and the following 
> iptables rules are used:
> >     # iptables -A PREROUTING -t nat -p udp -d 192.168.1.254 --dport
> > 12340:12345 -jNFLOG
> >     # iptables -A PREROUTING -t nat -p udp -d 192.168.1.254 --dport
> > 12340:12345 -j DNAT --to 192.168.1.220:12350-12355
> >     # iptables -A FORWARD -p udp -d 192.168.1.220 --dport 
> 12340:13340 
> > -jNFLOG
> >     # iptables -A FORWARD -p udp -d 192.168.1.220 --dport 
> 12340:13340 
> > -j ACCEPT
> > 
> 
> >>>> nmap: 2nd round
> > 2010-02-09T21:53:59Z L4  hook=PREROUTING mark=0 IN=eth0 OUT=
> > MAC=00:00:00:00:00:
> > 00:00:0c:29:b2:87:6c:08:00 SRC=192.168.1.220 
> DST=192.168.1.254 LEN=28 
> > TOS=0x00 P REC=0x00 TTL=45 ID=15316 PROTO=UDP SPT=51921 DPT=12341 
> > LEN=8 2010-02-09T21:53:59Z L4  hook=FORWARD mark=0 IN=eth0 OUT=eth0 
> > MAC=00:00:00:00:00 :00:00:0c:29:b2:87:6c:08:00 SRC=192.168.1.220 
> > DST=192.168.1.220 LEN=28 TOS=0x00
> > PREC=0x00 TTL=44 ID=15316 PROTO=UDP SPT=51921 DPT=12356 LEN=8   <<<
> > out-of-range
> 
> well, not as it should be...
> 
> > I did a quick look at net/ipv4/netfilter/nf_nat_proto_udp.c, and 
> > changed the line 44 in function "udp_unique_tuple()":
> >     - static u_int16_t port;
> >     + u_int16_t port;
> > and the out-of-range problem goes away. Not sure what else 
> this change 
> > might break. Similar changes must also be done for tcp.
> > 
> 
> did you try a newer kernel 2.6.32.x?

No, not yet. But I had a quick look at the 2.6.31.6 code and saw the
"static" gone and the codebase has been changed significantly.

Thanks for your help so far.

Best regards,

Jiafu
