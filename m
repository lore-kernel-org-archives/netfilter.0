From: Justin Schoeman <justin@expertron.co.za>
Subject: Connection tracking looses packets?
Date: Wed, 24 May 2006 15:25:35 +0200
Message-ID: <44745ECF.70702@expertron.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi all,

I am having problems with a firewall here.  The basic configuration 
works perfectly, but we have occasional problems with DNAT.  Long 
running sessions (we have found the problem on ftp, http, pop and smtp 
sessions) occasionally stall, and transfer no more data.  Looking at the 
firewall logs, I see:

INVALID NAT: IN=eth3 OUT= MAC=00:02:55:d6:eb:ae:00:11:bc:25:96:80:08:00 
SRC=196.x.x.x DST=10.50.18.22 LEN=52 TOS=0x00 PREC=0x00 TTL=117 ID=37995 
PROTO=TCP SPT=57952 DPT=80 WINDOW=65535 RES=0x00 ACK URGP=0

(This is logged by a -m state --state INVALID rule in the mangle table.) 
The packet is then not natted, but drops into the INPUT chain for the 
firewall itself, where it is dropped.

This seems to be the problem, as there are always one or more of these 
messages on a stalled connection.

Looking at /proc/net/ip_conntrack immediately after the above message is 
logged, I see:

tcp      6 295 ESTABLISHED src=196.x.x.x dst=10.50.18.22 sport=57952 
dport=80 packets=5 bytes=633 src=192.168.1.22 dst=196.x.x.x sport=80 
dport=57952 packets=12 bytes=13793 [ASSURED] mark=0 use=1

So the connection seems to be valid.

Any idea why this packet may be dropped, or are there other possible 
reasons why the connection may be stalling?

Googling reveals a significant number of people having problems with 
random stalls within a connection, but so far I have not seen a single 
answer to the problem.

Any help/advice will be greatly appreciated.

Thanks,

Justin

