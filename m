From: "Knight Tiger" <caugar@gmail.com>
Subject: Forwarding packets received on bridged interfaces -regarding
Date: Wed, 28 May 2008 15:36:09 -0700
Message-ID: <69fec4520805281536t15dd5e5dq289799693263371b@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
        bh=9wYekTNPhhlogoBJ/I3XaTHG0DW7P6bXpjcQ5vNMa7E=;
        b=uchbGz1Okn+pB5Uc09AV4Uk+vwy4E8cIXlKXwZYbgLTxR8HakAcb5tF2kQOdABvU6nG8z0/7P6MUcdSovhaLRkTnfYCn9RVCtT1pvL87OlAiK0+LsUaV3Yf1Dh/SUP8S9c51LAgMPb+zhJmIWgFeTJ6IczOat8IaKVgVT6ev9mA=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

I  have a Linux box with two interfaces, eth0 and eth1. eth1 is a
wireless interface with connects to a network and receives a DHCP
address. eth0 connects to a AP (with a cross over cable) and provides
Internet connection to a bunch of clients. The setup looks like this

AP1 <--> eth0      eth1 <---> AP2<---> DHCP server.

Using brctl I create a bridge with eth1 and eth0. I have not assigned
an IP address for the bridge. eth1 receives an IP address for the DHCP
server. When a client connects to AP1 and it requests an IP address from
the same DHCP server, I am not able to see the request on the DHCP
server. I did a tcpdump on eth0, eth1 and br0. I am able to see the
DHCP request packet with the client MAC address on all three
interfaces. But for some reason, the DHCP request is not forwarded to
the DHCP server.

>  I suggest that you bridge eth0 and eth1 together and then DHCP the
bridge interface.

>  I don't think that this will have any thing to do with it, but make sure
that ip_forward is not interfering with any thing.

>  Also what, if any thing, do you have for an IPTables config?

I cannot perform DHCP for the bridge for the DHCP server tracks each
interface that is assigned an IP and this setup is designed to make it
transparent to the DHCP server. I have set ip_forward to be 1.
(/proc/sys/net/ipv4/ip_forward) It makes no difference if it is 1 or
0. iptables is empty and the default policy is to accept for all three
chains.

$ brctl show br0
br0 8000.001641162.ba no eth0 eth1

ebtables  -A FORWARD -d Broadcast --log-level info -j ACCEPT
ebtables -t broute -A BROUTING -p ARP -arp-dst-mac $ETH1_MAC
--log-level info  -j DROP // drop ARP packets destined for eth1 and do
not fwd it to eth0
ebtables -t broute -A BROUTING -d Broadcast -i eth0 --log-level info
-j ACCEPT // all broadcast packets must be fwded.

$tail -f /var/log/messages
<extract>
kernel: IN=eth0 OUT= MAC source <newclient> MAC dest FF:FF:FF:FF:FF:FF
proto 0x0800 IP proto 17 SPT 68 DST 67
kernel: IN=eth0 OUT= eth1 MAC source <newclient> MAC dest
FF:FF:FF:FF:FF:FF proto 0x0800 IP proto 17 SPT 68 DST 67

I did a tcpdump on eth1 (wireless interface) and eth0 (wired
interface) and both show the DHCP packet. But this DHCP packet is not
forwarded to the DHCP server via eth1

$netstat -rn
116.69.66.0    0.0.0.0         255.255.255.0    U 0  0  eth1
0.0.0.0          116.69.66.0   0.0.0.0              UG  0 0 eth1

I see that there is a  route to the external world through eth1. I can
ping google.com and the rest of the world through eth1. But I cannot
forward traffic received from eth0 to the external world. Any help is
greatly appreciated. I thank you for your patience in reading this
entire message.

Thanks
Regards
Knight
