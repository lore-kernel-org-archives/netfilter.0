From: "notinh notien" <notinhnotien7@hotmail.com>
Subject: Re: Port forwarding in special case (New problems )
Date: Thu, 24 Aug 2006 06:26:31 +0700
Message-ID: <BAY117-F15C3FA2C822E31959712EAF5470@phx.gbl>
References: <20060805062110.8928.qmail@web56215.mail.re3.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060805062110.8928.qmail@web56215.mail.re3.yahoo.com>
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: omasnjak@yahoo.com, netfilter@lists.netfilter.org

Hi, all.  Thanks for all the info.  However after I set it up, I actually 
saw commnunication that my host  (LEO) is supposed to forward to back end 
host (GEMINI), but it is kinda weird when the src and dst ip address of 
packets leaving LEO and arrive at GEMINI is the same IP address.  I must 
have done something wrong or something in my rules are missing.  Could the 
experts here take a look and give me some pointers?

Thanks  in advance.
NN

IPTABLES LOG on LEO
Aug 23 15:41:46 leo kernel: PREROUTING IN=eth0 OUT= 
MAC=00:e0:81:41:72:dc:00:12:1e:b6:14:97:08:00 SRC=xxx.xxx.xxx.212 
DST=192.168.18.80 LEN=37 TOS=0x00 PREC=0x00 TTL=126 ID=65354 PROTO=UDP 
SPT=1420 DPT=44335 LEN=17
Aug 23 15:41:46 leo kernel: FORWARD-1 IN=eth0 OUT=eth0 SRC=xxx.xxx.xxx.212 
DST=192.168.18.25 LEN=37 TOS=0x00 PREC=0x00 TTL=125 ID=65354 PROTO=UDP 
SPT=1420 DPT=44335 LEN=17
Aug 23 15:41:46 leo kernel: POST ROUTING IN= OUT=eth0 SRC=xxx.xxx.xxx.212 
DST=192.168.18.25 LEN=37 TOS=0x00 PREC=0x00 TTL=125 ID=65354 PROTO=UDP 
SPT=1420 DPT=44335 LEN=17

LEO HOST
tcpdump -vv -nn dst port udp 44335
15:41:46.146609 IP (tos 0x0, ttl 126, id 65354, offset 0, flags [none], 
proto 17, length: 37) xxx.xxx.xxx.212.1420 > 192.168.18.80.44335: [udp sum 
ok] UDP, length 9
15:41:46.147844 IP (tos 0x0, ttl 125, id 65354, offset 0, flags [none], 
proto 17, length: 37) 192.168.18.25.1420 > 192.168.18.25.44335: [udp sum ok] 
UDP, length 9

GEMINI HOST
tcpdump -vv -nn udp and not port 53
15:49:43.052465 IP (tos 0x0, ttl 125, id 65354, offset 0, flags [none], 
length: 37) 192.168.18.25.1420 > 192.168.18.25.44335: [udp sum ok] UDP, 
length: 9

LEO Host
iptables -L
*nat :PREROUTING ACCEPT [127173:7033011]
:POSTROUTING ACCEPT [31583:2332178]
:OUTPUT ACCEPT [32021:2375633]
-A POSTROUTING  -d 192.168.18.25 -p udp --dport 44335 -j LOG --log-prefix 
"POST ROUTING "
-A POSTROUTING  -d 192.168.18.25 -p udp --dport 44335 -j SNAT --to-source 
192.168.18.25

-A PREROUTING -s ! 192.168.18.25 -d 192.168.18.80 -p udp --dport 44335 -j 
LOG --log-prefix "PREROUTING "
-A PREROUTING -s ! 192.168.18.25 -d 192.168.18.80 -p udp --dport 44335 -j 
DNAT --to-destination 192.168.18.25:44335
COMMIT

*mangle
:PREROUTING ACCEPT [444:43563]
:INPUT ACCEPT [444:43563]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [402:144198] :POSTROUTING ACCEPT [402:144198]
-A PREROUTING -p tcp -m tcp --tcp-flags FIN,SYN,RST,PSH,ACK,URG FIN,PSH,URG 
-j DROP
-A PREROUTING -p tcp -m tcp --tcp-flags FIN,SYN,RST,PSH,ACK,URG NONE -j DROP
-A PREROUTING -p tcp -m tcp --tcp-flags SYN,RST SYN,RST -j DROP -A 
PREROUTING -p tcp -m tcp --tcp-flags FIN,SYN FIN,SYN -j DROP
-A PREROUTING -p tcp -m tcp --tcp-flags FIN,SYN,RST,PSH,ACK,URG FIN,PSH,URG 
-j DROP
-A PREROUTING -p tcp -m tcp --tcp-flags FIN,SYN,RST,PSH,ACK,URG NONE -j DROP
-A PREROUTING -p tcp -m tcp --tcp-flags SYN,RST SYN,RST -j DROP -A 
PREROUTING -p tcp -m tcp --tcp-flags FIN,SYN FIN,SYN -j DROP
-A PREROUTING -p tcp -m tcp --tcp-flags FIN,SYN,RST,PSH,ACK,URG FIN,PSH,URG 
-j DROP
-A PREROUTING -p tcp -m tcp --tcp-flags FIN,SYN,RST,PSH,ACK,URG NONE -j DROP
-A PREROUTING -p tcp -m tcp --tcp-flags SYN,RST SYN,RST -j DROP
-A PREROUTING -p tcp -m tcp --tcp-flags FIN,SYN FIN,SYN -j DROP
-A PREROUTING -p tcp -m tcp --tcp-flags FIN,SYN,RST,PSH,ACK,URG FIN,PSH,URG 
-j DROP
-A PREROUTING -p tcp -m tcp --tcp-flags FIN,SYN,RST,PSH,ACK,URG NONE -j DROP
-A PREROUTING -p tcp -m tcp --tcp-flags SYN,RST SYN,RST -j DROP
-A PREROUTING -p tcp -m tcp --tcp-flags FIN,SYN FIN,SYN -j DROP
COMMIT

*filter
:INPUT DROP [1:242]
:FORWARD ACCEPT [0:0]
:OUTPUT DROP [0:0]
:LOG_DROP - [0:0]
:LOG_ACCEPT - [0:0]
:icmp_packets - [0:0]

-A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
-A INPUT -p tcp -m tcp --dport 22  -s 192.168.68.0/24 -j LOG_ACCEPT
-A INPUT -p tcp -m tcp --dport 53 -j ACCEPT
-A INPUT -p udp -m udp --dport 53 -j ACCEPT
-A INPUT -p tcp -m tcp --dport 80 -j ACCEPT
-A INPUT -p tcp -m tcp --dport 443 -j ACCEPT
-A INPUT -p udp -m udp --dport 44335 -j ACCEPT
-A INPUT -s 127.0.0.1 -j ACCEPT
-A INPUT -p icmp -j icmp_packets
-A INPUT -j LOG_DROP

-A FORWARD -p udp -d 192.168.18.25 --dport 44335 --sport 1024:65535 -m state 
--state NEW -j LOG --log-prefix "FORWARD-1 "
-A FORWARD -p udp -d 192.168.18.25 --dport 44335 --sport 1024:65535 -m state 
--state NEW -j ACCEPT

-A FORWARD -m state --state NEW,ESTABLISHED,RELATED -j LOG --log-prefix 
"FORWARD-2 "
-A FORWARD -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT
-A FORWARD -m state --state ESTABLISHED,RELATED -j LOG --log-prefix 
"FORWARD-3"
-A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
-A OUTPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
-A OUTPUT -p tcp -m tcp --dport 22 -d 192.168.18.0/24 -j ACCEPT
-A OUTPUT -p tcp -m tcp --dport 25 -d 192.168.18.25 -j ACCEPT
-A OUTPUT -p udp -m udp --dport 53 -j ACCEPT
-A OUTPUT -p tcp -m tcp --dport 80 -j ACCEPT
-A OUTPUT -p tcp -m tcp --dport 443 -j ACCEPT
-A OUTPUT -d 127.0.0.1 -j ACCEPT
-A OUTPUT -p icmp -j icmp_packets
-A OUTPUT -j LOG_DROP

-A LOG_DROP -j LOG --log-prefix "[IPTABLES DROP] : " --log-tcp-options 
--log-ip-options
-A LOG_DROP -j DROP
-A LOG_ACCEPT -j LOG --log-prefix "[IPTABLES ACCEPT] : " --log-tcp-options 
--log-ip-options
-A LOG_ACCEPT -j ACCEPT

-A icmp_packets -p icmp -m icmp --icmp-type 0 -j ACCEPT
-A icmp_packets -p icmp -m icmp --icmp-type 8 -j ACCEPT
-A icmp_packets -p icmp -m icmp --icmp-type 8 -j DROP
-A icmp_packets -p icmp -m icmp --icmp-type 3 -j ACCEPT
-A icmp_packets -p icmp -m icmp --icmp-type 11 -j ACCEPT
COMMIT






>From: Elvir Kuric <omasnjak@yahoo.com>
>To: notinh notien <notinhnotien7@hotmail.com>, 
>netfilter@lists.netfilter.org
>Subject: Re: Port forwarding in special case
>Date: Fri, 4 Aug 2006 23:21:10 -0700 (PDT)
>
>Hi,
>I think the next link will help you
>
>http://forums1.itrc.hp.com/service/forums/bizsupport/questionanswer.do?threadId=1032378&admit=-682735245+1154757766144+28353475
>
>just read threads carefuly. Instead port 80 you can
>put port 443 as well. Or both. In my case this work.
>And of course read
>http://iptables-tutorial.frozentux.net/iptables-tutorial.html
>
>best wishes
>
>--- notinh notien <notinhnotien7@hotmail.com> wrote:
>
> > Hi. I am a newbie here,  I need some helps for my
> > situation.
> >
> > My set up is that I have Apache as the web server
> > and set it up so that it
> > would do proxy reverse to the backend web server.
> > It is all good and my
> > user can use the front web server to view the
> > content provided by the
> > backend web server.
> >
> > So I only open my hardware firewall and forward all
> > access to the front end
> > server.  My front end server is a Linux box and have
> > iptables to protect it.
> >   Now i need to forward the ports that are not part
> > of the Apache reverse
> > proxy (80, 443) to the backend server.
> >
> > So you see, my front end server is not a gateway and
> > does not provide NAT to
> > any other server like a firewall gateway settings.
> > I already have a
> > hardware firewall to protect these two servers.
> > These two servers are in
> > the same subnet 192.168.0.0/24.  I only need it to
> > forward ports to the
> > backend server and return related data for
> > connections from the back end on
> > those ports to outside people.  I want people to
> > have the impression that
> > they are connecting to the same server because the
> > software I used do not
> > allow setting more than one IP address for all the
> > services from the end
> > user GUI.
> >
> > Could someone here show me how to do this?  Should
> > NAT involve in this?
> >
> > Thanks.
> >
> >
>_________________________________________________________________
> > Express yourself instantly with MSN Messenger!
> > Download today it's FREE!
> >
>http://messenger.msn.click-url.com/go/onm00200471ave/direct/01/
> >
> >
> >
>
>
>__________________________________________________
>Do You Yahoo!?
>Tired of spam?  Yahoo! Mail has the best spam
>protection around
>http://mail.yahoo.com
>
>__________________________________________________
>Do You Yahoo!?
>Tired of spam?  Yahoo! Mail has the best spam protection around
>http://mail.yahoo.com

_________________________________________________________________
Express yourself instantly with MSN Messenger! Download today it's FREE! 
http://messenger.msn.click-url.com/go/onm00200471ave/direct/01/


