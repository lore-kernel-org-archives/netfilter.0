From: Bluec0re <nftables@bluec0re.eu>
Subject: [Question/Bug?] Translating ebtables/iptables nat to nftables
Date: Fri, 12 May 2017 17:39:02 +0200
Message-ID: <84afb7f2-dc36-7683-c743-bcec6d34770f@bluec0re.eu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-GB
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

I've some problems translating the following ebtables/iptables:

ebtables -t nat -I PREROUTING -i $CLIENT_IF -p ip --ip-protocol tcp
--ip-source $CLIENT_IP --ip-destination-port $PORT -j redirect

iptables -t nat -I PREROUTING -i $BRIDGE_IF -p tcp -s $CLIENT_IP --dport
$PORT -j DNAT --to $MY_IP

The setup is as follows:

                             br0
CLIENT  eth0  ----- eth1   BRIDGE  eth2 ------ eth0 SERVER
192.168.50.2            192.168.50.4            192.168.50.3

I successfully redirected all tcp traffic from 192.168.50.2 to
192.168.50.3:12345 to 192.168.50.4:12345.

I tried the following nftables rules to achieve the same result:

table bridge nat {
    chain prerouting {
        type filter hook prerouting priority 0;
        iifname $CLIENT_IF ip saddr $CLIENT_IP counter meta pkttype set
unicast ether daddr set $MY_MAC
    }
}
table ip nat {
    chain prerouting {
        type nat hook prerouting priority 0;
        iifname $BRIDGE_IF ip saddr $CLIENT_IP counter dnat to $MY_IP
    }
}

But it does not work, instead the MAC was rewritten, but the packets
were forwarded to eth2. I also registered all available hooks for the
tables and did a trace:


> trace id d43314fa netdev nat ingress packet: iif "eth1" ether saddr 08:00:27:31:3b:bc ether daddr 08:00:27:11:84:71 ip saddr 192.168.50.2 ip daddr 192.168.50.3 ip dscp cs0 ip ecn not-ect ip ttl 64 ip id 45735 ip length 60 tcp sport 47676 tcp dport 12345 tcp flags == syn tcp window 29200 
> trace id d43314fa netdev nat ingress rule nftrace set 1 (verdict continue)
> trace id d43314fa netdev nat ingress verdict continue 
> trace id d43314fa netdev nat ingress 
> trace id d43314fa bridge nat prerouting packet: iif "eth1" ether saddr 08:00:27:31:3b:bc ether daddr 08:00:27:11:84:71 ip saddr 192.168.50.2 ip daddr 192.168.50.3 ip dscp cs0 ip ecn not-ect ip ttl 64 ip id 45735 ip length 60 tcp sport 47676 tcp dport 12345 tcp flags == syn tcp window 29200 
> trace id d43314fa bridge nat prerouting rule iif "eth1" counter packets 0 bytes 0 (verdict continue)
> trace id d43314fa bridge nat prerouting rule iifname "eth1" ip saddr 192.168.50.2 counter packets 0 bytes 0 pkttype set host ether daddr set 08:00:27:1b:a1:83 (verdict continue)
> trace id d43314fa bridge nat prerouting verdict continue 
> trace id d43314fa bridge nat prerouting 
> trace id d43314fa bridge nat input packet: iif "eth1" ether saddr 08:00:27:31:3b:bc ether daddr 08:00:27:1b:a1:83 ip saddr 192.168.50.2 ip daddr 192.168.50.3 ip dscp cs0 ip ecn not-ect ip ttl 64 ip id 45735 ip length 60 tcp sport 47676 tcp dport 12345 tcp flags == syn tcp window 29200 
> trace id d43314fa bridge nat input rule iif "eth1" counter packets 0 bytes 0 (verdict continue)
> trace id d43314fa bridge nat input verdict continue 
> trace id d43314fa bridge nat input 

I also tried to rewrite the mac and ip in the ingress hook. This worked
in terms of that the SYN packets were accepted, but the SYN/ACKs were
sent back with the wrong src ip (.4 instead of .3) as it was actually
hard rewrite instead of a dnat.

Any ideas why the ip nat tables are not invoked? Is this a bug in
nftables or is it not supposed to work? (As it worked with iptables)

Thanks in advance,
Bluec0re

PS: I could not find any packet flow diagrams for nftables like this
one:
https://upload.wikimedia.org/wikipedia/commons/3/37/Netfilter-packet-flow.svg
Are the hooks still the same, are there some new flow paths?
