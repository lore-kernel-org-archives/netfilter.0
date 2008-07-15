From: Brian <brian@standarduniversal.com.au>
Subject: Re: dual wan routing, looking from the outside...
Date: Tue, 15 Jul 2008 20:39:15 +1000
Message-ID: <487C7E53.3060904@standarduniversal.com.au>
References: <4876A6C7.7010709@standarduniversal.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4876A6C7.7010709@standarduniversal.com.au>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi Again,

well I'm doing some more investigation...

I add the iptables rule
iptables -t mangle -A PREROUTING -i eth20 -j MARK --set-mark 2

which is meant to mark connections coming in on eth20 (192.168.20.253)  
with the number 2.

yet looking at the connections after making a connection to the box...

cat /proc/net/ip_conntrack
....
tcp      6 431997 ESTABLISHED src=60.242.51.252 dst=192.168.20.253 
sport=2158 dport=25 packets=2 bytes=88 src=192.168.20.253 
dst=60.242.51.252 sport=25 dport=2158 packets=1 bytes=48 [ASSURED] 
mark=0 secmark=0 use=1
....

mark=0 ????!  what am I doing wrong?

regards

Brian

p.s.

kernel compiled with
CONFIG_NETFILTER=y
CONFIG_NETFILTER_DEBUG=y
CONFIG_NETFILTER_ADVANCED=y
CONFIG_NF_CONNTRACK=y
CONFIG_NF_CT_ACCT=y
CONFIG_NF_CONNTRACK_MARK=y
CONFIG_NF_CONNTRACK_SECMARK=y
CONFIG_NF_CONNTRACK_EVENTS=y




Brian Austin wrote:
> Hi,
> after some problems with attempt #1 at dual wan routing I have decided 
> to start afresh. Unfortunately I have put the router in production so 
> I need to be pretty careful now with what I do, so thought to ask the 
> clever people for some thoughts.
>
> for my second attempt
>
> I have my kernel 2.6.25.15 patched with http://www.ssi.bg/~ja/#routes.
>
> I have two isp connections and I advertise my mail server (smtp & 
> imap) on my first ISP connection, and my vpn connection on the other 
> isp connection.
>
> mail - isp1 --adslmodem1---192.168.20.x
> imaps                          |
>                           dual wan router    --192.168.41.x-- mail 
> imaps server is behind the wan router
>                           is also vpn server
>                            and smtp server     
>                               |
> vpn  - isp2 --adslmodem2---192.168.19.x
>
> I port forward through the adsl modems to the wan router, adslmodem1 
> port forwards mail 25,993 ports, adslmodem2 forwards openvpn port.
>
> openvpn is served up by the dual wan router, as is smtp.
>
> the imap mail is served up by the mail server behind the wan router, 
> like this
> iptables -A PREROUTING -d 192.168.20.253 -i eth20 -p tcp -m tcp 
> --dport 993 -j DNAT --to-destination 192.168.41.5:993
>
>
> Now the problem I have at the moment is.
>
> From the outside, I can only access services from one isp connection 
> at a time. So if I VPN in, then I cant access my imaps mail,
>
> do I need to do some sort of packet marking to achieve this? So that 
> packets from the same internet host can route out both wan connections 
> simultaniously?
>
> Pointers to example scripts or the right information to study appreciated
>
> regards
>
> Brian
>
> -- 
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
