From: Tom van Leeuwen <tom.van.leeuwen@saasplaza.com>
Subject: netlink event socket buffer size cannot be doubled further
Date: Tue, 08 May 2012 08:25:51 +0200
Message-ID: <4FA8BC6F.1080306@saasplaza.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi list,

I am having an active/backup firewall using ubuntu12.04 with keepalived 
and conntrackd.
I'm using the provided primary-backup.sh script 
(/usr/share/doc/conntrackd/examples/sync/primary-backup.sh).

When I've done a failover, I see the following in /var/log/syslog:
May  8 07:43:11 ubuntu conntrack-tools[2652]: flushing conntrack table 
in 60 secs
May  8 07:43:11 ubuntu conntrack-tools[2652]: request resync
May  8 07:44:11 ubuntu conntrack-tools[2652]: flushing kernel conntrack 
table (scheduled)
May  8 07:44:11 ubuntu conntrack-tools[2652]: netlink event socket 
buffer size cannot be doubled further since it will exceed 
NetlinkBufferSizeMaxGrowth. We are likely to be losing events, this may 
lead to unsynchronized replicas. Please, consider increasing netlink 
socket buffer size via NetlinkBufferSize and NetlinkBufferSizeMaxGrowth 
clauses in conntrackd.conf

This is my configuration:
# cat /etc/conntrackd/conntrackd.conf
General {
     HashSize 8192
     HashLimit 1048576
     Syslog on
     LockFile /var/lock/conntrackd.lock
     UNIX {
         Path /var/run/conntrackd.sock
         Backlog 20
     }
     #SocketBufferSize 262142
     SocketBufferSize 524284
     #SocketBufferSizeMaxGrown 655355
     SocketBufferSizeMaxGrown 1310710
     Filter {
         Protocol Accept {
             TCP
             UDP
             ICMP
         }
         Address Ignore {
             IPv4_address 127.0.0.1 # loopback
             IPv4_address 1.2.3.51
             IPv4_address 1.2.3.6
         }
     }
}
Sync {
         Mode FTFW {
         }
         UDP {
                 IPv4_address 1.2.3.51
                 IPv4_Destination_Address 1.2.3.50
                 Port 3780
                 Interface vlan888
                 Checksum on
         }
}

I've already doubled the values which obviously are insufficient.
I don't know what sane values would be or what the impact is when I keep 
increasing these values.
They have a default for a reason I suppose :-)

# conntrackd -i | wc -l
29228

Highest value I've seen is ~40000

Kind regards,
Tom van Leeuwen
