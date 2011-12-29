From: Pablo Antonio Costa <pablo.costa@caoamontadora.com.br>
Subject: iptables squid non-transparent
Date: Thu, 29 Dec 2011 12:03:08 +0000
Message-ID: <CF4E8296A16C1A408B28BFFED33EA8B301FEED5B@SRVEX1APS.caoamontadora.com.br>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: pt-BR
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Sachin Gopal [gopalsachin@gmail.com]

Try putting a established, related as accept.


------------------------------------------------------------------------

same result :*(...  cant navagate from client (172.16.39.88)

[root@srvsc1aps ~]# iptables -nL -v --line-numbers
Chain INPUT (policy DROP 967 packets, 68517 bytes)
num   pkts bytes target     prot opt in     out     source               destination         
1      885 82176 ACCEPT     all  --  lo     *       0.0.0.0/0            0.0.0.0/0           
2     1162 71075 ACCEPT     tcp  --  *      *       172.16.0.0/16        0.0.0.0/0           tcp dpt:22 
3        0     0 ACCEPT     tcp  --  *      *       172.16.0.0/16        0.0.0.0/0           tcp dpt:8888 
4        9  3197 ACCEPT     tcp  --  *      *       172.16.39.88         0.0.0.0/0           state RELATED,ESTABLISHED tcp dpt:3128 
5    34963   39M ACCEPT     all  --  *      *       172.16.33.0/24       0.0.0.0/0  <-- ALL PROXY CONNECTION (3128) -->   

Chain FORWARD (policy DROP 0 packets, 0 bytes)
num   pkts bytes target     prot opt in     out     source               destination         

Chain OUTPUT (policy ACCEPT 2774K packets, 1124M bytes)
num   pkts bytes target     prot opt in     out     source               destination         
1      823 75985 ACCEPT     all  --  *      lo      0.0.0.0/0            0.0.0.0/0           
[root@srvsc1aps ~]# 