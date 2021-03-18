From: Budge <ajebay@errichel.co.uk>
Subject: Startup script for ssdp helper app
Date: Thu, 18 Mar 2021 10:21:20 +0000
Message-ID: <21f5c9c1-2d34-5a28-4e86-d3fb23ca375b@errichel.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-GB
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi,
I am not a coder and am seeking help please to create a startup script.
I am running on openSUSE Tumbleweed.

I need to enable a control app (minimwatch) on my laptop in order to control a upnp server (minimserver) on a remote NAS. The problem is the way minimserver first connects using random dynamic ports and getting the connection through the firewall.

With help I now have the commands necessary to create this connection but I am having problems creating a script so that this works from boot.

The steps I have which work are:-
  
1. Enable ssdp user helper in conntrackd.conf:

Code:
General {
     HashSize 32768
     HashLimit 131072
     Syslog on
     LockFile /var/run/lock/conntrackd.lock

     UNIX {
         Path /var/run/conntrackd.sock
     }

     SocketBufferSize 262142
     SocketBufferSizeMaxGrown 655355

     # default SUSE systemd service unit file is of Type=notify
     Systemd off
}

Stats {
     LogFile on
}


Helper {
     Type ssdp inet udp {
         QueueNum 5
         QueueLen 10240
         Policy ssdp {
             ExpectMax 8
             ExpectTimeout 300
         }
     }
     Type ssdp inet tcp {
         QueueNum 5
         QueueLen 10240
         Policy ssdp {
             ExpectMax 8
             ExpectTimeout 300
         }
     }
}

2. Register ssdp helper in kernel:

Code:

nfct add helper ssdp inet tcp
nfct add helper ssdp inet udp

3. Connect user helper to kernel:
Code:

systemctl start conntrackd.service

4. Add rules to invoke ssdp helper:
Code:

iptables -t raw -A OUTPUT -p udp --dport 1900 -j CT --helper ssdp

Having edited conntrackd.conf, when I run the commands 2,3 & 4 in this sequence after I have booted, the connection to minimwatch works.  So far so good.  What I now seek is to automate this so everything works from boot without me needing to run the three commands as root.

If you have time I would really appreciate some help as this is well above me.

Regards,
Budge
