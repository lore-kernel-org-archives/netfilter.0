From: Brent Clark <brentgclarklist@gmail.com>
Subject: Different kind transparent proxy
Date: Thu, 09 Oct 2008 13:01:42 +0200
Message-ID: <48EDE496.8000900@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: 'Mail List - Netfilter' <netfilter@vger.kernel.org>

Hi

I have a basic home setup, the router / gate and the proxy server sit on 
different machines (Dont want squid on the FW).

I have a client that I want to access the web, but via squid.

The proxy and the client, both are on the same LAN etc.

Here are my rules.

For PREROUTING nat I have
186 10692 DNAT       tcp  --  eth1   *      !192.168.111.9        
0.0.0.0/0           multiport dports 80,443 to:192.168.111.9:3128

In my FORWARD filter I have

362 20472 LANWEB     tcp  --  *      *       0.0.0.0/0            
0.0.0.0/0           tcp dpt:3128

For my LANWEB chain I have

Chain LANWEB (1 references)
target     prot opt source               destination        
LOG        tcp  --  0.0.0.0/0            192.168.111.9       LOG flags 0 
level 4 prefix `ECCOWALL I'
ACCEPT     tcp  --  0.0.0.0/0            192.168.111.9      
LOG        tcp  --  0.0.0.0/0            192.168.111.9       LOG flags 0 
level 4 prefix `ECCOWALL O'

For some reason I cant get this working.
I have a look at the squid logs and theres nothing.

Using tcpdump on the gateway I am seeing,
tcpdump -n -i eth1 port 3128
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on eth1, link-type EN10MB (Ethernet), capture size 96 bytes
12:54:55.611493 IP 192.168.111.31.40550 > 192.168.111.9.3128: S 
233035686:233035686(0) win 5840 <mss 1460,sackOK,timestamp 3618633 
0,nop,wscale 6>
12:54:55.611653 IP 192.168.111.9.3128 > 192.168.111.31.40550: S 
1234458253:1234458253(0) ack 233035687 win 5792 <mss 
1460,sackOK,timestamp 737699015 3618633,nop,wscale 2>

And on squid

root@eccowall:~# tcpdump -n port 3128
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on eth0, link-type EN10MB (Ethernet), capture size 96 bytes
12:56:42.322401 IP 192.168.111.31.42990 > 192.168.111.9.3128: S 
1202540725:1202540725(0) win 5840 <mss 1460,sackOK,timestamp 3645306 
0,nop,wscale 6>
12:56:42.322693 IP 192.168.111.9.3128 > 192.168.111.31.42990: S 
2913335189:2913335189(0) ack 1202540726 win 5792 <mss 
1460,sackOK,timestamp 737725700 3645306,nop,wscale 2>
12:56:42.322435 IP 192.168.111.31.42990 > 192.168.111.9.3128: R 
1202540726:1202540726(0) win 0

But i cant understand cause the browser is not displaying anything.

If anyone could help, it would be appreciated.

TIA

Regards
Brent Clark


