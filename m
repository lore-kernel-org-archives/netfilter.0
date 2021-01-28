From: Bernd Naumann <bena@spreadshirt.net>
Subject: [ERROR] inject-add2: File exists / [ERROR] inject-upd2: Device or
 resource busy
Date: Thu, 28 Jan 2021 13:33:30 +0100
Message-ID: <7a8c753a-a2d6-cf30-81c2-3d205fba265b@spreadshirt.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter <netfilter@vger.kernel.org>

Hi *,

I see some of these error messages every couple of minutes, in the range 
of 1 in 2-3 minutes and 2-3 per minute.
Sometimes at the same time on both peers, sometimes not.

At first I thought it is somehow related to increasing "no space left in 
cache", and so I doubled and doubled `HashSize` and `HashLimit` till I 
did not saw creation failed or update failed when running `conntrackd -s 
cache` any longer.

However, chances are high both have nothing to do with each other.
I do not even know if this is a really a thing to be concerned about.
AFAIK conntrackd re-tries to create/inject/update in case of an error...


What could be / is the reason of these errors "inject-add2: File exists" 
and "inject-upd2: Device or resource busy"?


What information can I provide in addition?

The two systems run conntrackd 1.4.5 on a Debian 10 with kernel 5.7

/proc/sys/net/netfilter/nf_conntrack_max
1048576


General {
   HashSize 1048576
   HashLimit 2097152

   LogFile on
   LockFile /var/lock/conntrackd.lock
   UNIX {
     Path /var/run/conntrackd.sock
     Backlog 20
   }

   NetlinkBufferSize 2097152
   NetlinkBufferSizeMaxGrowth 8388608
   NetlinkOverrunResync on
   NetlinkEventsReliable on

   Filter From Kernelspace {
     Protocol Accept {
       TCP
       UDP
       ICMP
       IPv6-ICMP
     }

     Address Ignore {
       IPv4_address 127.0.0.0/8
       IPv4_address PEER_1_LAN/32
       IPv4_address PEER_2_LAN/32
       IPv4_address PEER_1_WAN_1/32
       IPv4_address PEER_2_WAN_1/32
       IPv4_address PEER_1_WAN_2/32
       IPv4_address PEER_2_WAN_2/32
       IPv4_address 169.254.0.0/16
       IPv6_address ::1
     }
   }
}

Sync {
   Mode FTFW {
     DisableExternalCache on
   }

   UDP {
     IPv4_address PEER_1_LAN
     IPv4_Destination_Address PEER_2_LAN
     Port 3780
     Interface lan0
     SndSocketBuffer 1249280
     RcvSocketBuffer 1249280
     Checksum on
   }

   Options {
     TCPWindowTracking on
     ExpectationSync On
   }
}


Thanks for reading and any hints you may can provide.
Bernd
