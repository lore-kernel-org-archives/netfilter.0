From: DEMAINE Benoit-Pierre <benoit@demaine.info>
Subject: Re: ebtables to perform MAC NAT ?
Date: Wed, 30 Jul 2008 16:11:50 +0200
Message-ID: <489076A6.4090307@demaine.info>
References: <4884282D.80804@demaine.info> <4884A677.8080003@riverviewtech.net> <4884B214.90406@demaine.info> <4884E580.5000909@riverviewtech.net> <4885171A.1080709@demaine.info> <48860C0C.60504@riverviewtech.net> <48877E56.90703@demaine.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48877E56.90703@demaine.info>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Works at last.

Question was: I have cheap hardware, and want to build a Wifi access 
point: i need to do transparent bridging between eth0 and wlan1.

Bad point for me (technical issue) was: after a few tests, as for many 
other people, my wifi card does not seem to enjoy brctl at all. I have 
an MA311, that is said to work for other people, but for me, brctl does 
not work nice. Maybe it is a firmware issue.

This trick allowed to get working network, the "bad" way:
> ifconfig eth0 192.168.0.205
> iwconfig wlan1 mode managed
> iwconfig wlan1 essid benoit
> iwconfig wlan1 key 0123-4567-89
> iwconfig wlan1 sens 2
> ifconfig wlan1 192.168.0.206
> echo 1 > /proc/sys/net/ipv4/ip_forward
> sleep 1
> ifconfig eth0 0.0.0.0 up
> ifconfig wlan1 0.0.0.0 up
> brctl addbr br0
> brctl addif br0 eth0
> brctl addif br0 wlan1
> ifconfig br0 192.168.0.205
> ifconfig br0:1 192.168.0.206
> sleep 1
> ebtables -t nat -F
> ebtables -t nat -A POSTROUTING -j snat --to-source 00:09:5b:48:d6:ab --snat-arp
> ebtables -t nat -A PREROUTING -p arp -j arpreply --arpreply-mac 00:09:5b:48:d6:ab
> route add default gw 192.168.0.1
> (echo -e "\t* sleeping 16s ... waiting for brige to build ..." ; sleep 16 ; beep -f 2000 -l 50 -r 3 ; echo -e "\t* bridge r
> eady !!!" ; ) &

Advantage of this: ARP get answered nicely, and all frames go through as 
wanted

Bad point: the router answers to all ARP requests, meaning, it virtually 
owns all IPs (even those outside the network), so that when machines 
like DHCP, Windows and Linux check if an IP is free before using it, the 
router already use it, and no IP is even free.

My actual solution that work way better:
> ifconfig eth0 192.168.0.205 netmask 255.255.255.255
> echo 1 > /proc/sys/net/ipv4/conf/eth0/proxy_arp
> iwconfig wlan1 mode managed
> iwconfig wlan1 essid benoit
> iwconfig wlan1 key 0123-4567-89
> iwconfig wlan1 sens 2
> ifconfig wlan1 192.168.0.206 netmask 255.255.255.255
> echo 1 > /proc/sys/net/ipv4/ip_forward
> echo 1 > /proc/sys/net/ipv4/conf/wlan1/proxy_arp
> sleep 1
> 
> parprouted -d eth0 wlan1 &
> 
> while true
> do
> 
> echo "Waiting for default route to go away ..."
> while route -n |cut -d " " -f1 |grep "0.0.0.0" >/dev/null
> do
>         sleep 1
> done
> 
> echo "Trying to add default route ... until it's here."
> until route -n |cut -d " " -f1 |grep "0.0.0.0" >/dev/null
> do
>         /bin/ping -c1 -w1 192.168.0.1 >/dev/null 2>&1
>         sleep 1
>         /sbin/route add default gw 192.168.0.1
>         sleep 1
> done 
> 
> /bin/echo "* Added default route"
> 
> done

Of course, the last part can not be encoded in system conf file for 
network, it has to be put in an independent script.

It has to be a double loop, in case we loose the default route ( I am 
99,999% sure there are cases where we can loose it, if we loose it's 
MAC, what could happen if during a reboot of the gateway, we expire the 
timeout of the ARP cache).

This rely on the ability of parprouted to automatically update routes in 
the kernel (see reference below): use /32 masks, and hope for the best. 
Just assign any IP to each interface, in any network, and apply the 
255.255.255.255 mask.

Minus: Discovery takes time: it can take up to 12s from experience: it 
means, when you try to reach a machine for the first time, you are 
likely to have lost, and errors at the beginning. Having a machine down 
for longer than the ARP timeout will be a problem. Trying to reach an IP 
that is not up will flood parprouted queues.

But once we found where an IP is, everything seems stable (because 
parprouted refreshes ARP before the timeout, so that they never expire).

***

Problems yet to fix:
- add DHCP relay
- check that IPv6 goes through

References:
http://lists.shmoo.com/pipermail/hostap/2005-January/009412.html => 
means brctl can work on MA311

http://www.atomicmpc.com.au/forums.asp?s=2&c=16&t=4705
MA311 as Master

http://ebtables.sourceforge.net/examples.html#real ebtables examples

http://www.linuxfoundation.org/en/Net:Bridge#It_doesn.27t_work_with_my_Wireless_card.21 
  says that it is common for a wifi card to not work with brctl

http://wiki.xensource.com/xenwiki/XenWifi
the first guide saying that ebtables can be used to fix this kind of MAC 
problem

http://osdir.com/ml/network.bridge.ebtables.user/2005-03/msg00012.html
ebtables to iptables on a transparent bridge

http://freshmeat.net/articles/view/1433/

http://wiki.openwrt.org/OpenWrtDocs/WhiteRussian/TransparentFirewall
more scripts

http://lartc.org/howto/lartc.bridging.proxy-arp.html
proxyarp

http://tldp.org/HOWTO/Wireless-HOWTO-5.html
the page that says parprouted creates automatically routes for any 
discovered machine, so that, in the end, we can assign to the machine 
any IP with the mask /32.

http://www.faqs.org/docs/Linux-mini/Proxy-ARP-Subnet.html

http://linux.die.net/man/8/parprouted
parprouted man page

> Unlike standard bridging, proxy ARP bridging allows to bridge Ethernet networks behind wireless nodes. Normal L2 bridging does not work between wireless nodes because wireless does not know about MAC addresses used in the wired Ethernet networks. Also this daemon is useful for making transparent firewalls.

> By automatically adding appropriate /32 routes to Linux kernel IP routing table for the hosts learned via ARP , daemon ensures that the Linux kernel will be able to route the packets to the destination host when it receives them without any need routing/subnetting manually.

http://www.usenet-forums.com/linux-security/124068-simple-proxy-arp-setup-needed.html
dont forget to add
> echo 1 > /proc/sys/net/ipv4/conf/eth0/proxy_arp
> echo 1 > /proc/sys/net/ipv4/conf/eth1/proxy_arp
> echo 1 > /proc/sys/net/ipv4/ip_forward

***

For ref, this problem is also discussed in
http://forums.gentoo.org/viewtopic-t-695507-start-0-postdays-0-postorder-asc-highlight-.html?sid=90c8f519d6237940b01ea7bcf08a3ce5

Thanks Grant for help. I will unsubscribe this ML in 48h.

-- 
  >o_/ DEMAINE Benoit-Pierre (aka DoubleHP) http://benoit.demaine.info/
If computing were an exact science, IT engineers would not have work \_o<

"So all that's left, Is the proof that love's not only blind but deaf."
(FAKE TALES OF SAN FRANCISCO, Arctic Monkeys)
