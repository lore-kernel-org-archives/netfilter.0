From: Ed W <lists@wildgooses.com>
Subject: Re: High accuracy bandwidth accounting?
Date: Mon, 16 May 2011 15:35:25 +0100
Message-ID: <4DD1362D.6010107@wildgooses.com>
References: <4DC7F632.9020105@wildgooses.com>  <4DC8775D.1080007@wildgooses.com>  <1305365024.1921.475.camel@andybev-desktop>  <4DCE8540.4060909@wildgooses.com>  <1305390543.1921.705.camel@andybev-desktop>  <alpine.LNX.2.01.1105150032430.7873@obet.zrqbmnf.qr> <1305444212.1921.714.camel@andybev-desktop> <alpine.LNX.2.01.1105151103490.30189@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1105151103490.30189@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: Andrew Beverley <andy@andybev.com>, Netfilter <netfilter@vger.kernel.org>

On 15/05/2011 10:08, Jan Engelhardt wrote:
> On Sunday 2011-05-15 09:23, Andrew Beverley wrote:
> 
>> On Sun, 2011-05-15 at 00:33 +0200, Jan Engelhardt wrote:
>>> On Saturday 2011-05-14 18:29, Andrew Beverley wrote:
>>>
>>>> On Sat, 2011-05-14 at 14:36 +0100, Ed W wrote:
>>>>
>>>> Okay, I've played around with this myself using a similar scenario. It
>>>> looks to me like the packets *are* making it into the conntrack system.
>>>>
>>>> I tried setting a LOG target to match those packets with a ctstate of
>>>> RELATED:
>>>>
>>>> iptables -A INPUT -p ICMP -m conntrack --ctstate RELATED -j LOG
>>>>
>>>> And they were indeed logged. But there was no visibility of them using
>>>> the conntrack userspace program.
>>>
>>> Does `conntrack -L` show anything for you at all? 
>>
>> Yes, it shows the outgoing packets:
>>
>> udp      17 23 src=10.0.10.206 dst=212.110.185.119 sport=35259 dport=53
>> packets=3 bytes=168 [UNREPLIED] src=212.110.185.119 dst=10.0.10.206
>> sport=53 dport=35259 packets=0 bytes=0 mark=0 secmark=0 use=2
>>
>> But it doesn't show the "ICMP port unreachable" packets that are sent in
>> reply. The question is: should it show them?
> 
> conntrack -L shows pseudo/NFCT-style connections, not packets. As for 
> ICMP port unreachable, either its classification is
> - INVALID, in which case there is no CT to show
> - a reply, in which case it is part of the shown CT - and the event 
> monitor will show an UPDATE
> - RELATED, in which case a new CT is shown - and which may disappear 
> shortly after due to a short lifetime - the event monitor should show 
> NEW I think.
> 
> Monitor with conntrack -E for details.

Hi Jan, thanks for taking an interest in this.  Just to repeat the testing with 
my situation.  So to recap I'm using "dnsmasq" with two upstream dns resolvers 
defined.  For various reasons dnsmasq queries both of them simultaneously and 
keeps the answer from whichever responds first.  The second answer is met with a 
(presumably) kernel generated "unreachable" response since the UDP port has already 
been closed after the faster response is received


So my test is "nslookup www.yahoo.co.uk" and both tcpdump and conntrack -E dumps are
below:

    [NEW] udp      17 30 src=127.0.0.1 dst=127.0.0.1 sport=43972 dport=53 [UNREPLIED] src=127.0.0.1 dst=127.0.0.1 sport=53 dport=43972
    [NEW] udp      17 30 src=10.94.230.137 dst=8.8.4.4 sport=20110 dport=53 [UNREPLIED] src=8.8.4.4 dst=10.94.230.137 sport=53 dport=20110
    [NEW] udp      17 30 src=10.94.230.137 dst=8.8.8.8 sport=20110 dport=53 [UNREPLIED] src=8.8.8.8 dst=10.94.230.137 sport=53 dport=20110
 [UPDATE] udp      17 29 src=10.94.230.137 dst=8.8.4.4 sport=20110 dport=53 src=8.8.4.4 dst=10.94.230.137 sport=53 dport=20110
 [UPDATE] udp      17 29 src=127.0.0.1 dst=127.0.0.1 sport=43972 dport=53 src=127.0.0.1 dst=127.0.0.1 sport=53 dport=43972
    [NEW] udp      17 30 src=127.0.0.1 dst=127.0.0.1 sport=44866 dport=53 [UNREPLIED] src=127.0.0.1 dst=127.0.0.1 sport=53 dport=44866
 [UPDATE] udp      17 30 src=127.0.0.1 dst=127.0.0.1 sport=44866 dport=53 src=127.0.0.1 dst=127.0.0.1 sport=53 dport=44866
    [NEW] udp      17 30 src=127.0.0.1 dst=127.0.0.1 sport=33044 dport=53 [UNREPLIED] src=127.0.0.1 dst=127.0.0.1 sport=53 dport=33044
 [UPDATE] udp      17 30 src=127.0.0.1 dst=127.0.0.1 sport=33044 dport=53 src=127.0.0.1 dst=127.0.0.1 sport=53 dport=33044
    [NEW] udp      17 30 src=127.0.0.1 dst=127.0.0.1 sport=36565 dport=53 [UNREPLIED] src=127.0.0.1 dst=127.0.0.1 sport=53 dport=36565
 [UPDATE] udp      17 30 src=127.0.0.1 dst=127.0.0.1 sport=36565 dport=53 src=127.0.0.1 dst=127.0.0.1 sport=53 dport=36565
    [NEW] udp      17 30 src=127.0.0.1 dst=127.0.0.1 sport=45214 dport=53 [UNREPLIED] src=127.0.0.1 dst=127.0.0.1 sport=53 dport=45214
    [NEW] udp      17 30 src=10.94.230.137 dst=8.8.4.4 sport=32019 dport=53 [UNREPLIED] src=8.8.4.4 dst=10.94.230.137 sport=53 dport=32019
 [UPDATE] udp      17 29 src=10.94.230.137 dst=8.8.8.8 sport=20110 dport=53 src=8.8.8.8 dst=10.94.230.137 sport=53 dport=20110
 [UPDATE] udp      17 29 src=10.94.230.137 dst=8.8.4.4 sport=32019 dport=53 src=8.8.4.4 dst=10.94.230.137 sport=53 dport=32019
 [UPDATE] udp      17 29 src=127.0.0.1 dst=127.0.0.1 sport=45214 dport=53 src=127.0.0.1 dst=127.0.0.1 sport=53 dport=45214
    [NEW] udp      17 30 src=127.0.0.1 dst=127.0.0.1 sport=47713 dport=53 [UNREPLIED] src=127.0.0.1 dst=127.0.0.1 sport=53 dport=47713
 [UPDATE] udp      17 30 src=127.0.0.1 dst=127.0.0.1 sport=47713 dport=53 src=127.0.0.1 dst=127.0.0.1 sport=53 dport=47713
    [NEW] udp      17 30 src=127.0.0.1 dst=127.0.0.1 sport=37969 dport=53 [UNREPLIED] src=127.0.0.1 dst=127.0.0.1 sport=53 dport=37969
    [NEW] udp      17 30 src=10.94.230.137 dst=8.8.4.4 sport=43177 dport=53 [UNREPLIED] src=8.8.4.4 dst=10.94.230.137 sport=53 dport=43177
 [UPDATE] udp      17 29 src=10.94.230.137 dst=8.8.4.4 sport=43177 dport=53 src=8.8.4.4 dst=10.94.230.137 sport=53 dport=43177
 [UPDATE] udp      17 29 src=127.0.0.1 dst=127.0.0.1 sport=37969 dport=53 src=127.0.0.1 dst=127.0.0.1 sport=53 dport=37969
[DESTROY] udp      17 src=127.0.0.1 dst=127.0.0.1 sport=43972 dport=53 packets=1 bytes=61 src=127.0.0.1 dst=127.0.0.1 sport=53 dport=43972 packets=1 bytes=206
[DESTROY] udp      17 src=10.94.230.137 dst=8.8.4.4 sport=20110 dport=53 packets=1 bytes=61 src=8.8.4.4 dst=10.94.230.137 sport=53 dport=20110 packets=1 bytes=206
[DESTROY] udp      17 src=10.94.230.137 dst=8.8.8.8 sport=20110 dport=53 packets=1 bytes=61 src=8.8.8.8 dst=10.94.230.137 sport=53 dport=20110 packets=1 bytes=206
[DESTROY] udp      17 src=127.0.0.1 dst=127.0.0.1 sport=44866 dport=53 packets=1 bytes=58 src=127.0.0.1 dst=127.0.0.1 sport=53 dport=44866 packets=1 bytes=128
[DESTROY] udp      17 src=127.0.0.1 dst=127.0.0.1 sport=33044 dport=53 packets=1 bytes=65 src=127.0.0.1 dst=127.0.0.1 sport=53 dport=33044 packets=1 bytes=102
[DESTROY] udp      17 src=127.0.0.1 dst=127.0.0.1 sport=36565 dport=53 packets=1 bytes=69 src=127.0.0.1 dst=127.0.0.1 sport=53 dport=36565 packets=1 bytes=69
[DESTROY] udp      17 src=127.0.0.1 dst=127.0.0.1 sport=45214 dport=53 packets=1 bytes=61 src=127.0.0.1 dst=127.0.0.1 sport=53 dport=45214 packets=1 bytes=177
[DESTROY] udp      17 src=10.94.230.137 dst=8.8.4.4 sport=32019 dport=53 packets=1 bytes=61 src=8.8.4.4 dst=10.94.230.137 sport=53 dport=32019 packets=1 bytes=177
[DESTROY] udp      17 src=127.0.0.1 dst=127.0.0.1 sport=47713 dport=53 packets=1 bytes=73 src=127.0.0.1 dst=127.0.0.1 sport=53 dport=47713 packets=1 bytes=110
[DESTROY] udp      17 src=127.0.0.1 dst=127.0.0.1 sport=37969 dport=53 packets=1 bytes=73 src=127.0.0.1 dst=127.0.0.1 sport=53 dport=37969 packets=1 bytes=110
[DESTROY] udp      17 src=10.94.230.137 dst=8.8.4.4 sport=43177 dport=53 packets=1 bytes=73 src=8.8.4.4 dst=10.94.230.137 sport=53 dport=43177 packets=1 bytes=110


10:49:53.325930 IP 10.94.230.137.20110 > 8.8.4.4.domain: 50338+ AAAA? www.yahoo.co.uk. (33)
10:49:53.327794 IP 10.94.230.137.20110 > 8.8.8.8.domain: 50338+ AAAA? www.yahoo.co.uk. (33)
10:49:53.996918 IP 8.8.4.4.domain > 10.94.230.137.20110: 50338 3/1/0 CNAME rc.yahoo.com., CNAME rc.g01.yahoodns.net., CNAME any-rc.a01.yahoodns.net. (178)
10:49:54.004573 IP 10.94.230.137.32019 > 8.8.4.4.domain: 33843+ A? www.yahoo.co.uk. (33)
10:49:54.126735 IP 8.8.8.8.domain > 10.94.230.137.20110: 50338 3/1/0 CNAME rc.yahoo.com., CNAME rc.g01.yahoodns.net., CNAME any-rc.a01.yahoodns.net. (178)
10:49:54.126855 IP 10.94.230.137 > 8.8.8.8: ICMP 10.94.230.137 udp port 20110 unreachable, length 214
10:49:54.340595 IP 8.8.4.4.domain > 10.94.230.137.32019: 33843 5/0/0 CNAME rc.yahoo.com., CNAME rc.g01.yahoodns.net., CNAME any-rc.a01.yahoodns.net., A 87.248.120.148, A 77.238.178.122 (149)
10:49:54.345321 IP 10.94.230.137.43177 > 8.8.4.4.domain: 34962+ PTR? 122.178.238.77.in-addr.arpa. (45)
10:49:55.030067 IP 8.8.4.4.domain > 10.94.230.137.43177: 34962 1/0/0 PTR w2.rc.vip.ird.yahoo.com. (82)



For ease of reading, here are the conntrack connections relating to 10.94.230.137:

    [NEW] udp      17 30 src=10.94.230.137 dst=8.8.4.4 sport=20110 dport=53 [UNREPLIED] src=8.8.4.4 dst=10.94.230.137 sport=53 dport=20110
    [NEW] udp      17 30 src=10.94.230.137 dst=8.8.8.8 sport=20110 dport=53 [UNREPLIED] src=8.8.8.8 dst=10.94.230.137 sport=53 dport=20110
 [UPDATE] udp      17 29 src=10.94.230.137 dst=8.8.4.4 sport=20110 dport=53 src=8.8.4.4 dst=10.94.230.137 sport=53 dport=20110
    [NEW] udp      17 30 src=10.94.230.137 dst=8.8.4.4 sport=32019 dport=53 [UNREPLIED] src=8.8.4.4 dst=10.94.230.137 sport=53 dport=32019
 [UPDATE] udp      17 29 src=10.94.230.137 dst=8.8.8.8 sport=20110 dport=53 src=8.8.8.8 dst=10.94.230.137 sport=53 dport=20110
 [UPDATE] udp      17 29 src=10.94.230.137 dst=8.8.4.4 sport=32019 dport=53 src=8.8.4.4 dst=10.94.230.137 sport=53 dport=32019
    [NEW] udp      17 30 src=10.94.230.137 dst=8.8.4.4 sport=43177 dport=53 [UNREPLIED] src=8.8.4.4 dst=10.94.230.137 sport=53 dport=43177
 [UPDATE] udp      17 29 src=10.94.230.137 dst=8.8.4.4 sport=43177 dport=53 src=8.8.4.4 dst=10.94.230.137 sport=53 dport=43177
[DESTROY] udp      17 src=10.94.230.137 dst=8.8.4.4 sport=20110 dport=53 packets=1 bytes=61 src=8.8.4.4 dst=10.94.230.137 sport=53 dport=20110 packets=1 bytes=206
[DESTROY] udp      17 src=10.94.230.137 dst=8.8.8.8 sport=20110 dport=53 packets=1 bytes=61 src=8.8.8.8 dst=10.94.230.137 sport=53 dport=20110 packets=1 bytes=206
[DESTROY] udp      17 src=10.94.230.137 dst=8.8.4.4 sport=32019 dport=53 packets=1 bytes=61 src=8.8.4.4 dst=10.94.230.137 sport=53 dport=32019 packets=1 bytes=177
[DESTROY] udp      17 src=10.94.230.137 dst=8.8.4.4 sport=43177 dport=53 packets=1 bytes=73 src=8.8.4.4 dst=10.94.230.137 sport=53 dport=43177 packets=1 bytes=110


However, I don't see this packet accounted in that list above:
10:49:54.126855 IP 10.94.230.137 > 8.8.8.8: ICMP 10.94.230.137 udp port 20110 unreachable, length 214



This feels to me like a packet which has fallen between two situations. It's not a new connection so it didn't get logged as such.  It's also kind of not obviously part of the existing connection so it doesn't get logged as such either? (but I think most use cases would prefer that it shows as part of the now closed connection?)

Grateful for any insight?

Ed W
