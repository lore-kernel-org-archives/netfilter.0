From: Enrique Huerta de la Fuente <ehuerta@ixer.mx>
Subject: Re: iptables udp 1195 MASQUERADE
Date: Tue, 14 Feb 2012 12:05:24 -0600 (CST)
Message-ID: <28509660.3204.1329242724424.JavaMail.root@ixer.mx>
References: <5260549.3200.1329242426858.JavaMail.root@ixer.mx>
Reply-To: ehuerta@ixer.mx
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <5260549.3200.1329242426858.JavaMail.root@ixer.mx>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: SamLT <sam@sltosis.org>
Cc: netfilter@vger.kernel.org, Andrew Beverley <andy@andybev.com>

>On Fri, Feb 10, 2012 at 08:05:47PM +0000, Andrew Beverley wrote:
>> On Fri, 2012-02-10 at 12:36 -0600, Enrique Huerta de la Fuente wrote:
>> > iptables -t nat -I POSTROUTING -o ppp0 -j MASQUERADE
>> >
>> > but it does not work.
>>
>> Are you *sure* it's not working?
>
>Sorry to jump in here, but, I agree with Enrique, could you show some
>tcpdump output or something?
>- Do the paquet go out from ppp0 without being MASQUERAD'ed?
>- Do they go out from an other interface?
- Does it look like they are being filtered? or REDIRECT'ed?
>>
>>
>> >
> > Any ideas?
>>
>> Upgrade maybe? As said previously, it's always worked for me.
>>
>> Andy


Hello Sam,

I doing a log target to check the rule in each of the OUTPUT hooks (raw, mangle and filter) and POSTROUTING hooks (mangle).


kernel: OUTPUT-22-RAW: IN= OUT=eth1 SRC=201.15.40.9 DST=189.189.5.2 LEN=52 TOS=0x10 PREC=0x00 TTL=64 ID=17619 DF PROTO=TCP SPT=47664 DPT=22 WINDOW=501 RES=0x00 ACK URGP=0
kernel: OUTPUT-1195-RAW: IN= OUT=eth1 SRC=201.15.40.9 DST=189.189.5.2 LEN=304 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=UDP SPT=1195 DPT=1195 LEN=284

kernel: OUTPUT-22-MANGLE: IN= OUT=eth1 SRC=201.15.40.9 DST=189.189.5.2 LEN=52 TOS=0x10 PREC=0x00 TTL=64 ID=18917 DF PROTO=TCP SPT=47664 DPT=22 WINDOW=501 RES=0x00 ACK URGP=0
kernel: OUTPUT-1195-MANGLE: IN= OUT=eth1 SRC=201.15.40.9 DST=189.189.5.2 LEN=416 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=UDP SPT=1195 DPT=1195 LEN=396

kernel: OUTPUT-22-FILTER: IN= OUT=eth1 SRC=201.15.40.9 DST=189.189.5.2 LEN=52 TOS=0x10 PREC=0x00 TTL=64 ID=19177 DF PROTO=TCP SPT=47664 DPT=22 WINDOW=501 RES=0x00 ACK URGP=0
kernel: OUTPUT-1195-FILTER: IN= OUT=eth1 SRC=201.15.40.9 DST=189.189.5.2 LEN=128 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=UDP SPT=1195 DPT=1195 LEN=108

kernel: POSTROUTING-22-MANGLE: IN= OUT=ppp0 SRC=201.15.40.9 DST=189.189.5.2 LEN=52 TOS=0x10 PREC=0x00 TTL=64 ID=19543 DF PROTO=TCP SPT=47664 DPT=22 WINDOW=501 RES=0x00 ACK URGP=0
kernel: POSTROUTING-1195-MANGLE: IN= OUT=ppp0 SRC=201.15.40.9 DST=189.189.5.2 LEN=160 TOS=0x00 PREC=0x00 TTL=64 ID=0 DF PROTO=UDP SPT=1195 DPT=1195 LEN=140


In the last log, the output interface is already changing, but did not change the source address, this happen in the  POSTROUTING hook (nat)

Apply the rule: "iptables -t nat -I POSTROUTING -o ppp0 -j MASQUERADE", this masks the port 22 (tcp) but not the 1195 (udp), because I can connect via ssh.

It seems the problem is that does not mask the port 1195 (udp).

This is my tcpdump outputs (tcpdump -i ppp0 -nn):

Before apply the MASQUERADE rule in port 22(does not work):
21:59:47.012159 IP 201.15.40.9.60489 > 189.189.5.2.22: S 1987636:1987636(0) win 5840 <mss 1460,sackOK,timestamp 2332493919 0,nop,wscale 7>
21:59:50.011828 IP 201.15.40.9.60489 > 189.189.5.2.22: S 1987636:1987636(0) win 5840 <mss 1460,sackOK,timestamp 2332496919 0,nop,wscale 7>
21:59:56.011638 IP 201.15.40.9.60489 > 189.189.5.2.22: S 1987636:1987636(0) win 5840 <mss 1460,sackOK,timestamp 2332502919 0,nop,wscale 7>

After apply the MASQUERADE rule (does work):
22:01:40.922449 IP 201.102.128.12.58860 > 189.189.5.2.22: S 125979932:125979932(0) win 5840 <mss 1460,sackOK,timestamp 2332607835 0,nop,wscale 7>
22:01:40.941429 IP 189.189.5.2.22 > 201.102.128.12.58860: S 3858527134:3858527134(0) ack 125979933 win 5760 <mss 1412,sackOK,timestamp 2327811813 2332607835,nop,wscale 7>
22:01:40.941461 IP 201.102.128.12.58860 > 189.189.5.2.22: . ack 1 win 46 <nop,nop,timestamp 2332607854 2327811813>
22:01:40.967119 IP 189.189.5.2.22 > 201.102.128.12.58860: P 1:21(20) ack 1 win 45 <nop,nop,timestamp 2327811835 2332607854>
22:01:40.967175 IP 201.102.128.12.58860 > 189.189.5.2.22: . ack 21 win 46 <nop,nop,timestamp 2332607879 2327811835>
22:01:40.967290 IP 201.102.128.12.58860 > 189.189.5.2.22: P 1:21(20) ack 21 win 46 <nop,nop,timestamp 2332607880 2327811835>
22:01:40.986909 IP 189.189.5.2.22 > 201.102.128.12.58860: . ack 21 win 45 <nop,nop,timestamp 2327811857 2332607880>
22:01:40.986932 IP 201.102.128.12.58860 > 189.189.5.2.22: P 21:733(712) ack 21 win 46 <nop,nop,timestamp 2332607899 2327811857>
22:01:41.000709 IP 189.189.5.2.22 > 201.102.128.12.58860: P 21:725(704) ack 21 win 45 <nop,nop,timestamp 2327811858 2332607880>
22:01:41.041005 IP 201.102.128.12.58860 > 189.189.5.2.22: . ack 725 win 57 <nop,nop,timestamp 2332607953 2327811858>

But, when apply or not the MASQUERADE rule in 1195(udp) port, nothing happens
In this point, I apply this rules:
iptables -t nat -I POSTROUTING -o ppp0 -j MASQUERADE
iptables -t nat -I POSTROUTING -m udp -p udp --dport 1195 -o ppp0 -j MASQUERADE
iptables -t nat -I POSTROUTING -d 189.189.5.2 -m udp -p udp --dport 1195 -o ppp0 -j SNAT --to 201.102.128.12:1195


22:30:54.885067 IP 201.15.40.9.1195 > 189.189.5.2.1195: UDP, length 100
22:30:55.277241 IP 201.15.40.9.1195 > 189.189.5.2.1195: UDP, length 324
22:30:55.539264 IP 201.15.40.9.1195 > 189.189.5.2.1195: UDP, length 276
22:30:55.547639 IP 201.15.40.9.1195 > 189.189.5.2.1195: UDP, length 388
22:30:55.619872 IP 201.15.40.9.1195 > 189.189.5.2.1195: UDP, length 324
22:30:55.723678 IP 189.189.5.2.1195 > 201.102.128.12.1195: UDP, length 100
22:30:55.745952 IP 201.15.40.9.1195 > 189.189.5.2.1195: UDP, length 100
22:30:55.993822 IP 201.15.40.9.1195 > 189.189.5.2.1195: UDP, length 1556
22:30:55.993842 IP 201.15.40.9 > 189.189.5.2: udp
22:30:55.993879 IP 201.15.40.9.1195 > 189.189.5.2.1195: UDP, length 1556
22:30:55.993896 IP 201.15.40.9 > 189.189.5.2: udp
22:30:55.993932 IP 201.15.40.9.1195 > 189.189.5.2.1195: UDP, length 1556
22:30:55.993947 IP 201.15.40.9 > 189.189.5.2: udp
22:30:55.993982 IP 201.15.40.9.1195 > 189.189.5.2.1195: UDP, length 1508
22:30:55.993988 IP 201.15.40.9 > 189.189.5.2: udp
22:30:56.344615 IP 189.189.5.2.1195 > 201.102.128.12.1195: UDP, length 100
22:30:56.366510 IP 201.15.40.9.1195 > 189.189.5.2.1195: UDP, length 100


# iptables -t nat -L -n
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination         
DNAT       tcp  --  0.0.0.0/0            174.133.237.209     


Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination         
MASQUERADE  all  --  0.0.0.0/0            0.0.0.0/0           
MASQUERADE  udp  --  0.0.0.0/0            0.0.0.0/0           udp dpt:1195 
SNAT       udp  --  0.0.0.0/0            189.189.5.2        udp dpt:1195 to:201.102.128.12:1195 
MASQUERADE  tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:22 

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination    



# iptables -t mangle -L -n
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination         
MARK       tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:110 MARK set 0x1 

Chain INPUT (policy ACCEPT)
target     prot opt source               destination         

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination         

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination         
MARK       udp  --  0.0.0.0/0            0.0.0.0/0           udp dpt:1195 MARK set 0x1 
MARK       tcp  --  0.0.0.0/0            0.0.0.0/0           tcp dpt:22 MARK set 0x1 

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination         


The problem is that the MASQUERADE rule does not work with UDP(1195).
    
Any idea?

E.Huerta
