From: "Mitesh P Choksi" <murli@icafe.co.tz>
Subject: Re: [Fwd: SNAT to allocat IP from an IP Pool]
Date: Mon, 30 Sep 2002 14:06:25 +0300 (EAT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <49031.64.86.49.17.1033383985.squirrel@www.icafe.co.tz>
References: <20020929214905.GEVE27185.mta03-svc.ntlworld.com@there>
Reply-To: murli@icafe.co.tz
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20020929214905.GEVE27185.mta03-svc.ntlworld.com@there>
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
To: Antony@Soft-Solutions.co.uk
Cc: netfilter@lists.netfilter.org

Let me explain more to add clarifications here.

1. I have 16 public IP addresses
2. I have LAN with almost 200 private IP addresses
3. I need to give one-to-one relation to a private IP with a public IP at
any given time, automatically. something like -SNAT --to
23.23.23.0/255.255.255.240
4. I need to make sure that all connections from on private IP map to one
public IP, connection to public IP should be forwarded to the private IP
NATted FOR THAT PARTICULAR TIME.
5. Once the set of connections are over then the public IP should be
releived for some other private IP asking for the connections.
6. I could do one-to-one SNAT for all 254 IPs, but I don't have any more
than 16.

I need to re-use 16 public IP among 254 private IPs. Just like dial-up
connections are given public IP based on DHCP(When they log in and ask for
RADIUS to allocate IP, instead of per-port IP, the DHCP is looked up and an
IP is allocated, once the dial-up connection dies, RADIUS hands back the IP
to DHCP for re-use)

Let me know if you need more exlpanation.

Possibly there may be a better solution, please do let me know if you have
faced similar situation.

Mitesh

Antony Stone said:
> On Sunday 29 September 2002 9:49 pm, Mitesh P Choksi wrote:
>
>> I want to allocated 16 public IP addresses to a group of 254 IP
>> addresses, as and when I request. So at any given time only 16 IPs
>> users out of the 254 IPs will be able to use the Internet. Something
>> like DHCP with a very minimum lease time. More of only current
>> connections are allowed to use the Internet.
>>
>> This is becauase public IP is a scarce, and I have LAN users. NAT does
>> not work for certain IP Telephony (dialpad, go2call, etc), VPN, other
>> public IP required applicatoins.
>
> I'm not sure I understand the problem.
>
> 1. If your users are clients, connecting *out* to the Internet, you
> don't  have to give them separate IP addresses - I regularly run
> several hundred  users off a single IP address with no problems.
>
> 2. If your users are running servers, which need to be connected *from*
> the  Internet, then you simply set up a DNAT rule from each of the 16
> public IPs  to whichever 16 private IPs are active, and then remove the
> rule when you  don't want that private IP to be active any more.
>
> 3. If you're saying that you want to use protocols which don't work
> through  NAT, then you can't use NAT, and therefore the concept of
> translating between  public and private addresses is not helpful.
>
> Here's another way of looking at it:
>
> If you need to use protocols which don't work through NAT, then you
> have to  put the public IPs on the actual machines, which means they're
> on the public  side of the firewall (not a good idea...)
>
> If you've got internal clients accessing the Internet, you can do it
> all on  one IP address with the command:
>
> iptables -A POSTROUTING -t nat -s 192.168.130.0/24 -o $extIF -j
> MASQUERADE
>
> If you've got internal servers which need to be contactable from the
> Internet, use one rule per server as follows:
>
> iptables -A PREROUTING -t nat -d $extIP1 -i $extIF -j DNAT --to $lanIP1
>
> etc.
>
> Does this help ?
>
> Antony.
>
> --
>
> You can spend the whole of your life trying to be popular,
> but at the end of the day the size of the crowd at your funeral
> will be largely dictated by the weather.
>
> - Frank Skinner




Regards,

Cyberdude Murli
The Earth



