From: Tim Cronin <tim@13-colonies.com>
Subject: iptables and linuxVirtualServer
Date: Wed, 2 Oct 2002 10:52:06 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <71FD63241A2DD511AFED00010236A4B33224B3@LIVAUDAIS>
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

I have a box I'm using as a gateway to a private network.
It does lvs_nat to expose http and ftp services.
eth0 is my external nic.
it's running rh 7.3 /w kernel 2.4.19
I've go the connection tracking modules loading.

I've posted this on the lvs mailing list and it was suggested 
I post here as well.

I'm having problems with the following
iptables -A INPUT -i eth0 -p tcp ! --syn -m state --state NEW -j DROP 
if this rule is set I'm unable to connect to my web server.

I added the following 

iptables -A INPUT -i eht0 -p tcp ! --syn \
-m state --state NEW \
-j LOG --log-prefix "IPTABLES SYN: "

and I get the following log

Oct  1 11:12:24 loadbalancer kernel: 
IPTABLES SYN: 
IN=eth0 OUT= 
MAC=00:80:ad:98:14:94:00:b0:d0:2c:96:16:08:00 
SRC=172.24.1.24 
DST=172.24.1.251 
LEN=411 TOS=0x00 PREC=0x00 TTL=128 ID=61175 DF 
PROTO=TCP 
SPT=1262 
DPT=80 
WINDOW=64240 RES=0x00 ACK PSH URGP=0

if I add the following before the rule above

iptables -A INPUT -i eth0 -p tcp ! --syn --dport http -m state --state NEW
-j ACCEPT

I can get access, but this seems to defeat the purpose.

I'm guessing that since the http requests are being handled by
lvs iptables doesn't track the state, but this is just a swag on my part.

any help would be appreciated.





