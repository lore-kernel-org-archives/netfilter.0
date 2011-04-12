From: Tony Rogers <tony.rogers@erudine.com>
Subject: Re: iptables - external IP address on internal interface?
Date: Tue, 12 Apr 2011 22:37:30 +0100
Message-ID: <4DA4C61A.4070308@erudine.com>
References: <054F5B1BB94BD943B243C3B39B4F568D016E42CE@victory.Erudine.local> <1302544375.1551.11.camel@andybev> <054F5B1BB94BD943B243C3B39B4F568D016E42F1@victory.Erudine.local> <1302626146.4938.1.camel@andybev-desktop> <054F5B1BB94BD943B243C3B39B4F568D0161B8F7@victory.Erudine.local> <1302636161.4938.5.camel@andybev-desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1302636161.4938.5.camel@andybev-desktop>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Andrew Beverley <andy@andybev.com>
Cc: netfilter@vger.kernel.org

On 12/04/2011 20:22, Andrew Beverley wrote:
> On Tue, 2011-04-12 at 20:12 +0100, Tony Rogers wrote:
>>
>>
>> -----Original Message-----
>> From: Andrew Beverley [mailto:andy@andybev.com]
>> Sent: 12 April 2011 17:36
>> To: Tony Rogers
>> Subject: RE: iptables - external IP address on internal interface?
>>
>> On Tue, 2011-04-12 at 10:20 +0100, Tony Rogers wrote:
>>> As requested - output of "iptables -nL"
>>>
>>
>> Any chance that you can re-post that without the line wrapping please?
>> It's almost impossible to read. A bottom-post would be nice as well :-)
>>
>> Thanks,
>>
>> Andy
>>
>>
>> Hi Andy,
>>
>> Let me try this again then!
>
> Hmmm, still a mess I'm afraid, I think you should try a different email
> client that is list friendly...
>
>>   (only replying to you directly rather than
>> the entire list this time)
>>
>
> However, having skimmed through the rules, I cannot see any NAT targets
> in there? If so, the behaviour you are seeing is to be expected.
>
> I'll reply the same to the list.
>
> Andy
>
>
>
> ------------------------
> This email was scanned by BitDefender.


Ok, trying with Thunderbird this time... (and it too seems to be 
wrapping the text) <sigh>

*** NAT rules ***

Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination
DNAT       udp  --  0.0.0.0/0            <EXT_IP>        udp dpt:5060 
to:192.168.0.2:5060
DNAT       udp  --  0.0.0.0/0            <EXT_IP>        udp 
dpts:1024:65535 to:192.168.0.2:1024-65535
DNAT       tcp  --  0.0.0.0/0            <EXT_IP>        tcp dpt:80 
to:192.168.0.2:80
DNAT       tcp  --  0.0.0.0/0            <EXT_IP>        tcp dpt:22 
to:192.168.0.2:22
DNAT       tcp  --  0.0.0.0/0            <EXT_IP>        tcp dpt:20 
to:192.168.0.2:20
DNAT       tcp  --  0.0.0.0/0            <EXT_IP>        tcp dpt:21 
to:192.168.0.2:21

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination
REDNAT     all  --  0.0.0.0/0            0.0.0.0/0
SNAT       all  --  0.0.0.0/0            0.0.0.0/0           MARK match 
0x1 to:192.168.0.1

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination

Chain REDNAT (1 references)
target     prot opt source               destination
MASQUERADE  all  --  0.0.0.0/0            0.0.0.0/0


*** output of iptables -nL ***


Chain INPUT (policy DROP)
target     prot opt source               destination
DROP       tcp  --  0.0.0.0/0            0.0.0.0/0           tcp 
dpts:1026:1028
DROP       udp  --  0.0.0.0/0            0.0.0.0/0           udp 
dpts:1026:1028
DROP       udp  --  0.0.0.0/0            0.0.0.0/0           udp dpt:67
DROP       udp  --  0.0.0.0/0            0.0.0.0/0           udp dpt:68
BADTCP     all  --  0.0.0.0/0            0.0.0.0/0
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0           state 
RELATED,ESTABLISHED
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0           state NEW
DROP       all  --  127.0.0.0/8          0.0.0.0/0           state NEW
DROP       all  --  0.0.0.0/0            127.0.0.0/8         state NEW
ACCEPT    !icmp --  0.0.0.0/0            0.0.0.0/0           state NEW
XTACCESS   all  --  0.0.0.0/0            0.0.0.0/0           state NEW
ACCEPT     icmp --  0.0.0.0/0            0.0.0.0/0           icmp type 0
ACCEPT     icmp --  0.0.0.0/0            0.0.0.0/0           icmp type 3
ACCEPT     icmp --  0.0.0.0/0            0.0.0.0/0           icmp type 5
ACCEPT     icmp --  0.0.0.0/0            0.0.0.0/0           icmp type 11
ACCEPT     icmp --  0.0.0.0/0            0.0.0.0/0           icmp type 8 
limit: avg 1/sec burst 5
LOG        all  --  0.0.0.0/0            0.0.0.0/0           limit: avg 
10/min burst 5 LOG flags 0 level 4 prefix `INPUT '
ACCEPT     udp  --  0.0.0.0/0            224.0.0.0/4
ACCEPT     2    --  0.0.0.0/0            224.0.0.0/4
DROP       all  --  0.0.0.0/0            224.0.0.0/4
DROP       all  --  224.0.0.0/4          0.0.0.0/0
DROP       all  --  240.0.0.0/4          0.0.0.0/0

Chain FORWARD (policy DROP)
target     prot opt source               destination
BADTCP     all  --  0.0.0.0/0            0.0.0.0/0
TCPMSS     tcp  --  0.0.0.0/0            0.0.0.0/0           tcp 
flags:0x06/0x02 TCPMSS clamp to PMTU
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0           state 
RELATED,ESTABLISHED
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0           state NEW
DROP       all  --  127.0.0.0/8          0.0.0.0/0           state NEW
DROP       all  --  0.0.0.0/0            127.0.0.0/8         state NEW
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0           state NEW
PORTFWACCESS  all  --  0.0.0.0/0            0.0.0.0/0           state NEW
LOG        all  --  0.0.0.0/0            0.0.0.0/0           limit: avg 
10/min burst 5 LOG flags 0 level 4 prefix `OUTPUT '
ACCEPT     udp  --  <ACCESS_IP_7>         192.168.0.2         udp dpt:5060
ACCEPT     udp  --  <ACCESS_IP_7>         192.168.0.2         udp 
dpts:1024:65535
ACCEPT     tcp  --  <ACCESS_NET>/28       192.168.0.2         tcp dpt:80
ACCEPT     tcp  --  <ACCESS_IP_3>         192.168.0.2         tcp dpt:80
ACCEPT     tcp  --  <ACCESS_IP_4>         192.168.0.2         tcp dpt:80
ACCEPT     tcp  --  <ACCESS_IP_3>         192.168.0.2         tcp dpt:22
ACCEPT     tcp  --  <ACCESS_NET>/28       192.168.0.2         tcp dpt:22
ACCEPT     tcp  --  <ACCESS_IP_4>         192.168.0.2         tcp dpt:22
ACCEPT     tcp  --  <ACCESS_IP_4>         192.168.0.2         tcp dpt:20
ACCEPT     tcp  --  <ACCESS_IP_4>         192.168.0.2         tcp dpt:21

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination

Chain BADTCP (2 references)
target     prot opt source               destination
PSCAN      tcp  --  0.0.0.0/0            0.0.0.0/0           tcp 
flags:0x3F/0x29
PSCAN      tcp  --  0.0.0.0/0            0.0.0.0/0           tcp 
flags:0x3F/0x00
PSCAN      tcp  --  0.0.0.0/0            0.0.0.0/0           tcp 
flags:0x3F/0x01
PSCAN      tcp  --  0.0.0.0/0            0.0.0.0/0           tcp 
flags:0x06/0x06
PSCAN      tcp  --  0.0.0.0/0            0.0.0.0/0           tcp 
flags:0x03/0x03
NEWNOTSYN  tcp  --  0.0.0.0/0            0.0.0.0/0           tcp 
flags:!0x17/0x02 state NEW

Chain LOG_DROP (0 references)
target     prot opt source               destination
LOG        all  --  0.0.0.0/0            0.0.0.0/0           limit: avg 
10/min burst 5 LOG flags 0 level 4
DROP       all  --  0.0.0.0/0            0.0.0.0/0

Chain LOG_REJECT (0 references)
target     prot opt source               destination
LOG        all  --  0.0.0.0/0            0.0.0.0/0           limit: avg 
10/min burst 5 LOG flags 0 level 4
REJECT     all  --  0.0.0.0/0            0.0.0.0/0           reject-with 
icmp-port-unreachable

Chain NEWNOTSYN (1 references)
target     prot opt source               destination
LOG        all  --  0.0.0.0/0            0.0.0.0/0           limit: avg 
10/min burst 5 LOG flags 0 level 4 prefix `NEW not SYN? '
DROP       all  --  0.0.0.0/0            0.0.0.0/0

Chain PORTFWACCESS (1 references)
target     prot opt source               destination

Chain PSCAN (5 references)
target     prot opt source               destination
LOG        tcp  --  0.0.0.0/0            0.0.0.0/0           limit: avg 
10/min burst 5 LOG flags 0 level 4 prefix `TCP Scan? '
LOG        udp  --  0.0.0.0/0            0.0.0.0/0           limit: avg 
10/min burst 5 LOG flags 0 level 4 prefix `UDP Scan? '
LOG        icmp --  0.0.0.0/0            0.0.0.0/0           limit: avg 
10/min burst 5 LOG flags 0 level 4 prefix `ICMP Scan? '
LOG        all  -f  0.0.0.0/0            0.0.0.0/0           limit: avg 
10/min burst 5 LOG flags 0 level 4 prefix `FRAG Scan? '
DROP       all  --  0.0.0.0/0            0.0.0.0/0

Chain XTACCESS (1 references)
target     prot opt source               destination
ACCEPT     tcp  --  0.0.0.0/0            <EXT_IP>        tcp dpt:20 
state NEW
ACCEPT     tcp  --  0.0.0.0/0            <EXT_IP>        tcp dpt:21 
state NEW
ACCEPT     tcp  --  0.0.0.0/0            <EXT_IP>        tcp dpt:80 
state NEW
ACCEPT     tcp  --  <ACCESS_IP_5>       <EXT_IP>        tcp dpt:5000 
state NEW
ACCEPT     udp  --  <ACCESS_IP_7>         192.168.0.2         udp 
dpts:1024:65535
ACCEPT     udp  --  <ACCESS_IP_7>         192.168.0.2         udp dpt:5060
ACCEPT     tcp  --  <ACCESS_IP_3>         192.168.0.2         state NEW 
tcp dpt:22
ACCEPT     tcp  --  <ACCESS_IP_4>         192.168.0.2         state NEW 
tcp dpt:22
ACCEPT     tcp  --  <ACCESS_IP_3>         <EXT_IP>        state NEW tcp 
dpt:223
ACCEPT     tcp  --  <ACCESS_IP_1>         192.168.0.2         state NEW 
tcp dpt:22
ACCEPT     tcp  --  <ACCESS_IP_1>         <EXT_IP>        state NEW tcp 
dpt:81
ACCEPT     tcp  --  <ACCESS_IP_1>         <EXT_IP>        state NEW tcp 
dpt:223
ACCEPT     tcp  --  <ACCESS_IP_2>          <EXT_IP>        state NEW tcp 
dpt:22
ACCEPT     tcp  --  <ACCESS_IP_3>         <EXT_IP>        state NEW tcp 
dpt:10000
ACCEPT     tcp  --  <ACCESS_IP_1>         <EXT_IP>        state NEW tcp 
dpt:10000
ACCEPT     tcp  --  <ACCESS_IP_1>         <EXT_IP>        state NEW tcp 
dpt:5901
ACCEPT     tcp  --  <ACCESS_IP_3>         <EXT_IP>        state NEW tcp 
dpt:5901
ACCEPT     tcp  --  <ACCESS_IP_1>         <EXT_IP>        state NEW tcp 
dpt:5900
ACCEPT     tcp  --  <ACCESS_IP_3>         <EXT_IP>        state NEW tcp 
dpt:5900


