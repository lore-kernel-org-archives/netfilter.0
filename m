From: ml@proficuous.com
Subject: RE: PLEASE HELP with DNAT problem
Date: Thu, 30 Oct 2003 22:41:09 -0600 (CST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <2073.209.134.141.210.1067575269.squirrel@webmail.proficuous.com>
References: <09B04A55822EFF4DA48D2E0BB2941D4A28ACA3@wardrive.citadelcomputer.com.a
         u> 
     <1896.209.134.141.210.1067574478.squirrel@webmail.proficuous.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1896.209.134.141.210.1067574478.squirrel@webmail.proficuous.com>
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
Cc: George Vieira <georgev@citadelcomputer.com.au>

>
>> AARGH!! ASCI ART.. ;P he he... I have 15 networks in my head and I need
>> a
>> 1GB memory upgrade in my brain to fit more.. just 1 GB will do ;P
>>
>> I don't understand this part :
>
> I tried the ascii art, i really did..but UGHHHH..
>
> let me try to explain it more clearly, and also, the  "it hits another
> one" was just my interpretation...it surely could be wrong.
>
> as i say the traffic from the internet is getting DNATed perfectly, so
> i'll concentrate on what's NOT working.
>
> my "protected" lan has the 204.181.247.0/24 addresses this is eth1...my
> DMZ has (actual) 10.1.1.16/28 addresses and that is on eth0.....now__since
> i have 16 public addresses from my ISP, the 172.16.0.16/28 addresses from
> the original post...I have to get the traffic from the internet there and
> also the traffic from my lan there for servers.
>
> I have rules DNATing one to one the 172.16.0.16/28 address to the
> 10.1.1.16/28 addresses for incoming connections from serial0 and eth1.
> i.e.
>
> iptables -t nat -A PREROUTING -i serial0 -d 172.16.0.17 -j DNAT
> --to-destination 10.1.1.17
> and
> iptables -t nat -A PREROUTING -i eth1 -d 172.16.0.17 -j DNAT
> --to-destination 10.1.1.17
>
> both of which seems to work just fine.
>
> now....before i put these rules however, i put more "specific" rules with
> port assignments.
>
> i.e.
> iptables -t nat -A PREROUTING -i serial0 -d 172.16.0.17 -p tcp --dport
> 8021 -j DNAT --to-destination 204.181.247.80:80
> and
> iptables -t nat -A PREROUTING -i eth1 -d 172.16.0.17 -p tcp --dport 8021
> -j DNAT --to-destination 204.181.247.80:80
>
> The first one works fine, but the second one which should essentially tell
> the backet to just go right back onto it's local network to find the
> destination, actually ends up connecting to the 172.16.0.17
> address...which then the routing is messesd up and i never see it again.
>
> i try this:
> telnet 172.16.0.18:8001
>
> here is a tcpdump
>  tcpdump -n -i any host 204.181.247.21 and port 8001 -v -w telnet-in
> tcpdump -r telnet-in
>
> 22:10:22.073457 204.181.247.21.1602 > 204.181.247.80.http: S
> 1454746041:1454746041(0) win 5840 <mss 1460,sackOK,timestamp 4064028
> 0,nop,wscale 0> (DF) [tos
> 0x10]
> 22:10:25.069786 204.181.247.21.1602 > 204.181.247.80.http: S
> 1454746041:1454746041(0) win 5840 <mss 1460,sackOK,timestamp 4064328
> 0,nop,wscale 0> (DF) [tos
> 0x10]
> 22:10:31.069457 204.181.247.21.1602 > 204.181.247.80.http: S
> 1454746041:1454746041(0) win 5840 <mss 1460,sackOK,timestamp 4064928
> 0,nop,wscale 0> (DF) [tos
> 0x10]
> 22:10:43.068733 204.181.247.21.1602 > 204.181.247.80.http: S
> 1454746041:1454746041(0) win 5840 <mss 1460,sackOK,timestamp 4066128
> 0,nop,wscale 0> (DF) [tos
> 0x10]
>

here's a little better tcpdump

22:42:16.495251 204.181.247.21.1998 > 204.181.247.80.http: S
3475951468:3475951468(0) win 5840 <mss 1460,sackOK,timestamp 4255481
0,nop,wscale 0> (DF) [tos
0x10]
22:42:16.496405 arp who-has 204.181.247.21 tell 204.181.247.80
22:42:16.496694 arp reply 204.181.247.21 is-at 0:60:8:8b:72:77
(0:90:27:4f:6e:30)
22:42:16.496909 204.181.247.80.http > 204.181.247.21.1998: S
3169883952:3169883952(0) ack 3475951469 win 17520 <mss 1460,nop,wscale
0,nop,nop,timestamp 0 0,nop,nop,sackOK> (DF)
22:42:16.497257 204.181.247.21.1998 > 204.181.247.80.http: R
3475951469:3475951469(0) win 0 (DF)
22:42:19.487046 204.181.247.21.1998 > 204.181.247.80.http: S
3475951468:3475951468(0) win 5840 <mss 1460,sackOK,timestamp 4255781
0,nop,wscale 0> (DF) [tos
0x10]
22:42:19.487674 204.181.247.80.http > 204.181.247.21.1998: S
3170643377:3170643377(0) ack 3475951469 win 17520 <mss 1460,nop,wscale
0,nop,nop,timestamp 0 0,nop,nop,sackOK> (DF)
22:42:19.488011 204.181.247.21.1998 > 204.181.247.80.http: R
3475951469:3475951469(0) win 0 (DF)

Thank,

Aaron
>
> Thanks,
>
> Aaron
>
>>
>>> after the first DNAT
>>> rule that DNATS it back to the lan, it hits "another one" one
>>> that the DNATs it to the DMZ,
>>
>> Once you DNAT, it won't pass any more DNAT rules and exits the chain??
>> Or
>> did I misunderstood it AGAIN.. *reads original mail again* ;)
>>
>> Thanks,
>> ____________________________________________
>> George Vieira
>>
>>
>>> -----Original Message-----
>>> From: ml@proficuous.com [mailto:ml@proficuous.com]
>>> Sent: Friday, 31 October 2003 2:03 PM
>>> To: George Vieira
>>> Cc: ml@proficuous.com; netfilter@lists.netfilter.org
>>> Subject: RE: PLEASE HELP with DNAT problem
>>>
>>>
>>> >> I tried to DNAT the lan back
>>> >> to itself and
>>> >> it just isn't working..
>>> >
>>> > If I think I know what your trying to do, you are doing a LAN to LAN
>>> > connection right?
>>> >
>>> > Don't forget that a LAN to LAN DNAT also must have a
>>> POSTROUTING SNAT rule
>>> > so the destination server replies back via the firewall/NAT server.
>>> > otherwise it'll reply directly to the client and the client
>>> will drop the
>>> > packet immediately.
>>> Ok..i guess this is what i'm missing.  I'm not sure where i should be
>>> source natting to however.
>>>
>>> the packet starts at lan....destined for internet...now..it supposedly
>>> should get DNATED back to lan..... now like i say..after the
>>> first DNAT
>>> rule that DNATS it back to the lan, it hits another one one
>>> that the DNATs
>>> it to the DMZ, but this one doesn't have the port specific
>>> information, as
>>> normally i'd want it ending up in the DMZ.
>>>
>>> i just don't see how a SNAT fits in here.  but then that's
>>> why i'm asking
>>> fr help.
>>>
>>> Thanks agagin
>>> Aaron P. Martinez
>>> >
>>> > Have you done any tcpdumping or -j LOGing??
>>> >
>>> > Thanks,
>>> > ____________________________________________
>>> > George Vieira
>>> > Systems Manager
>>> > georgev@citadelcomputer.com.au
>>> >
>>> > Citadel Computer Systems Pty Ltd
>>> > http://www.citadelcomputer.com.au
>>> >
>>> > Phone   : +61 2 9955 2644
>>> > HelpDesk: +61 2 9955 2698
>>> >
>>> >
>>> >> -----Original Message-----
>>> >> From: ml@proficuous.com [mailto:ml@proficuous.com]
>>> >> Sent: Friday, 31 October 2003 1:18 PM
>>> >> To: netfilter@lists.netfilter.org
>>> >> Subject: PLEASE HELP with DNAT problem
>>> >
>>>
>>>
>>
>
>


