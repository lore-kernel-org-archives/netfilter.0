From: "Andrew Smith" <nfml@k1k2.com>
Subject: Re: How to bind 2 WAN 1 LAN ?
Date: Fri, 25 Oct 2002 09:53:21 +1000 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <35481.192.168.7.14.1035503601.squirrel@iw.k1k2.com>
References: <200210240957.g9O9vcL04037@vulcan.rissington.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200210240957.g9O9vcL04037@vulcan.rissington.net>
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
To: netfilter@lists.samba.org

> On Thursday 24 October 2002 6:25 am, ?? wrote:
> 
>> Dear all...
>>
>> I'm a Chinese and I don't think that my English is well .
> 
> Don't worry.   I'm sure it will get better :-)
> 
>> I have a Linux server (Turbo Linux7.0 in kernel 2.4.9-3) to be my NAT
>> server .
>> I have make it running iptables-1.2.2-6 .
>> It have 3 NIC(Network interface Card) eth0.eth1.eth2 .
>> I have 1 LAN and 2 WAN interface they are 192.168.1.0/255.255.255.0
>> and 2 ADSL (one of my ADSL is pppoe another one is static IP) .
>> Now I want to bind thy all in my NAT server .
>> I rty to cut my LAN to 4 part are 192.168.1.0/255.255.255.192 &
>> 192.168.1.64/255.255.255.192 & 192.168.1.128/255.255.255.192 &
>> 192.168.1.192/255.255.255.192 .
>>
>> That I wish the preceding 3 part go out and in with the pppoe ADSL
>> (ppp0) and the final part go through with static IP(because they are
>> my servers) .
> 
> You need to use iproute2 to set up source-based policy routing.
> 
> Netfilter will not change the routing of your packets for you,
> therefore it  will not help you do what you want.
> 
> Iproute2 will let you set up a more complicated routing table than the 
> standard 'route' command, and then netfilter will happily process the
> packets  as they go through.
> 
> Antony.

Actually, it depends on the ISPs or who supplies the WANs
If there is no egress filtering on one or both of the WAN connections
then you do not NEED to use iproute2 you can just route all outgoing
data out one of the connections.

e.g. I have 2 ADSL ISPs (one DHCP and one static) but I route all my
traffic out of only one of them (DHCP at the moment) since my ISP's do
not do any egress filtering

typical in Australia to NOT have egress filtering
typical in USA to HAVE egress filtering

egress filtering - use google to look it up
basically: only allow source IP's to match the IP addresses supplied
 in the connection - drop all outgoing traffic that doesn't have the
 expected source IP addresses

-- 
-Cheers
-Andrew

MS ... if only he hadn't been hang gliding!


