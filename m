From: Denis Vlasenko <vda@port.imtp.ilyichevsk.odessa.ua>
Subject: DNAT to local address works for everybody except local processes
Date: Mon, 20 Oct 2003 16:05:08 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <6327300215.20031020160508@port.imtp.ilyichevsk.odessa.ua>
Reply-To: Denis Vlasenko <vda@port.imtp.ilyichevsk.odessa.ua>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: netfilter@lists.netfilter.org
Cc: Denis Vlasenko <vda@port.imtp.ilyichevsk.odessa.ua>

# uname -a
Linux Port 2.4.21 #2 Wed Jul 16 12:15:24 GMT-3 2003 i586 unknown

I want to setup a pair (or more) of failover servers.

# ip a l dev eth0
5: eth0: <BROADCAST,MULTICAST,UP> mtu 1500 qdisc pfifo_fast qlen 100
    link/ether 00:80:48:c4:4b:84 brd ff:ff:ff:ff:ff:ff
    inet 195.66.192.167/28 brd 195.66.192.175 scope global eth0
    inet 195.66.192.169/28 brd 195.66.192.175 scope global secondary eth0
    
195.66.192.167 is a 'well known' address. It is configured only
on one of the servers, the 'active' one. All servers, the active
one and all inactive ones, have another address, one per server.
In my case you can see it above, it's 195.66.192.169

Now, I make all network services listen either on 0.0.0.0 (all)
or on 195.66.192.169 on this particular server (this 'bind ip'
will be different for each server, of course).

On active server I configure well-known address to which clients
can connect (195.66.192.167) and redirect everything from it
to 169:

---NAT table-----
Chain PREROUTING (policy ACCEPT 4 packets, 193 bytes)
DNAT tcp -- * * 0.0.0.0/0 195.66.192.167 multiport dports 21,22,25,53,80 to:195.66.192.169
DNAT udp -- * * 0.0.0.0/0 195.66.192.167 multiport dports 53 to:195.66.192.169

This way, no service needs to be stopped or restarted when I switch
servers, because bind address never change. Also I can test inactive
servers by using their ips anytime while active server is in
production.

This works for any outside connections.

Unfortunately, connects from local processes on the server itself
are _not_ DNATed:

from server itself:
# nc -nv 195.66.192.167 25
(UNKNOWN) [195.66.192.167] 25 (?) : Connection refused

from any nearby box:
# nc -nv 195.66.192.167 25
(UNKNOWN) [195.66.192.167] 25 (?) open
220 0 mailfront ESMTP

Do I see a bug?
-- 
vda



