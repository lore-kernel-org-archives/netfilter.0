From: Brian Austin <brian@standarduniversal.com.au>
Subject: dual wan routing, looking from the outside...
Date: Fri, 11 Jul 2008 10:18:15 +1000
Message-ID: <4876A6C7.7010709@standarduniversal.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi,
after some problems with attempt #1 at dual wan routing I have decided 
to start afresh. Unfortunately I have put the router in production so I 
need to be pretty careful now with what I do, so thought to ask the 
clever people for some thoughts.

for my second attempt

I have my kernel 2.6.25.15 patched with http://www.ssi.bg/~ja/#routes.

I have two isp connections and I advertise my mail server (smtp & imap) 
on my first ISP connection, and my vpn connection on the other isp 
connection.

mail - isp1 --adslmodem1---192.168.20.x
imaps                          |
                           dual wan router    --192.168.41.x-- mail 
imaps server is behind the wan router
                           is also vpn server
                            and smtp server     
                               |
vpn  - isp2 --adslmodem2---192.168.19.x

I port forward through the adsl modems to the wan router, adslmodem1 
port forwards mail 25,993 ports, adslmodem2 forwards openvpn port.

openvpn is served up by the dual wan router, as is smtp.

the imap mail is served up by the mail server behind the wan router, 
like this
iptables -A PREROUTING -d 192.168.20.253 -i eth20 -p tcp -m tcp --dport 
993 -j DNAT --to-destination 192.168.41.5:993

 
Now the problem I have at the moment is.

 From the outside, I can only access services from one isp connection at 
a time. So if I VPN in, then I cant access my imaps mail,

do I need to do some sort of packet marking to achieve this? So that 
packets from the same internet host can route out both wan connections 
simultaniously?

Pointers to example scripts or the right information to study appreciated

regards

Brian

