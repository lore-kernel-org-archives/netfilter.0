From: Pekka Savola <pekkas@netcore.fi>
Subject: RFE: ability to show the current state tables?
Date: Sun, 3 Nov 2002 12:37:00 +0200 (EET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0211031228460.27222-100000@netcore.fi>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hello,

I've been looking for a way to check the current netfilter '-m state' 
tables.  This should be invaluable in debugging.  I couldn't find any way 
to do it.  I think this could be important.

For examples how some other similar products do it:

--8<--
# ipfstat -t
                                     gap.netcore.fi - IP Filter: v3.4.29 - state top                                     12:31:12

Src = 0.0.0.0  Dest = 0.0.0.0  Proto = any  Sorted by = # bytes

Source IP             Destination IP         ST   PR   #pkts    #bytes       ttl
192.168.1.1,4079      193.94.160.1,22       4/4  tcp  274525  37405000 119:58:47
192.168.1.1,1964      130.233.228.10,22     4/4  tcp   64039  19456212 119:49:34
192.168.1.1,1966      193.94.160.1,22       4/4  tcp  115323  14616232  10:14:23
212.54.28.145,1178    130.233.195.9,6667    4/4  tcp   73391   6933486 119:59:55
192.168.1.1,2933      209.120.136.194,22    4/4  tcp    2873    314930 119:51:12
192.168.1.1,3690      194.252.88.100,80     4/0  tcp       1       411 119:08:44
192.168.1.1,3702      194.252.88.100,80     4/0  tcp       1       408 119:08:44
192.168.1.1,3700      194.252.88.100,80     4/0  tcp       1       397 119:08:44
212.54.28.145,123     193.166.5.177,123     0/0  udp       2       152      0:09
--8<--

Or:
--8<--
# ipfstat -sl
192.168.1.1 -> 209.120.136.194 ttl 862777 pass 0x5006 pr 6 state 4/4
        pkts 2873 bytes 314930  2933 -> 22 5f7bc8c9:b86d3358 17520<<0:58400<<0
        pass out quick keep state       IPv4
        pkt_flags & 2(b2) = b,          pkt_options & ffffffff = 0
        pkt_security & ffff = 0, pkt_auth & ffff = 0
        interfaces: in rl0,fxp0 out fxp0,rl0
212.54.28.145 -> 130.233.195.9 ttl 863995 pass 0x5006 pr 6 state 4/4
        pkts 73418 bytes 6936045        1178 -> 6667 aa95c4e1:ec35bf7d 58400<<0:17520<<0
        pass out quick keep state       IPv4
        pkt_flags & 2(b2) = b,          pkt_options & ffffffff = 0
        pkt_security & ffff = 0, pkt_auth & ffff = 0
        interfaces: in -,fxp0 out fxp0,-
[...]
--8<--


-- 
Pekka Savola                 "Tell me of difficulties surmounted,
Netcore Oy                   not those you stumble over and fall"
Systems. Networks. Security.  -- Robert Jordan: A Crown of Swords


