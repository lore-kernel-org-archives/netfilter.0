From: Colin Viebrock <colin@easydns.com>
Subject: Two ulogd (maybe?) problems
Date: Fri, 12 Dec 2003 18:58:16 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <10B939A3-2FDA-11D8-A2B7-000A957B8770@easydns.com>
Mime-Version: 1.0 (Apple Message framework v606)
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Resent-To: netfilter@lists.netfilter.org
Resent-Message-Id: <0DB6EAA4-2CFF-11D8-B7A3-000A957B8770@easydns.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

I'm using Shorewall (www.shorewall.net) on both of these servers.

1) I am getting entries like this in my log:

Dec  2 12:00:42 malakili Shorewall:net2fw:ACCEPT: IN=ppp0 OUT=
MAC=c0:29:c0:00:00:00:00:11:00:00:00:00:00:00:00:00:00:00:00:01:00:00:00
:00:00:00:00:30:18:00:00:00:00:00:00:01:15:00:00:30:18:00:00:00:00:00:00
:00:20:10:c1:00:20:10:c1:00:00:00:00:00:00:00:00:00:00:00:00:a8:40:7e:c1
:a8:40:7e:c1:00:00:00:00:80:45:00:00:3c:47:a9:40:00:38:06:63:da:42:cf:c7
:22:40:e7:4c:60:f7:14:03:78:92:08:9e:a8:00:00:00:00:a0:02:80:00:54:d0:00
:00:02:04:05:ac:01:03:03:00:01:01:08:0a:f2:a8:c1:1f:00:00:00:00:40:7e:c1
:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00
:00:00:00:00:00:00:00:00:00  SRC=66.207.199.34 DST=64.231.76.96 LEN=60
TOS=00 PREC=0x00 TTL=56 ID=18345 DF PROTO=TCP SPT=63252 DPT=888
SEQ=2450038440 ACK=0 WINDOW=32768 SYN URGP=0

What's with the huge MAC address?  This seems to have started when I 
switched to using ulogd (version 1.02).  Shorewall is version 1.4.7c 
(from Debian package), BTW.

The author of Shorewall says "That's clearly a bug (and not a Shorewall 
bug) -- I suggest searching the netfilter mailing list archives as I'm 
sure that I saw this problem mentioned there."

I searched and couldn't find anything, so does anyone know what's up?  
Someone suggested it might be a ppp issue?


2) On a different machine also running Shorewall 1.4.7c and ulogd 1.02 
from Debian, I sometimes get logs with what must be zero timestamps:

Dec 31 19:00:00 firewall Shorewall:fw2dmz:ACCEPT: IN= OUT=eth2 MAC= 
SRC=192.168.11.1 DST=192.168.11.10 LEN=60 TOS=00 PREC=0x00 TTL=64 
ID=5680 DF PROTO=TCP SPT=1036 DPT=22 SEQ=2745000454 ACK=0 WINDOW=5840 
SYN URGP=0

What would cause that?  It doesn't seem to happen consistently (i.e., 
tailing the log right now I see normal timestamps).

- Colin


