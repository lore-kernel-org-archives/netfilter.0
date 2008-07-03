From: Robert L Mathews <lists@tigertech.com>
Subject: conntrack and ESTABLISHED / UNREPLIED connections
Date: Thu, 03 Jul 2008 13:08:57 -0700
Message-ID: <486D31D9.9070900@tigertech.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

I've been having a problem with /proc/net/ip_conntrack showing many 
connections in a state like this for up to five days:

tcp      6 426339 ESTABLISHED src=64.62.209.98 dst=96.221.109.137 
sport=443 dport=50465 packets=2 bytes=178 [UNREPLIED] src=96.221.109.137 
dst=64.62.209.98 sport=50465 dport=443 packets=0 bytes=0 mark=0 
secmark=0 use=1

netstat doesn't show these as established connections.

This is a problem because I'm also using connlimit on the server, and 
these phantom connections build up until the connlimit rule thinks a 
limit has been exceeded and the client is blocked.

I've been able to capture a tcpdump of this from both ends, and the way 
the connection is closing appears to be odd (although I'm no tcp 
expert). Here's the close of the connection from the client's perspective:

11:23:30.108118 IP 192.168.1.7.50465 > 64.62.209.98.443: F 6111:6111(0) 
ack 28907 win 65535 <nop,nop,timestamp 393902224 13017587>
11:23:30.139599 IP 64.62.209.98.443 > 192.168.1.7.50465: P 
28907:28944(37) ack 6111 win 148 <nop,nop,timestamp 13018053 393902224>
11:23:30.139624 IP 192.168.1.7.50465 > 64.62.209.98.443: R 
3460428831:3460428831(0) win 0

As you can see, it sends a FIN, then a RST, then it thinks it's done. 
Here's the close of the connection from the server's perspective:

11:23:30.178131 IP 64.62.209.98.443 > 96.221.109.137.50465: F 
28944:28944(0) ack 6111 win 148 <nop,nop,timestamp 13018053 393902224>
11:23:30.178471 IP 96.221.109.137.50465 > 64.62.209.98.443: F 
6111:6111(0) ack 28907 win 65535 <nop,nop,timestamp 393902224 13017587>
11:23:30.178486 IP 64.62.209.98.443 > 96.221.109.137.50465: . ack 6112 
win 148 <nop,nop,timestamp 13018053 393902224>
11:23:30.209702 IP 96.221.109.137.50465 > 64.62.209.98.443: R 
3460428831:3460428831(0) win 0
11:23:30.456820 IP 64.62.209.98.443 > 96.221.109.137.50465: P 
28907:28944(37) ack 6112 win 148 <nop,nop,timestamp 13018123 393902224>
11:23:31.016813 IP 64.62.209.98.443 > 96.221.109.137.50465: P 
28907:28944(37) ack 6112 win 148 <nop,nop,timestamp 13018263 393902224>

(Then the last lines are then repeated several more times over several 
minutes.)

What seems to be happening is that the server is sending a FIN, then 
expecting an ack of that, but instead it receives a RST. This results in 
a closed connection according to netstat, but conntrack thinks it's 
still ESTABLISHED until it times out five days later.

Am I understanding correctly? How can I avoid connlimit thinking that 
these connections are still established for days?

More details: the client is Mac OS X 10.4.11; the server is Debian Linux 
running a stock Debian kernel 2.6.24. This is a connection from Firefox 
2.0.0.14 on the client to Apache 2.2.3 (with a short 2 second keepalive 
timeout) on the server.

The full tcpdumps of the entire session are available at:

  http://tigertech.net/20080703.tcpdump.client.txt
  http://tigertech.net/20080703.tcpdump.server.txt

Thanks for any advice!

-- 
Robert L Mathews, Tiger Technologies
