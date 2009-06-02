From: =?us-ascii?Q?Xesc_Arbona?= <X.Arbona@topdesk.com>
Subject: Re: conntrack INVALID packets
Date: Tue, 2 Jun 2009 18:19:01 +0200
Message-ID: <vmime.4a2550f5.5fdc.8868102d67fdfa5b@mona.topdesk.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

> Olivier Sessink wrote:
>> Roman Ledovskiy wrote:
>> Hi,
>> 
>> I have linux firewall in between internet and my network, diagram is
>> following:
>> 
>> Upstream
>>    |
>> Firewall server
>>    |
>> my network
>>  
>> "My network" hosts many different email/web servers.
>> 
>> Firewall server is not a bridge, it has 2 interfaces (one to upstream, one
>> to internal network)
>> Not much kernel configuration, kernel is default kernel from Centos5 x64
>> repo: 2.6.18-8.1.10.el5
>> 
>> On this server I get quite a lot of INVALID packets, about 0.07% of all and
>> I can't figure out why..
>
> same thing here. most of the INVALID packets seem to have RST or FIN ACK
> set. So what I did, I increased the timeouts to setup a connection, and
> I increased the timeouts for connection closing. That helped a lot.
>

Hi,

I have a similar problem, but increasing the timeouts didn't help me. Our situation is:

We have several Windows backend webservers on an internal network, connected to a Debian machine (kernel 2.6.18.dfsg.1-24) which has a direct connection to Internet and acts as Reverse-Proxy. No traffic is forwarded, incoming requests are proxied to the backend servers. We use iptables 1.3.6.0debian1-5 and ferm as firewall on the same machine.

We have been experiencing timeouts between the proxy and the backend servers. I've looked at the firewall configuration, and several packets were dropped because itpables marks their state as INVALID. On the INPUT chain I've changed the rules:

  mod state state INVALID DROP;
  mod state state (ESTABLISHED RELATED) ACCEPT;

by

  mod state state INVALID goto DEBUG; 
  mod state state (ESTABLISHED RELATED) ACCEPT;

and created a DEBUG function that logs information about the packets. Most packets being marked as INVALID are RST, but also SYN-ACK, FIN-ACK and ACK. 

/proc/sys/net/ipv4/netfilter/ip_conntrack_count is 6177
/proc/sys/net/ipv4/netfilter/ip_conntrack_max is 32768

Jun  2 17:58:27 proxy003 kernel: TCP DEBUG: IN=eth0 OUT= MAC=00:0c:29:4a:b9:e8:00:0c:29:0e:d8:f8:08:00 SRC=10.231.0.55 DST=10.231.0.203 LEN=64 TOS=0x00 PREC=0x00 TTL=128 ID=27512 PROTO=TCP SPT=82 DPT=40508 WINDOW=64240 RES=0x00 ACK SYN URGP=0
Jun  2 17:58:31 proxy003 kernel: TCP DEBUG: IN=eth0 OUT= MAC=00:0c:29:4a:b9:e8:00:0c:29:0e:d8:f8:08:00 SRC=10.231.0.55 DST=10.231.0.203 LEN=64 TOS=0x00 PREC=0x00 TTL=128 ID=27893 PROTO=TCP SPT=82 DPT=40574 WINDOW=64240 RES=0x00 ACK SYN URGP=0
Jun  2 17:58:31 proxy003 kernel: TCP DEBUG: IN=eth0 OUT= MAC=00:0c:29:4a:b9:e8:00:0c:29:0e:d8:f8:08:00 SRC=10.231.0.55 DST=10.231.0.203 LEN=52 TOS=0x00 PREC=0x00 TTL=128 ID=27903 DF PROTO=TCP SPT=82 DPT=40574 WINDOW=63875 RES=0x00 ACK URGP=0
Jun  2 17:58:31 proxy003 kernel: TCP DEBUG: IN=eth0 OUT= MAC=00:0c:29:4a:b9:e8:00:0c:29:0e:d8:f8:08:00 SRC=10.231.0.55 DST=10.231.0.203 LEN=52 TOS=0x00 PREC=0x00 TTL=128 ID=27904 DF PROTO=TCP SPT=82 DPT=40574 WINDOW=63875 RES=0x00 ACK FIN URGP=0

* Does someone know what can be causing this? and how to solve it?

* When sending a SYN packet (via OUTPUT chain) to a backend server, shouldn't a connection appear as state NEW on /proc/net/ip_conntrack? And when a SYN-ACK comes from the backend server, shoudln't be marked as ESTABLISHED?

Thanks a lot!

--
Xesc

