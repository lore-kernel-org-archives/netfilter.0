From: sean darcy <seandarcy2@gmail.com>
Subject: Re: does -p udp --dport 5060 not work with -j LOG?
Date: Thu, 01 May 2008 19:36:46 -0400
Message-ID: <fvdk6f$j6a$1@ger.gmane.org>
References: <fvarov$iq2$1@ger.gmane.org> <cc86d0010804302023n2b2dbbeu9b7c5f7d80a308cb@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <cc86d0010804302023n2b2dbbeu9b7c5f7d80a308cb@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Diego Lacerda wrote:
> Hi, Sean,
> 
> I used to put -j LOG on the end of my filter scripts to debug this
> king of problems, because all packets that didn't match with any rule
> will be logged (and then dropped, of course).
> Do you have any other rule in PREROUTING chain about the same IP address?
> 
> Could you please show the results of "iptables -L -n -v -t nat", and
> show what rules do you have in filter mathing the "SIP-BEFORE" target
> log (something like "iptables -L -n -v |grep SIP-BEFORE")?
> 
> I think that this king of information will help us to help you. :-)
> 
> Regards,
> Diego Lacerda.
> 

Thanks for the response.

There only one line in my script that uses SIP:

grep SIP firewall-masq
$IPT -t nat -A PREROUTING -i external -p udp  --dport 5060 -j LOG 
--log-prefix "SIP-BEFORE:  "

And it's run first:

sh -x firewall-masq
+ IPT=/sbin/iptables
+ /sbin/iptables -F
+ /sbin/iptables -X
+ /sbin/iptables -t nat -A PREROUTING -i external -p udp --dport 5060 -j 
LOG --log-prefix 'SIP-BEFORE:  '
...........


I don't really understand this output:

iptables -L -n -v -t nat | grep SIP
     2   262 LOG        udp  --  *      *       0.0.0.0/0 
0.0.0.0/0           udp dpt:5060 LOG flags 0 level 4 prefix `SIP-BEFORE:  '
  144K   24M LOG        udp  --  *      *       0.0.0.0/0 
0.0.0.0/0           LOG flags 0 level 4 prefix `SIP-BEFORE:  '
41816 5117K LOG        udp  --  external *       0.0.0.0/0 
0.0.0.0/0           LOG flags 0 level 4 prefix `SIP-BEFORE:  '
     0     0 LOG        udp  --  external *       0.0.0.0/0 
0.0.0.0/0           udp dpt:5060 LOG flags 0 level 4 prefix `SIP-BEFORE:  '
     0     0 LOG        udp  --  external *       0.0.0.0/0 
0.0.0.0/0           udp dpt:5060 LOG flags 0 level 4 prefix `SIP-BEFORE:  '
     0     0 LOG        udp  --  external *       0.0.0.0/0 
0.0.0.0/0           udp dpt:5060 LOG flags 0 level 4 prefix `SIP-BEFORE:  '
     0     0 LOG        udp  --  external *       0.0.0.0/0 
0.0.0.0/0           udp dpt:5060 LOG flags 0 level 4 prefix `SIP-BEFORE:  '
     0     0 LOG        udp  --  external *       0.0.0.0/0 
0.0.0.0/0           udp dpt:5060 LOG flags 0 level 4 prefix `SIP-BEFORE:  '
     0     0 LOG        udp  --  external *       0.0.0.0/0 
0.0.0.0/0           udp dpt:5060 LOG flags 0 level 4 prefix `SIP-BEFORE:  '
     0     0 LOG        udp  --  external *       0.0.0.0/0 
0.0.0.0/0           udp dpt:5060 LOG flags 0 level 4 prefix `SIP-BEFORE:  '
     0     0 LOG        udp  --  external *       0.0.0.0/0 
0.0.0.0/0           udp dpt:5060 LOG flags 0 level 4 prefix `SIP-BEFORE:  '
     0     0 LOG        udp  --  external *       0.0.0.0/0 
0.0.0.0/0           udp spt:5060 dpt:5060 LOG flags 0 level 4 prefix 
`SIP-BEFORE:  '
     0     0 LOG        udp  --  external *       0.0.0.0/0 
0.0.0.0/0           udp spt:5060 dpt:5060 LOG flags 0 level 4 prefix 
`SIP-BEFORE:  '
     0     0 LOG        udp  --  external *       0.0.0.0/0 
0.0.0.0/0           udp dpt:5060 LOG flags 0 level 4 prefix `SIP-BEFORE:  '
     0     0 LOG        udp  --  external *       0.0.0.0/0 
0.0.0.0/0           udp spt:5060 dpt:5060 LOG flags 0 level 4 prefix 
`SIP-BEFORE:  '
     0     0 LOG        udp  --  external *       0.0.0.0/0 
0.0.0.0/0           udp dpt:5060 LOG flags 0 level 4 prefix `SIP-BEFORE:  '
     0     0 LOG        udp  --  external *       0.0.0.0/0 
0.0.0.0/0           udp spt:5060 dpt:5060 LOG flags 0 level 4 prefix 
`SIP-BEFORE:  '
     0     0 LOG        udp  --  external *       0.0.0.0/0 
0.0.0.0/0           udp dpt:5060 LOG flags 0 level 4 prefix `SIP-BEFORE:  '
     0     0 LOG        udp  --  external *       0.0.0.0/0 
0.0.0.0/0           udp spt:5060 dpt:5060 LOG flags 0 level 4 prefix 
`SIP-BEFORE:  '
     0     0 LOG        udp  --  external *       0.0.0.0/0 
0.0.0.0/0           udp dpt:5060 LOG flags 0 level 4 prefix `SIP-BEFORE:  '
     0     0 LOG        udp  --  external *       0.0.0.0/0 
0.0.0.0/0           udp dpt:5060 LOG flags 0 level 4 prefix `SIP-BEFORE:
'

And I'm still logging stuff from the lan if, and all udp ports:

May  1 19:33:00 kernel: SIP-BEFORE:  IN=lan OUT= 
MAC=00:a0:24:54:28:cb:00:0d:56:6b:d7:11:08:00 SRC=10.10.1
0.138 DST=xxx.yyy.1.21 LEN=67 TOS=0x00 PREC=0x00 TTL=128 ID=32656 
PROTO=UDP SPT=1233 DPT=53 LEN=47
May  1 19:33:00 kernel: SIP-BEFORE:  IN=lan OUT= 
MAC=00:a0:24:54:28:cb:00:0d:56:6b:d7:11:08:00 SRC=10.10.1
0.138 DST=xxx.yyy.0.84 LEN=67 TOS=0x00 PREC=0x00 TTL=128 ID=32657 
PROTO=UDP SPT=1233 DPT=53 LEN=47
May  1 19:33:00 kernel: SIP-BEFORE:  IN=external OUT= 
MAC=00:48:54:8b:ab:29:00:1a:e2:84:bf:3b:08:00 SRC=xxx
.yyy.147.90 DST=xxx.yyy.167.178 LEN=126 TOS=0x04 PREC=0x00 TTL=113 
ID=11552 PROTO=UDP SPT=18956 DPT=32375 LEN=106

BTW, this Fedora 6, iptables-1.3.8

sean

