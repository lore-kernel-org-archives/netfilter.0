From: Felix Joussein <felix@joussein.com>
Subject: Re: delayed masquerading problems after openswan ipsec
Date: Mon, 26 Jul 2004 23:40:48 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <41057A60.3040502@joussein.com>
References: <41021A71.5030603@gmx.at> <200407241814.56642.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200407241814.56642.Antony@Soft-Solutions.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hello Antony,
Thanks for your  answer:

My Cabel provider does distribute dyn IP's - but the lease time is set 
to 300 years - this is why I have set it staticly.

Her's the outpuut your's like to see:

10.160.0.0/24      -> 10.0.0.0/8         => tun0x104e@195.67.121.56 
comp0xad62@195.67.121.56 esp0xe543f752@195.67.121.56  (20277)
62.167.54.142/32   -> 195.67.121.56/32  => tun0x1050@195.67.121.56 
comp0xad63@195.67.121.56 esp0xe543f753@195.67.121.56  (20277)
ipsec0->eth0 mtu=16260(1443)->1500
comp0x2ee4@62.167.54.142 COMP_DEFLATE: dir=in  src=195.67.121.56 
life(c,s,h)=bytes(2784,0,0)addtime(15680,0,0)usetime(2477,0,0)packets(4,0,0) 
idle=1726 ratio=43391975:43390473 refcount=9 ref=690
comp0x2ee5@62.167.54.142 COMP_DEFLATE: dir=in  src=195.67.121.56 
life(c,s,h)=addtime(15111,0,0) refcount=5 ref=706
comp0xad62@195.67.121.56 COMP_DEFLATE: dir=out src=62.167.54.142 
life(c,s,h)=bytes(1602324,0,0)addtime(15680,0,0)usetime(2505,0,0)packets(20277,0,0) 
idle=670 ratio=1602324:1601251 refcount=5 ref=698
comp0xad63@195.67.121.56 COMP_DEFLATE: dir=out src=62.167.54.142 
life(c,s,h)=addtime(15111,0,0) refcount=5 ref=714
esp0x3dbc92a6@62.167.54.142 ESP_3DES_HMAC_MD5: dir=in  src=195.67.121.56 
iv_bits=64bits iv=0xdef652007170d02c ooowin=64 seq=31798 
bit=0xffffffffffffffff max_seq_diff=6 alen=128 aklen=128 eklen=192 
life(c,s,h)=bytes(43390473,0,0)addtime(15680,0,0)usetime(2490,0,0)packets(30781,0,0) 
idle=670 refcount=30781 ref=691
esp0x3dbc92a7@62.167.54.142 ESP_3DES_HMAC_MD5: dir=in  src=195.67.121.56 
iv_bits=64bits iv=0xb30a2cb08153f175 ooowin=64 alen=128 aklen=128 
eklen=192 life(c,s,h)=addtime(15111,0,0) refcount=4 ref=707
esp0xe543f752@195.67.121.56 ESP_3DES_HMAC_MD5: dir=out src=62.167.54.142 
iv_bits=64bits iv=0x677cca706b74ba90 ooowin=64 seq=20277 alen=128 
aklen=128 eklen=192 
life(c,s,h)=bytes(2264424,0,0)addtime(15680,0,0)usetime(2505,0,0)packets(20277,0,0) 
idle=670 refcount=4 ref=699
esp0xe543f753@195.67.121.56 ESP_3DES_HMAC_MD5: dir=out src=62.167.54.142 
iv_bits=64bits iv=0xfa7de0dbce5e3072 ooowin=64 alen=128 aklen=128 
eklen=192 life(c,s,h)=addtime(15111,0,0) refcount=4 ref=715
tun0x104d@62.167.54.142 IPIP: dir=in  src=195.67.121.56 
policy=10.0.0.0/8->10.160.0.0/24 flags=0x8<> 
life(c,s,h)=bytes(43391975,0,0)addtime(15680,0,0)usetime(2490,0,0)packets(30781,0,0) 
idle=670 refcount=4 ref=689
tun0x104e@195.67.121.56 IPIP: dir=out src=62.167.54.142 
life(c,s,h)=bytes(1602324,0,0)addtime(15680,0,0)usetime(2505,0,0)packets(20277,0,0) 
idle=670 refcount=4 ref=697
tun0x104f@62.167.54.142 IPIP: dir=in  src=195.67.121.56 
policy=195.67.121.56/32->62.178.26.142/32 flags=0x8<> 
life(c,s,h)=addtime(15111,0,0) refcount=4 ref=705
tun0x1050@195.67.121.56 IPIP: dir=out src=62.167.54.142 
life(c,s,h)=addtime(15111,0,0) refcount=4 ref=713
Destination     Gateway         Genmask         Flags   MSS Window  irtt 
Iface
0.0.0.0         62.167.54.1     0.0.0.0         UG        0 0          0 
eth0
10.0.0.0        62.167.54.1     255.0.0.0       UG        0 0          0 
ipsec0
195.67.121.56  62.167.54.1     255.255.255.255 UGH       0 0          0 
ipsec0
62.167.54.0     0.0.0.0         255.255.255.0   U         0 0          0 
eth0
62.167.54.0     0.0.0.0         255.255.255.0   U         0 0          0 
ipsec0

Thanks in advanced,

Felix Joussein


Antony Stone wrote:

>On Saturday 24 July 2004 9:14 am, Felix Joussein wrote:
>
>  
>
>>Hello List,
>>
>>I'm not new to iptables, but this problem is very strange:
>>
>>I have a Linux 2.4.26 + openswan ipsec + iptables 2.11 box with a cable
>>modem to connect to the internet - so far:
>>I have one single rule in the postrouting chain:
>>
>>iptables -t nat -I POSTROUTING -o eth0 -j MASQUERADE
>>
>>This works fine - also my IPSec tunnel is working nice.
>>But after a while - can't say how long, the connection from the lan
>>thrue the linux box get lost.
>>dmesg's Output is:
>>
>>MASQUERADE: Route sent us somewhere else.
>>klips_error:ipsec_xmit_send: ip_send() failed, err=1
>>
>>This message repeats as long, as  I remove the MASQ rule, and re-set it.
>>
>>Has anyone an idea about this issue?
>>    
>>
>
>Does your cable modem service provider change IP addresses on you on some 
>frequent basis?
>
>Try checking ifconfig next time this happens (before and after the problem).   
>I expect you'll find that when things are working, both eth0 and ipsec0 have 
>the same IP address (acquired from the ISP by DHCP), but after the problem 
>has occurred, you'll probably see a different address on eth0, with the same 
>old one on ipsec0.
>
>The solution is probably to take the IPsec tunnel down and bring it back up 
>again when the IP address on eth0 changes - I think you can do this from a 
>script called by the DHCP client daemon.
>
>If it turns out you're not getting given a different IP address, perhaps you 
>can post the output from some diagnostics such as "route -n" or "ipsec look".
>
>Regards,
>
>Antony.
>
>  
>


