From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: port scan identification
Date: Wed, 09 Jun 2004 07:43:50 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1086781430.14426.5.camel@localhost>
References: <40C6D987.9050805@wanadoo.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40C6D987.9050805@wanadoo.fr>
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

On Wed, 2004-06-09 at 05:33, Rakotomandimby Mihamina wrote:
> Hello
> 
> I try to set correctly up my firewall ans would need your help on one
> thing :
> 
> I have this rule :
> [...]
> iptables -A INPUT -p tcp --tcp-flags SYN,ACK,FIN,RST RST \
> -j LOG --log-level debug --log-prefix 'p_scan_: '
> [...]
> 
> and i see this when i tail the output file :
> 
> [...]
> Jun  8 22:52:32 milina kernel: p_scan_: IN=ppp0 OUT= MAC=
> SRC=81.220.171.201 DST=81.248.95.56 LEN=40 TOS=0x00 PREC=0x00 TTL=54
> ID=45424 PROTO=TCP SPT=4391 DPT=80 WINDOW=0 RES=0x00 RST URGP=0
> [...]
> 
> Well . According to me, a port scan is the action to scan _all_ the
> ports ... why is the port scan identified as only scaning the 80th port
> ? I mean, a port scan should not be on one port only ... isn't it ?

It could be, as someone else has already pointed out, that they are only
interested in finding a web server.  But I believe there may be other
reasons.  I am not an expert in this but I believe some crackers will
use port 80 as a discovery technique if they feel ping may be blocked.  
In other words, before wasting their time finding all the ports on a
device, they want to know if the device is alive.  They could try a ping
but ping may be blocked so they will attempt to elicit some kind of
response on port 80.

Another reason may be that they are trying to use you to attack someone
else.  I believe the idle scan attempts to bounce a packet from a
predictable device to the real target and then examine the id numbers in
the next packet from you.  This is frequently done on port 80.

Some day, I'll fire up NMAP and trace all the possible packet patterns
it uses to port scan but, not today.  Hope this helps - John
-- 
John A. Sullivan III
Chief Technology Officer
Nexus Management
+1 207-985-7880
john.sullivan@nexusmgmt.com
---
If you are interested in helping to develop a GPL enterprise class
VPN/Firewall/Security device management console, please visit
http://iscs.sourceforge.net 


