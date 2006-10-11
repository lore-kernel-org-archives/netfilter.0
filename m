From: "Wilson, Richard E" <richard.wilson@eds.com>
Subject: Recurring ip_conntrack table overflow
Date: Wed, 11 Oct 2006 15:39:10 -0500
Message-ID: <F1B471B6CE5CFA458DFED6C7669D039706C21D3B@usplm234.amer.corp.eds.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

All,

I have a server that is frequently running out of slots in the
ip_conntrack table and have been trying to determine how best to handle
it.  The ip_contrack_max sysctl parm is set to 65536 already (this
server has 4GB of RAM) and the ip_conntrack slot count (determined by
"cat /proc/net/ip_conntrack | wc -l") is both growing and decreasing.
Apparently a "clean" disconnect frees a slot.

The server had to be rebooted this AM as the console was displaying a
series of messages:

ip_conntrack: table full, dropping packet

After some research, I'd like to find out what my options are:

1. Can the ip_contrack_max parm be set higher than 65536?  Is it
desirable (how much RAM does each slot take)?

2. I found a reference to a timeout value in Linuxquestions.org:=20

/proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_timeout_established

This appears to be the amount of time to keep an entry in the conntrack
table, and defaults to 6 days... This parm doesn't exist on my server
(running RH EL 3.2.3-54, kernel 2.4.21-47 and iptables 1.2.8)   What
would be involved in upgrading iptables to include this parm and would
decreasing it to 1 or 2 days address the issue?

3. I also found a reference to a "NOTRACK" target that appears to make
packets to which it applies not get put into the conntrack table.  Could
this be used to handle my loopback traffic?  I currently have an ACCEPT
rule for any traffic on the loopback (127.0.0.1) and out of 17,485
entries currently in my conntrack table, 6,216 have source and
destination of 127.0.0.1 -- getting these out of the table would really
help.  (I have verified that this is legitimate traffic for this server)

Where can I find more information out about the NOTRACK target and how
is it implemented (does NOTRACK DROP, REJECT or ACCEPT packets)?

Thanks in advance,


Richard Wilson
Richard dot wilson at eds dot com

