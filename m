From: "Hurley, Michael" <MHurley@law.uconn.edu>
Subject: Ports closed in spite of opening them?
Date: Fri, 2 Apr 2004 10:09:41 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <AD8D39C727CBD411BB2C0090273A727408F9F135@mortimer.law.uconn.edu>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

Trying to write an iptables script to open ports 22, 25, 80, and 443 on a
little testing box. The problem is, when I scan for open ports, 25 and 443
report they are *closed*. Any idea what might be going on here?

Here is the output of iptables -L -n -v:

Chain INPUT (policy DROP 54 packets, 4405 bytes)
 pkts bytes target     prot opt in     out     source
destination         
  242 23174 ACCEPT     all  --  *      *       0.0.0.0/0
0.0.0.0/0          state RELATED,ESTABLISHED 
    2   120 ACCEPT     tcp  --  *      *       192.168.100.0/27
0.0.0.0/0          tcp dpt:80 state NEW 
    1    60 ACCEPT     tcp  --  *      *       192.168.100.0/27
0.0.0.0/0          tcp dpt:443 state NEW 
    1    48 ACCEPT     tcp  --  *      *       192.168.101.0/24
0.0.0.0/0          tcp dpt:80 state NEW 
    3   144 ACCEPT     tcp  --  *      *       192.168.101.0/24
0.0.0.0/0          tcp dpt:443 state NEW 
    3   180 ACCEPT     tcp  --  *      *       0.0.0.0/0
0.0.0.0/0          tcp dpt:22 state NEW 
    5   264 ACCEPT     tcp  --  *      *       0.0.0.0/0
0.0.0.0/0          tcp dpt:25 state NEW 

Chain FORWARD (policy DROP 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source
destination         

Chain OUTPUT (policy DROP 1 packets, 65 bytes)
 pkts bytes target     prot opt in     out     source
destination         
  178 29529 ACCEPT     all  --  *      *       0.0.0.0/0
0.0.0.0/0          state RELATED,ESTABLISHED 
    0     0 ACCEPT     tcp  --  *      *       0.0.0.0/0
0.0.0.0/0          tcp dpt:22 state NEW 
    1    60 ACCEPT     tcp  --  *      *       0.0.0.0/0
0.0.0.0/0          tcp dpt:25 state NEW 
    0     0 ACCEPT     tcp  --  *      *       0.0.0.0/0
0.0.0.0/0          tcp dpt:53 state NEW 
    3   213 ACCEPT     udp  --  *      *       0.0.0.0/0
0.0.0.0/0          udp dpt:53 state NEW 
    0     0 ACCEPT     tcp  --  *      *       0.0.0.0/0
0.0.0.0/0          tcp dpt:80 state NEW 
    0     0 ACCEPT     tcp  --  *      *       0.0.0.0/0
0.0.0.0/0          tcp dpt:443 state NEW 


Thanks,


/***************************************     .-"""-.
Michael Hurley                              '       \ 
Webmaster/SysAdmin                         |,.  ,-.  |
University of Connecticut School of Law    |()L( ()| |
mhurley@law.uconn.edu                      |,'  `".| |
(860) 570-5233                             |.___.',| `
***************************************/  .j `--"' `  `.
                                         / '        '   \
                                        / /          `   `.
                                       / /            `    .
                                      / /              l   |
                                     . ,               |   |
                                     ,"`.             .|   |
                                  _.'   ``.          | `..-'l
                                 |       `.`,        |      `.
                                 |         `.    __.j         )
                                 |__        |--""___|      ,-'
                                    `"--...,+""""   `._,.-' mh

