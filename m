From: Valentijn Sessink <valentyn+netfilter-users@nospam.openoffice.nl>
Subject: strange TCP RST packets
Date: Fri, 4 Jul 2003 12:49:28 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030704104928.GB2738@openoffice.nl>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

Hello list,

I sent the message below to the linux-net mailinglist, someone pointed at
http://mailman.ds9a.nl/pipermail/lartc/2003q3/009189.html.

As you can see below, I have a totally different setup, but I encounter
strange RST packets coming from alien ports as well. Please note that I
don't have any REJECT lines in my config, I don't do DNAT on this machine
and generally I only ACCEPT tcp/80, tcp/443 and icmp, DROP everything else.
Firewall script available on request - it's really simple, nothing special.

Michael, could you please check for me if these alien ports have a real life
cousin in your server somewhere? I'll explain: my web server does a lot of
connections to the loopback interface, things like lo:9000 - lo:39821. I
suspect some sort of connection mixing somewhere sometime, where the source
port from some "related" (I'm not even sure if that means anything in
computer land) connection on the loopback interface is used as source port
for the external RST. As your problem seems reproducable, maybe you can
confirm that a spurious RST from - let's say - port 12345 has an accompanying
connection on the 'lo' interface.

Also, Michael, is your machine UP or SMP?

List readers: I'm still not confident that these RST's really are generated
by the kernel, i.e. that an application cannot generate these RST's (except
when using raw sockets, of course), so if someone could confirm this, that
would really help as then it would be a kernel and/or netfilter issue, not
some silly IMBHttp-fault.

Best regards,

Valentijn

----- Forwarded message to linux-net@vger.kernel.org -----
Hello list,

I recently saw strange TCP packets with the "RST" bit set in the firewall
log of our web server. The web server accepts all ICMP, accepts incoming
TCP to port 80 and 443, and outgoing from 80 and 443, and basically drops
everything else. It logs outgoing traffic from non-http[s] ports. The web
server's IP address is 192.168.193.2, as it is behind a port forwarding
Cisco PIX.

Now the log (dst-IP and time stamps changed, the rest is for real)

Jun 21 13:32:16 www kernel: IN= OUT=eth1 SRC=192.168.193.2
DST=142.123.43.59   LEN=40 TOS=0x00 PREC=0x00 TTL=64 ID=5365  PROTO=TCP
SPT=39821 DPT=1041  WINDOW=7504 RES=0x00 ACK RST URGP=0
Jun 22 06:31:07 www kernel: IN= OUT=eth1 SRC=192.168.193.2
DST=184.111.49.2    LEN=40 TOS=0x00 PREC=0x00 TTL=64 ID=22616 PROTO=TCP
SPT=40865 DPT=28013 WINDOW=6432 RES=0x00 ACK RST URGP=0
... and does this a couple of times more.

I can't think of a reason why the Linux kernel would try to output a packet
with SPT=39821 and DPT=1041, as this source port is DROPPED totally. As we
grew suspicious, we started to log traffic to/from this web server and saw
things like: [time] 142.123.43.59.1041 > 192.168.193.2.https: R

... showing the exact source port number that the RST packets were directed
to. This reset from the client with the same source port seems always the
case when this spurious RST occurs.
This, unfortunately, still doesn't explain the high source port number
the Linux kernel shows in the logs.

I'm starting to think I'm stupid or I oversee something really simple, as I
can't think of a way a RST packet tries to find a way out of a port that has
no way in.

So, my questions: 
Is this sending of RST's a kernel thing?
Is there a valid way Websphere could "send" such packets?
Or am I just being stupid (in this case only, please ;-) ?

Finally some info: Linux 2.4.18 with LIDS (www.lids.org) patch, compiled
with GCC 2.95.4 20011002 (Debian Prerelease); HP 2000r SMP
machine, Debian GNU/Linux distribution, IBM Websphere 3.5-something.

(Oh, BTW, full disclosure: yes, there is a second network interface. This
one is internal, and only connects to two very small subnets with private IP
space. The first thing I suspected was spurious fake packets on the inside.
We did analyse the traffic on this subnet, but could not find a single trace
of any of the mentioned IP addresses, so I don't think this is alien source
traffic from the inside).

Please reply to my e-mail-address as well (it works, the nospam has an MX
record), as I'm not on the linux-net list.

Best regards,

Valentijn
----- End forwarded message -----

-- 
http://www.openoffice.nl/   Open Office - Linux Office Solutions
Valentijn Sessink  valentyn+sessink@nospam.openoffice.nl

