From: Eric Ellis <eellis@mail.co.gilchrist.fl.us>
Subject: [Fwd: Re: Can't interpret this log entry]
Date: Fri, 24 Sep 2004 17:22:22 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <4154900E.5000607@mail.co.gilchrist.fl.us>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------030107080406050408060809"
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
To: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.
--------------030107080406050408060809
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit


-- 
Eric Ellis
Gilchrist County Sheriff's Department
IT Coordinator
eellis@mail.co.gilchrist.fl.us
352-463-3181

--------------030107080406050408060809
Content-Type: message/rfc822;
 name="Re: Can't interpret this log entry"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="Re: Can't interpret this log entry"

Message-ID: <41548FEB.5040309@mail.co.gilchrist.fl.us>
Date: Fri, 24 Sep 2004 17:21:47 -0400
From: Eric Ellis <eellis@mail.co.gilchrist.fl.us>
User-Agent: Mozilla Thunderbird 0.7.3 (Windows/20040803)
X-Accept-Language: en-us, en
MIME-Version: 1.0
To: Jason Opperisano <opie@817west.com>
Subject: Re: Can't interpret this log entry
References: <415442FF.1060304@mail.co.gilchrist.fl.us>
	<1096044284.9581.79.camel@wolfpack.ljm.dom>
In-Reply-To: <1096044284.9581.79.camel@wolfpack.ljm.dom>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Jason Opperisano wrote:

> On Fri, 2004-09-24 at 11:53, Eric Ellis wrote:
> 
>>I'm slightly confused about this log entry that I'm seeing pop up in my 
>>syslog.
>>
>>The firewall is 200.21.1.254, on a private net.
>>
>>Sep 24 11:57:03 firewall kernel: IN=eth0 OUT= 
>>MAC=00:40:05:3d:51:e9:00:50:3e:ed:28:a0:08:00 SRC=200.175.75.101 DST=200.2
>>1.1.254 LEN=56 TOS=0x00 PREC=0x00 TTL=43 ID=10814 PROTO=ICMP TYPE=3 
>>CODE=3 [SRC=200.21.1.254 DST=200.175.75.101 LEN=48 T
>>OS=0x00 PREC=0x00 TTL=102 ID=2554 DF PROTO=TCP INCOMPLETE [8 bytes] ] 
>>
>>
>>it *almost* looks like my box is sending an ICMP query, and getting a 
>>"port closed" response.  The thing that bothers me about this is that I 
>>don't allow ICMP to talk on the box at all, so I shouldn't be sending 
>>ICMP, or if the machine tries to, I should be getting it logged, as I'm 
>>logging all of my drops.
>>
>>Confused.
> 
> 
> it appears as though your firewall (200.21.1.254) is receiving an ICMP
> port unreachable from 200.175.75.101 in response to a TCP packet it sent
> (or SNAT-ed for a machine behind it).

See, the problem is that ICMP doesn't talk on the box *any* direction. 
It all gets dropped.  I'm not seeing how my Firewall or anything on the 
private side is sending an ICMP request.  A dump of my IPTable rules is 
attached.

> there are those that would say that it's actually not a bad idea to
> allow ICMP errors (types 3, 11, 12) into/through your firewall.  YMMV.
> 
> icmp types/codes reference:
>         http://www.iana.org/assignments/icmp-parameters
>         
> -j
> 

root@firewall:~# iptables -vL 

Chain INPUT (policy DROP 1249 packets, 187K bytes) 

  pkts bytes target     prot opt in     out     source 
destination
23839 7716K ACCEPT     all  --  any    any     anywhere 
anywhere            state RELATED,ESTABLISHED
    60  3738 ACCEPT     all  --  lo     any     anywhere 
anywhere
     2    96 ACCEPT     tcp  --  any    any     anywhere 
anywhere            tcp dpt:ssh
     4   192 ACCEPT     tcp  --  any    any     anywhere 
anywhere            tcp dpt:socks
     0     0 ACCEPT     tcp  --  any    any     anywhere 
anywhere            tcp dpt:8000
   347 16656 ACCEPT     tcp  --  any    any     anywhere 
anywhere            tcp dpt:8080
     0     0 ACCEPT     tcp  --  eth1   any     anywhere 
anywhere            tcp dpt:domain
    64  3937 ACCEPT     udp  --  eth1   any     anywhere 
anywhere            udp dpt:domain
     4  1316 ACCEPT     udp  --  eth1   any     anywhere 
anywhere            udp dpt:bootps
25278 3676K DROP       udp  --  any    any     anywhere 
anywhere            udp dpts:loc-srv:netbios-ssn
     0     0 DROP       tcp  --  any    any     anywhere 
anywhere            tcp dpts:loc-srv:netbios-ssn
  5802 1965K DROP       udp  --  any    any     anywhere 
anywhere            udp dpt:router
  1249  187K LOG        all  --  any    any     anywhere 
anywhere            LOG level warning

Chain FORWARD (policy DROP 1398 packets, 77300 bytes) 

  pkts bytes target     prot opt in     out     source 
destination
1313K  979M ACCEPT     all  --  any    any     anywhere 
anywhere            state RELATED,ESTABLISHED
     0     0 ACCEPT     tcp  --  eth1   any     anywhere 
anywhere            tcp dpt:http
    90  4320 ACCEPT     tcp  --  eth1   any     anywhere 
anywhere            tcp dpt:https
     0     0 ACCEPT     tcp  --  eth1   any     anywhere 
anywhere            tcp dpt:ssh
     0     0 ACCEPT     tcp  --  eth1   any     anywhere 
anywhere            tcp dpt:ftp
     1    48 ACCEPT     tcp  --  eth1   any     anywhere 
anywhere            tcp dpt:smtp
     0     0 ACCEPT     tcp  --  eth1   any     anywhere 
anywhere            tcp dpt:pop3
     1    48 ACCEPT     tcp  --  eth1   any     anywhere 
anywhere            tcp dpt:imap
     0     0 ACCEPT     tcp  --  eth1   any     anywhere 
anywhere            tcp dpt:domain
    23  1439 ACCEPT     udp  --  eth1   any     anywhere 
anywhere            udp dpt:domain
     4   192 ACCEPT     tcp  --  eth1   any     anywhere 
anywhere            tcp dpt:5900
  5794  296K ACCEPT     tcp  --  eth1   any     anywhere 
anywhere            tcp dpts:6881:6889
    95  4560 ACCEPT     tcp  --  eth1   any     anywhere 
anywhere            tcp dpt:acmsoda
  1398 77300 LOG        all  --  any    any     anywhere 
anywhere            LOG level warning
 

Chain OUTPUT (policy DROP 0 packets, 0 bytes) 

  pkts bytes target     prot opt in     out     source 
destination
25955 8555K ACCEPT     all  --  any    any     anywhere 
anywhere            state RELATED,ESTABLISHED
    60  3738 ACCEPT     all  --  any    lo      anywhere 
anywhere
   395 25413 ACCEPT     tcp  --  any    any     anywhere 
anywhere            tcp dpt:http
     0     0 ACCEPT     tcp  --  any    any     anywhere 
anywhere            tcp dpt:ssh
     0     0 ACCEPT     tcp  --  any    any     anywhere 
anywhere            tcp dpt:domain
   400 28663 ACCEPT     udp  --  any    any     anywhere 
anywhere            udp dpt:domain
     0     0 ACCEPT     tcp  --  any    any     anywhere 
anywhere            tcp dpt:aol
     0     0 ACCEPT     tcp  --  any    any     anywhere 
anywhere            tcp dpt:mmcc
     2   120 ACCEPT     tcp  --  any    any     anywhere 
anywhere            tcp dpt:1863
     0     0 ACCEPT     udp  --  any    any     anywhere 
anywhere            udp dpt:1863
     0     0 ACCEPT     tcp  --  any    any     anywhere 
anywhere            tcp dpt:https
     0     0 ACCEPT     udp  --  any    eth1    anywhere 
anywhere            udp spt:bootps
     0     0 LOG        all  --  any    any     anywhere 
anywhere            LOG level warning
-- 
Eric Ellis
Gilchrist County Sheriff's Department
IT Coordinator
eellis@mail.co.gilchrist.fl.us
352-463-3181


--------------030107080406050408060809--

