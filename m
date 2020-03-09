From: sean darcy <seandarcy2@gmail.com>
Subject: nft ingress won't work on wireless ?
Date: Mon, 9 Mar 2020 09:36:40 -0400
Message-ID: <r45gp9$1j5t$1@ciao.gmane.io>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Fedora 31. nftables-0.9.1-3.fc31.x86_64

The same ingress rule works on the ethernet port, but not on wireless.

This works:


cat  ipv4-netdev-asterisk
# /opt/nftables/ipv4-filter-asterisk

include "/opt/nftables/whitelist1"
include "/opt/nftables/ip.blacklist1"

table netdev netdev1 {
        set whitelist {
                 type ipv4_addr
                 flags interval
                 auto-merge
                 elements = $whitelist_ips
         }

         set blacklist {
                 type ipv4_addr
                 flags interval
                 auto-merge
                 elements = $blacklist_ips
         }

         chain ingress1 {
		type filter hook ingress device enp5s0 priority 0; policy accept;
                 udp dport { 6000-31000 } accept comment  rtp_ports
                 #accept whitelist
                 ip saddr @whitelist accept
                 tcp dport { 3478, 5349, 554, 5222, 5269, 19294 } 
counter accept comment "stun stun-tls rtsp and gv"
                 udp dport { 3478, 4893, 19295, 19302 } counter accept 
comment "stun and gv"
                 #drop blacklist
                 ip saddr @blacklist counter drop
         }
}


But if I change the device in the ingress1 chain to wlp4s0, which exists:

  ifconfig | grep -A 1 wlp4s0
wlp4s0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
         inet 10.0.0.61  netmask 255.255.255.0  broadcast 10.0.0.255

it fails.

nft[4158]: In file included from /opt/nftables/whitelist1:39:2-39:
nft[4158]:                  from 
/opt/nftables/ipv4-netdev-asterisk-wlp4s0:6:1-35:
nft[4158]:                  from /etc/sysconfig/nftables.conf:17:1-52:
nft[4158]: /opt/nftables/ip.blacklist1:1124:15-22: Error: Could not 
process rule: Device or resource busy
systemd[1]: nftables.service: Main process exited, code=exited, 
status=1/FAILURE

Just to repeat: the only change is the device. The other files are all 
the same.

Puzzled,

sean

