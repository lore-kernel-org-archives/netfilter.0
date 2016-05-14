From: Marcin Szewczyk <Marcin.Szewczyk@wodny.org>
Subject: No "unreachable" response for an outgoing TCP connection when using
 fwmark
Date: Sat, 14 May 2016 15:16:39 +0200
Message-ID: <20160514131639.GC3047@orkisz>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I would like to route locally-generated traffic:
- to a TCP port "A" of host "H" via the interface "A",
- to a TCP port "B" of host "H" via the interface "B".

Interface "B" is sometimes unavailable. Then I would like the kernel to
notify the user with "Network is unreachable" error if one tries to
connect to the TCP port "B".

I have tried the following settings (when the interface "B" is down):

# iptables -t mangle -nvL OUTPUT
Chain OUTPUT (policy ACCEPT 2 packets, 120 bytes)
 pkts bytes target     prot opt in     out     source               destination         
    2   120 MARK       all  --  *      *       0.0.0.0/0            host-H-ip         MARK set 0x64
(for simplicity the rule does not include ports yet)

# ip rule
0:      from all lookup local 
32765:  from all fwmark 0x64 lookup 200 
32766:  from all lookup main 
32767:  from all lookup default

# ip route show table 200
prohibit default

There are no surprises when the interface "B" is available and the 200
table contains a regular routing rule.

But when the interface "B" is not available I get satisfactory results
only for ICMP and UDP:

$ ping host-H-ip
PING host-H-ip (host-H-ip) 56(84) bytes of data.
ping: sendmsg: Network is unreachable

$ nc -nuv host-H-ip 5000
(UNKNOWN) [host-H-ip] 5000 (?) open
foo
too many output retries : Network is unreachable

For TCP it just hangs:
$ nc -nv host-H-ip 5000

I have found some threads that seem to be connected with the topic:
http://marc.info/?l=linux-netdev&m=136633466813095&w=2
http://www.spinics.net/lists/netdev/msg281954.html
http://netfilter-devel.vger.kernel.narkive.com/8ggjpr4G/netfilter-core-mangle-table-rules-are-not-taken-into-account-in-preliminary-routing-decision

Unfortunately, I still do not understand why I do not get "Network is
unreachable" for TCP as well. Could anybody explain it to me?

I have posted the following message to the netdev mailing list first but
I suppose that netfilter might be better because it is not
development-only.

Best regards,

-- 
Marcin Szewczyk
http://wodny.org
