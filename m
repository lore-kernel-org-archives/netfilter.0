From: "J Webster" <webster_jack@hotmail.com>
Subject: Re: openvpn over udp failing
Date: Sat, 7 Aug 2010 10:57:51 -0400
Message-ID: <BAY145-ds18BAB524B0EF1EE2DAF424F3920@phx.gbl>
References: <BAY145-ds3FB0B1B5B904843D4A32BF3910@phx.gbl> <AANLkTinxMMe_dAENYJr+hQS0R7TWUbcc1OyuOOzNrcHC@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTinxMMe_dAENYJr+hQS0R7TWUbcc1OyuOOzNrcHC@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: Billy Crook <billycrook@gmail.com>, netfilter@vger.kernel.org

This is the tcpdump from the server (I can't get tcpdump on the client as 
the client is CP and windump won't install):
Furthermore, when the client connects by tcp it can connect to the server so 
if it was a routing issue, wouldn't the tcp connection fail as well?
I have included my iptables rules below.
Perhaps I should change the routing for port 1194 to snat (it only has that 
on port 443 at the moment)?

15:48:10.092116 IP modemcable170.xxx-xx-xx.mc.videotron.ca.12582 > 
serverxx-xxx-xxx-199.live-servers.net.openvpn: UDP, length 14
15:48:10.094011 IP serverxx-xxx-xxx-198.live-servers.net.openvpn > 
modemcable170.xxx-xx-xx.mc.videotron.ca.12582: UDP, length 26
15:48:12.156124 IP serverxx-xxx-xxx-198.live-servers.net.openvpn > 
modemcable170.xxx-xx-xx.mc.videotron.ca.12582: UDP, length 14
15:48:12.510113 IP modemcable170.xxx-xx-xx.mc.videotron.ca.12582 > 
serverxx-xxx-xxx-199.live-servers.net.openvpn: UDP, length 14
15:48:12.510747 IP serverxx-xxx-xxx-198.live-servers.net.openvpn > 
modemcable170.xxx-xx-xx.mc.videotron.ca.12582: UDP, length 22
15:48:14.573039 IP serverxx-xxx-xxx-198.live-servers.net.openvpn > 
modemcable170.xxx-xx-xx.mc.videotron.ca.12582: UDP, length 14
15:48:14.932232 IP modemcable170.xxx-xx-xx.mc.videotron.ca.12582 > 
serverxx-xxx-xxx-199.live-servers.net.openvpn: UDP, length 14
15:48:14.932819 IP serverxx-xxx-xxx-198.live-servers.net.openvpn > 
modemcable170.xxx-xx-xx.mc.videotron.ca.12582: UDP, length 22
15:48:16.994904 IP serverxx-xxx-xxx-198.live-servers.net.openvpn > 
modemcable170.xxx-xx-xx.mc.videotron.ca.12582: UDP, length 14
15:48:17.346319 IP modemcable170.xxx-xx-xx.mc.videotron.ca.12582 > 
serverxx-xxx-xxx-199.live-servers.net.openvpn: UDP, length 14
15:48:17.346948 IP serverxx-xxx-xxx-198.live-servers.net.openvpn > 
modemcable170.xxx-xx-xx.mc.videotron.ca.12582: UDP, length 22
15:48:18.377854 IP serverxx-xxx-xxx-198.live-servers.net.openvpn > 
modemcable170.xxx-xx-xx.mc.videotron.ca.12582: UDP, length 14
15:48:18.556436 IP modemcable170.xxx-xx-xx.mc.videotron.ca.12582 > 
serverxx-xxx-xxx-199.live-servers.net.openvpn: UDP, length 14
15:48:18.557001 IP serverxx-xxx-xxx-198.live-servers.net.openvpn > 
modemcable170.xxx-xx-xx.mc.videotron.ca.12582: UDP, length 22
15:48:20.618795 IP serverxx-xxx-xxx-198.live-servers.net.openvpn > 
modemcable170.xxx-xx-xx.mc.videotron.ca.12582: UDP, length 14
15:48:21.018278 IP modemcable170.xxx-xx-xx.mc.videotron.ca.12582 > 
serverxx-xxx-xxx-199.live-servers.net.openvpn: UDP, length 14
15:48:21.018915 IP serverxx-xxx-xxx-198.live-servers.net.openvpn > 
modemcable170.xxx-xx-xx.mc.videotron.ca.12582: UDP, length 22
15:48:22.035699 IP serverxx-xxx-xxx-198.live-servers.net.openvpn > 
modemcable170.xxx-xx-xx.mc.videotron.ca.12582: UDP, length 14
15:48:23.525934 IP modemcable170.xxx-xx-xx.mc.videotron.ca.12582 > 
serverxx-xxx-xxx-199.live-servers.net.openvpn: UDP, length 14
15:48:23.526566 IP serverxx-xxx-xxx-198.live-servers.net.openvpn > 
modemcable170.xxx-xx-xx.mc.videotron.ca.12582: UDP, length 22
15:48:24.543604 IP serverxx-xxx-xxx-198.live-servers.net.openvpn > 
modemcable170.xxx-xx-xx.mc.videotron.ca.12582: UDP, length 14
15:48:26.034502 IP modemcable170.xxx-xx-xx.mc.videotron.ca.12582 > 
serverxx-xxx-xxx-199.live-servers.net.openvpn: UDP, length 14
15:48:26.035159 IP serverxx-xxx-xxx-198.live-servers.net.openvpn > 
modemcable170.xxx-xx-xx.mc.videotron.ca.12582: UDP, length 26
15:48:28.069517 IP serverxx-xxx-xxx-198.live-servers.net.openvpn > 
modemcable170.xxx-xx-xx.mc.videotron.ca.12582: UDP, length 14
15:48:28.572454 IP modemcable170.xxx-xx-xx.mc.videotron.ca.12582 > 
serverxx-xxx-xxx-199.live-servers.net.openvpn: UDP, length 14
15:48:28.573076 IP serverxx-xxx-xxx-198.live-servers.net.openvpn > 
modemcable170.xxx-xx-xx.mc.videotron.ca.12582: UDP, length 22
15:48:30.607377 IP serverxx-xxx-xxx-198.live-servers.net.openvpn > 
modemcable170.xxx-xx-xx.mc.videotron.ca.12582: UDP, length 14
15:48:31.000270 IP modemcable170.xxx-xx-xx.mc.videotron.ca.12582 > 
serverxx-xxx-xxx-199.live-servers.net.openvpn: UDP, length 14
15:48:31.000958 IP serverxx-xxx-xxx-198.live-servers.net.openvpn > 
modemcable170.xxx-xx-xx.mc.videotron.ca.12582: UDP, length 22
15:48:32.053286 IP serverxx-xxx-xxx-198.live-servers.net.openvpn > 
modemcable170.xxx-xx-xx.mc.videotron.ca.12582: UDP, length 14
15:48:33.395031 IP modemcable170.xxx-xx-xx.mc.videotron.ca.12582 > 
serverxx-xxx-xxx-199.live-servers.net.openvpn: UDP, length 14
15:48:33.395681 IP serverxx-xxx-xxx-198.live-servers.net.openvpn > 
modemcable170.xxx-xx-xx.mc.videotron.ca.12582: UDP, length 22
15:48:34.448213 IP serverxx-xxx-xxx-198.live-servers.net.openvpn > 
modemcable170.xxx-xx-xx.mc.videotron.ca.12582: UDP, length 14
15:48:34.582211 IP modemcable170.xxx-xx-xx.mc.videotron.ca.12582 > 
serverxx-xxx-xxx-199.live-servers.net.openvpn: UDP, length 14
15:48:34.582836 IP serverxx-xxx-xxx-198.live-servers.net.openvpn > 
modemcable170.xxx-xx-xx.mc.videotron.ca.12582: UDP, length 22
15:48:36.687104 IP serverxx-xxx-xxx-198.live-servers.net.openvpn > 
modemcable170.xxx-xx-xx.mc.videotron.ca.12582: UDP, length 14
15:48:36.958456 IP modemcable170.xxx-xx-xx.mc.videotron.ca.12582 > 
serverxx-xxx-xxx-199.live-servers.net.openvpn: UDP, length 14
15:48:36.959079 IP serverxx-xxx-xxx-198.live-servers.net.openvpn > 
modemcable170.xxx-xx-xx.mc.videotron.ca.12582: UDP, length 22
15:48:38.010994 IP serverxx-xxx-xxx-198.live-servers.net.openvpn > 
modemcable170.xxx-xx-xx.mc.videotron.ca.12582: UDP, length 14
15:48:39.338279 IP modemcable170.xxx-xx-xx.mc.videotron.ca.12582 > 
serverxx-xxx-xxx-199.live-servers.net.openvpn: UDP, length 14
15:48:39.338996 IP serverxx-xxx-xxx-198.live-servers.net.openvpn > 
modemcable170.xxx-xx-xx.mc.videotron.ca.12582: UDP, length 22
15:48:40.390890 IP serverxx-xxx-xxx-198.live-servers.net.openvpn > 
modemcable170.xxx-xx-xx.mc.videotron.ca.12582: UDP, length 14
15:48:40.520261 IP modemcable170.xxx-xx-xx.mc.videotron.ca.12582 > 
serverxx-xxx-xxx-199.live-servers.net.openvpn: UDP, length 14
15:48:40.520866 IP serverxx-xxx-xxx-198.live-servers.net.openvpn > 
modemcable170.xxx-xx-xx.mc.videotron.ca.12582: UDP, length 22
15:48:42.694793 IP serverxx-xxx-xxx-198.live-servers.net.openvpn > 
modemcable170.xxx-xx-xx.mc.videotron.ca.12582: UDP, length 14
15:48:44.868681 IP serverxx-xxx-xxx-198.live-servers.net.openvpn > 
modemcable170.xxx-xx-xx.mc.videotron.ca.12582: UDP, length 14
15:48:47.042593 IP serverxx-xxx-xxx-198.live-servers.net.openvpn > 
modemcable170.xxx-xx-xx.mc.videotron.ca.12582: UDP, length 14
15:48:49.216543 IP serverxx-xxx-xxx-198.live-servers.net.openvpn > 
modemcable170.xxx-xx-xx.mc.videotron.ca.12582: UDP, length 14
15:48:51.382460 IP serverxx-xxx-xxx-198.live-servers.net.openvpn > 
modemcable170.xxx-xx-xx.mc.videotron.ca.12582: UDP, length 14
15:48:53.540333 IP serverxx-xxx-xxx-198.live-servers.net.openvpn > 
modemcable170.xxx-xx-xx.mc.videotron.ca.12582: UDP, length 14
15:48:55.698253 IP serverxx-xxx-xxx-198.live-servers.net.openvpn > 
modemcable170.xxx-xx-xx.mc.videotron.ca.12582: UDP, length 14
15:48:57.856182 IP serverxx-xxx-xxx-198.live-servers.net.openvpn > 
modemcable170.xxx-xx-xx.mc.videotron.ca.12582: UDP, length 14
15:49:00.014120 IP serverxx-xxx-xxx-198.live-servers.net.openvpn > 
modemcable170.xxx-xx-xx.mc.videotron.ca.12582: UDP, length 14
15:49:02.105976 IP serverxx-xxx-xxx-198.live-servers.net.openvpn > 
modemcable170.xxx-xx-xx.mc.videotron.ca.12582: UDP, length 14

# Generated by iptables-save v1.3.5 on Thu Jul 29 17:41:50 2010
*nat
:PREROUTING ACCEPT [36:4648]
:POSTROUTING ACCEPT [16:5049]
:OUTPUT ACCEPT [16:5049]
-A PREROUTING -d xx.xxx.xxx.199 -p tcp -m tcp --dport 443 -j 
DNAT --to-destination xx.xxx.xxx.199:1194
-A POSTROUTING -s 172.16.0.0/255.255.255.0 -o eth0 -j MASQUERADE
-A POSTROUTING -s 10.8.0.0/255.255.255.0 -o eth0 -j MASQUERADE
COMMIT
# Completed on Thu Jul 29 17:41:50 2010
# Generated by iptables-save v1.3.5 on Thu Jul 29 17:41:50 2010
*filter
:INPUT DROP [20:1583]
:FORWARD DROP [0:0]
:OUTPUT ACCEPT [5:200]
:RH-Firewall-1-INPUT - [0:0]
-A INPUT -i lo -j ACCEPT
-A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
-A INPUT -i eth0 -p tcp -m tcp --dport 1057 -m state --state NEW -m 
recent --set --name SSH --rsource
-A INPUT -i eth0 -p tcp -m tcp --dport 1057 -m state --state NEW -m 
recent --update --seconds 60 --hitcount 2 --rttl --name SSH --rsource -j 
DROP
-A INPUT -d xx.xxx.xxx.199 -p tcp -m tcp --dport 1057 -m state --state 
NEW -j ACCEPT
-A INPUT -d xx.xxx.xxx.199 -p tcp -m tcp --dport 5555 -m state --state 
NEW -j ACCEPT
-A INPUT -d xx.xxx.xxx.199 -p tcp -m tcp --dport 1194 -m state --state 
NEW -j ACCEPT
-A INPUT -d xx.xxx.xxx.199 -p udp -m udp --dport 1194 -m state --state 
NEW -j ACCEPT
-A INPUT -i tun+ -j ACCEPT
-A INPUT -i tap+ -j ACCEPT
-A INPUT -p udp -m udp --dport 53 -m state --state NEW -j ACCEPT
-A INPUT -p tcp -m tcp --dport 53 -m state --state NEW -j ACCEPT
-A INPUT -p udp -m udp --dport 123 -m state --state NEW -j ACCEPT
-A INPUT -p tcp -m tcp --dport 8002 -m state --state NEW -j ACCEPT
-A INPUT -p tcp -m tcp --dport 9001 -m state --state NEW -j ACCEPT
-A INPUT -p tcp -m tcp --dport 80 -m state --state NEW -j ACCEPT
-A INPUT -d xx.xxx.xxx.198 -p tcp -m state --state NEW -m tcp --dport 
8080 -j ACCEPT
-A INPUT -d xx.xxx.xxx.198 -p tcp -m state --state NEW -m tcp --dport 
1935 -j ACCEPT
-A INPUT -d xx.xxx.xxx.198 -p tcp -m state --state NEW -m tcp --dport 80 -j 
ACCEPT
-A INPUT -d xx.xxx.xxx.198 -p tcp -m state --state NEW -m tcp --dport 443 -j 
ACCEPT
-A INPUT -d xx.xxx.xxx.199 -p tcp -m state --state NEW -m tcp --dport 443 -j 
ACCEPT
-A INPUT -p icmp -m limit --limit 1/sec --limit-burst 1 -j ACCEPT
-A INPUT -d xx.xxx.xxx.198 -p icmp -m icmp --icmp-type 8 -m state --state 
NEW,RELATED,ESTABLISHED -j ACCEPT
-A FORWARD -i eth0 -o tun+ -m state --state RELATED,ESTABLISHED -j ACCEPT
-A FORWARD -i tun+ -j ACCEPT
-A FORWARD -i tap+ -j ACCEPT
-A OUTPUT -s xx.xxx.xxx.199 -p tcp -m tcp --dport 1194 -m state --state 
NEW -j ACCEPT
-A OUTPUT -s xx.xxx.xxx.199 -p udp -m udp --dport 1194 -m state --state 
NEW -j ACCEPT
-A OUTPUT -s xx.xxx.xxx.199 -p tcp -m tcp --dport 443 -m state --state 
NEW -j ACCEPT
-A OUTPUT -s xx.xxx.xxx.198 -p icmp -m icmp --icmp-type 0 -m state --state 
RELATED,ESTABLISHED -j ACCEPT
-A OUTPUT -o lo -j ACCEPT
-A OUTPUT -m state --state NEW,RELATED,ESTABLISHED -j ACCEPT
COMMIT
# Completed on Thu Jul 29 17:41:50 2010



--------------------------------------------------
From: "Billy Crook" <billycrook@gmail.com>
Sent: Friday, August 06, 2010 11:10 PM
To: "J Webster" <webster_jack@hotmail.com>
Cc: <netfilter@vger.kernel.org>
Subject: Re: openvpn over udp failing

> On Fri, Aug 6, 2010 at 12:15, J Webster <webster_jack@hotmail.com> wrote:
>> CLIENT:
>> Fri Aug 06 08:11:59 2010 us=546000 TLS Error: TLS key negotiation failed 
>> to
>> occur within 60 seconds (check your network connectivity)
>> Fri Aug 06 08:11:59 2010 us=546000 TLS Error: TLS handshake failed
>> Fri Aug 06 08:11:59 2010 us=546000 TCP/UDP: Closing socket
>> Fri Aug 06 08:11:59 2010 us=546000 SIGUSR1[soft,tls-error] received, 
>> process
>> restarting
>
> Do a tcpdump on your client.  I bet you will see it send udp out to
> .198, but get udp back from .199.
>
> Solution: Configure openvpn to explicitly bind only to 199.
> --local xx.xx.xx.199 --bind
>
> (I also use openvpn.)
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
