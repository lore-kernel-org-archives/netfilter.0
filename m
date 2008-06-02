From: Martin <mylists@itcom.com.ar>
Subject: load balance [OT?]
Date: Mon, 02 Jun 2008 16:26:27 -0300
Message-ID: <1212434787.2539.16326.camel@kr0sty.1.com.ar>
Reply-To: mylists@itcom.com.ar
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello netfilter list!

I don't know if this is the right place to post this question, but looks
that I won't find people with more knowledge about networking anywhere
else :)

I've been browsing list archive and some people send a few examples on
how to do it with ip route, but it's not working for me...

Here is what I've configured based on those examples and this
http://lartc.org/lartc.html


I've two ISP, and internal lan.

#ISP 1
ip route add $ISP1_NET dev $ISP1_IF src $ISP1_IP table 1
ip route add default via $ISP1_GW dev $ISP1_IF

#ISP 2 
ip route add $ISP2_NET dev $ISP2_IF src $ISP2_IP table 2
ip route add default via $ISP2_GW dev $ISP2_IF

#Rules for ISPs
ip rule add $ISP1_IP table 1
ip rule add $ISP2_IP table 2

#Internal LAN and cross reference to the other ISP
ip route add $LAN_NET dev $LAN_IF table 1
ip route add $ISP2_NET dev $ISP2_IF table 1

ip route add $LAN_NET dev $LAN_IF table 2
ip route add $ISP1_NET dev $ISP1_IF table 2

#Add isp net in main
ip route add $ISP1_NET dev $ISP1_IF src $ISP1_IP
ip route add $ISP2_NET dev $ISP2_IF src $ISP2_IP

#This should do the trick of balancing

ip route add default scope global equalize nexthop via $ISP1_GW dev
ISP1_IF weight 1 nexthop via $ISP2_GW dev $ISP2_IF weight 2


What actually happens is that traffic is going out only by the first GW
declared in the first nexthop, and it doesn't care weight nor balance.
The only chance of making it to go throw the second GW declared is
shutting down or collapse that interface, so then it goes for the second
one.

I'm using a vanilla kernel 2.6.23.17 with Alexey Kuznetsov's route
patches and some others at http://www.ssi.bg/~ja/ (using the
combinations patch offered in the site)



What am I doing wrong? I'm missing something, but can't figure out
what...


Any clue will be investigated ;)


Thanks for your time


Martin

