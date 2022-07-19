From: Hiroaki Mizuguchi <mhiroaki@gmail.com>
Subject: Select a wrong source address on ipv4 masquerade
Date: Tue, 19 Jul 2022 18:20:44 +0900
Message-ID: <CANZA_aNkLFARRcgBKNXRSJkDvOtYkE68kwJxDaA4DTR7VjPbiA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=F0ptgMjFFxcW2BZqm1z6UeyRPFjkgH0LvVKTjk/914o=;
        b=DJ+RYzewLUH5Pi4m3EdAk/PD1eEFBq4JoYTaxAuHSPlBUK6+7M/JUvw4t51BCCruPN
         830zNxPDTyk/j91cjQjWT60Xl56xb6kQfKjTahJNpzTxruqM9gTJHdk+kCoz+32JPDKt
         f4LWe0RTYnohvy09ZRBhVJUqdeRiHzZw86K+oBQoPlSsNk3w6ina4xIrksx8PNg7aqFr
         4A6V1ROjzJq5ZV3D7xZiSPgcCDf8+CHKGahj2OMpBYeK0/+sJB3hCBwUmCpg4NejiZ0Z
         BApxLH+ki0/193P1be+f9MWIaPKd1dStaAU+EVVw9NE9f6agsJn+1pBm3sRBEb0PyedT
         nfGA==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi there. I am interested in IP Fabric.
I am unable to communicate externally from a container on my IP Fabric
test environment.
Upon investigation, I found that the wrong source address is selected
in a special condition of ipv4 masquerade.

Testing script is here.
### BEGIN SCRIPT
# create namespace
ip netns add router
ip netns add host
ip netns add container

# connect netns by veth
ip -n router link add eth0 type veth peer name eth0-host
ip -n router link set eth0-host netns host
ip -n host link set dev eth0-host name eth0

ip -n container link add eth0 type veth peer name eth1-host
ip -n container link set eth1-host netns host
ip -n host link set dev eth1-host name eth1

# link up interface
ip -n router link set up dev lo
ip -n router link set up dev eth0

ip -n host link set up dev lo
ip -n host link set up dev eth0
ip -n host link set up dev eth1

ip -n container link set up dev lo
ip -n container link set up dev eth0

# set ipv4 address
ip -n router address add 192.168.0.1/32 dev lo
ip -n router address add 169.254.0.1/16 dev eth0

ip -n host address add 192.168.0.2/32 dev lo
ip -n host address add 169.254.0.100/16 dev eth0
ip -n host address add 172.17.0.1/16 dev eth1

ip -n container address add 172.17.0.2/16 dev eth0

# set ipv4 route
ip -n router    route add 192.168.0.2 via 169.254.0.100 src 192.168.0.1
ip -n host      route add default     via 169.254.0.1   src 192.168.0.2
ip -n container route add default     via 172.17.0.1

# setup ipv4 masqurade on the host
ip netns exec host iptables-nft -t nat -A POSTROUTING -o eth0 -s
172.17.0.0/16 -j MASQUERADE

# testcase 1
ip netns exec router tcpdump -i eth0 -w sample1.pcap &
sleep 1
ip netns exec host ping -c 4 192.168.0.1
sleep 1
kill %1
wait

# testcase 2
ip netns exec router tcpdump -i eth0 -w sample2.pcap &
sleep 1
ip netns exec container ping -c 4 192.168.0.1
sleep 1
kill %1
wait

# cleanup
ip netns delete router
ip netns delete host
ip netns delete container
### END SCRIPT

Packet capture result is here.

$ tcpdump -r sample1.pcap -nn ip
reading from file sample1.pcap, link-type EN10MB (Ethernet), snapshot
length 262144
17:19:10.710298 IP 192.168.0.2 > 192.168.0.1: ICMP echo request, id
22104, seq 1, length 64
17:19:10.710318 IP 192.168.0.1 > 192.168.0.2: ICMP echo reply, id
22104, seq 1, length 64
17:19:11.736417 IP 192.168.0.2 > 192.168.0.1: ICMP echo request, id
22104, seq 2, length 64
17:19:11.736431 IP 192.168.0.1 > 192.168.0.2: ICMP echo reply, id
22104, seq 2, length 64
17:19:12.760421 IP 192.168.0.2 > 192.168.0.1: ICMP echo request, id
22104, seq 3, length 64
17:19:12.760434 IP 192.168.0.1 > 192.168.0.2: ICMP echo reply, id
22104, seq 3, length 64

$ tcpdump -r sample2.pcap -nn ip
reading from file sample2.pcap, link-type EN10MB (Ethernet), snapshot
length 262144
17:19:15.816724 IP 169.254.0.100 > 192.168.0.1: ICMP echo request, id
33436, seq 1, length 64
17:19:15.816736 IP 192.168.0.1 > 169.254.0.100: ICMP echo reply, id
33436, seq 1, length 64
17:19:16.824464 IP 169.254.0.100 > 192.168.0.1: ICMP echo request, id
33436, seq 2, length 64
17:19:16.824482 IP 192.168.0.1 > 169.254.0.100: ICMP echo reply, id
33436, seq 2, length 64
17:19:17.848457 IP 169.254.0.100 > 192.168.0.1: ICMP echo request, id
33436, seq 3, length 64
17:19:17.848475 IP 192.168.0.1 > 169.254.0.100: ICMP echo reply, id
33436, seq 3, length 64
17:19:18.872456 IP 169.254.0.100 > 192.168.0.1: ICMP echo request, id
33436, seq 4, length 64
17:19:18.872474 IP 192.168.0.1 > 169.254.0.100: ICMP echo reply, id
33436, seq 4, length 64

-- 
Hiroaki Mizuguchi
