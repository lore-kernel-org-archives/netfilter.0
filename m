From: Helge Weissig <helgew@grajagan.org>
Subject: Re: protocol 50 unreachable
Date: Fri, 3 Dec 2004 09:11:27 -0800 (PST)
Message-ID: <Pine.LNX.4.44.0412030908140.29374-100000@gollum.grajagan.net>
References: <41B0094F.2010602@snapgear.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41B0094F.2010602@snapgear.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

ahhh... finally I see something... but what does it mean??? 

added the following two log rules:
$IPTABLES -A PREROUTING -t mangle -j LOG --log-level info --log-prefix 'all mangle preroute: '
$IPTABLES -A PREROUTING -t mangle -m conntrack --ctstate INVALID -j LOG --log-level info --log-prefix 'contrack mangle preroute: '

the second generates the following error:
iptables v1.2.6a: Couldn't load match `conntrack':/lib/iptables/libipt_conntrack.so: cannot open shared object file: No such file or directory

the ESP's however now show up in the log (these are nmap generated):
Dec  3 09:07:23 gollum kernel: all mangle preroute: IN=eth0 OUT= MAC=00:90:27:ca:39:56:00:10:67:00:b4:3e:08:00 SRC=vpn.server.ip DST=ext.if.ip LEN=20 TOS=0x00 PREC=0x00 TTL=32 ID=56785 PROTO=ESP INCOMPLETE [0 bytes] 
Dec  3 09:07:23 gollum kernel: all mangle preroute: IN=eth0 OUT= MAC=00:90:27:ca:39:56:00:10:67:00:b4:3e:08:00 SRC=vpn.server.ip DST=ext.if.ip LEN=20 TOS=0x00 PREC=0x00 TTL=32 ID=7732 PROTO=ESP INCOMPLETE [0 bytes] 

h.

On Fri, 3 Dec 2004 at 16:35 +1000, Philip Craig wrote:

PC> Helge Weissig wrote:
PC> > I mean with "incomplete" that the tcpdump traffic I see does not show up 
PC> > in the logs. I used your rules at the end of your reply and see the same 
PC> > thing: ESP from VPN_SERVER hits $EXTIF, triggers the "protocol 50 
PC> > unreachable" icmp response and no log entry ever shows up in the kernel 
PC> > log from the iptables log rule. I am suspecting that your option 3) is 
PC> > indeed the problem.
PC> > 
PC> > h.
PC> 
PC> It is possible that a conntrack already exists, or the packet can't be
PC> conntracked, so the packet doesn't pass through nat PREROUTING.
PC> 
PC> Try putting the log rule in the mangle PREROUTING chain.
PC> If they do match a log rule here, check if they are invalid
PC> with -m conntrack --ctstate INVALID.
PC> 
PC> Also check if there are any esp conntracks in /proc/net/ip_conntrack
PC> 
PC> 


