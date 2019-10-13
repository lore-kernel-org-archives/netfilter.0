From: Thomas Luening <toml@thlu.de>
Subject: syn-flag-check from outside not working
Date: Sun, 13 Oct 2019 11:11:30 +0200
Message-ID: <8beb7e27-2b22-b107-2482-27fd8fc3c8ad@mail>
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: de-DE
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello @ all

My network is a private network with access via VPN just for me. The intention of my rules is to limit all syn-flag-packets from 
outside to a maximum of 2 tries per minute, then immediately block the IP temporarily. This does not interfere with my own 
connections, but should prevent repeated unauthorized connections. But exactly that doesn't happen....  see log excerpt. Where 
is my thought error?

table ip filter {
     set blackhole {
         type ipv4_addr
         size 1000
         timeout 1h
         gc-interval 1m
     }

chain input {
     type filter hook input priority 0; policy accept;
     ct state invalid counter packets 0 bytes 0 drop
     iifname "lo" accept
     ct state established,related accept

     ip saddr @blackhole counter packets 0 bytes 0 log prefix "Temp.banned IP: " drop

     tcp flags syn ip saddr != { 10.0.1.0/24, 10.0.8.0/22 } limit rate over 2/minute add @blackhole { ip saddr }  reject with 
tcp reset
     icmp type echo-request ip saddr != { 10.0.1.0/24, 10.0.8.0/22 } limit rate over 2/minute add @blackhole { ip saddr } 
reject with icmp type host-unreachable

     ip protocol icmp ip saddr { 10.0.1.0/24, 10.0.8.0/22 } accept
     pkttype { broadcast, multicast } ip saddr { 10.0.1.0/24, 10.0.8.0/22 } accept

     ::::
     :::: some special Port-Rules (only Accepts) ::::
     ::::

     ip protocol tcp counter packets 20 bytes 1200 reject with tcp reset
     counter packets 1 bytes 328 reject
}

BR, Tom




Excerpt from the Application-Log:
Sat Oct 12 14:06:18 2019 107.199.31.162:50122 Connection reset, restarting [0]
Sat Oct 12 14:06:18 2019 107.199.31.162:50123 Connection reset, restarting [0]
Sat Oct 12 14:06:18 2019 107.199.31.162:50124 Connection reset, restarting [0]
Sat Oct 12 14:06:18 2019 107.199.31.162:50125 Connection reset, restarting [0]
Sat Oct 12 14:06:19 2019 107.199.31.162:50126 Connection reset, restarting [0]

Sat Oct 12 14:09:01 2019 107.199.31.162:50924 Connection reset, restarting [0]
Sat Oct 12 14:09:01 2019 107.199.31.162:50925 Connection reset, restarting [0]
Sat Oct 12 14:09:01 2019 107.199.31.162:50927 Connection reset, restarting [0]
Sat Oct 12 14:09:02 2019 107.199.31.162:50929 Connection reset, restarting [0]

Sat Oct 12 14:11:44 2019 107.199.31.162:51378 Connection reset, restarting [0]
Sat Oct 12 14:11:44 2019 107.199.31.162:51379 Connection reset, restarting [0]
Sat Oct 12 14:11:44 2019 107.199.31.162:51380 Connection reset, restarting [0]
Sat Oct 12 14:11:45 2019 107.199.31.162:51381 Connection reset, restarting [0]

Sat Oct 12 14:14:27 2019 107.199.31.162:51403 Connection reset, restarting [0]
Sat Oct 12 14:14:27 2019 107.199.31.162:51404 Connection reset, restarting [0]
Sat Oct 12 14:14:27 2019 107.199.31.162:51405 Connection reset, restarting [0]
Sat Oct 12 14:14:28 2019 107.199.31.162:51406 Connection reset, restarting [0]

Sat Oct 12 14:17:10 2019 107.199.31.162:51422 Connection reset, restarting [0]
Sat Oct 12 14:17:10 2019 107.199.31.162:51423 Connection reset, restarting [0]
Sat Oct 12 14:17:10 2019 107.199.31.162:51424 Connection reset, restarting [0]
Sat Oct 12 14:17:11 2019 107.199.31.162:51425 Connection reset, restarting [0]

... and so on until late night
