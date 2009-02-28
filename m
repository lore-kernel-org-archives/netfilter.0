From: sean darcy <seandarcy2@gmail.com>
Subject: Re: Howto setup one machine for specific ip pipe?
Date: Fri, 27 Feb 2009 20:42:19 -0500
Message-ID: <goa4ps$pq1$1@ger.gmane.org>
References: <go9usv$db0$1@ger.gmane.org> <49A8804F.9000502@standarduniversal.com.au> <49A884E2.1030706@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <49A884E2.1030706@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

sean darcy wrote:
> Brian Austin - Standard Universal wrote:
>> which computers have IP addresses that are public/private?
>>
>> b
>>
>> sean darcy wrote:
>>> I have an asterisk voip server in the local network. I have two 
>>> outgoing connections, a large verizon pipe, and small, low latency 
>>> pipe from broadview. I'd like traffic generally to use the verizon 
>>> pipe, but traffic from the voip server should use the low latency 
>>> broadview pipe.
>>>
>>> I've set up table 128:
>>>
>>>
>>> ## eth0 is static to broadview
>>> ETH0_IP_GATEWAY=xx.yy.zz.ww
>>> ETH0_IP_ADDR=xxx.yy.zz.ww1
>>> ip rule delete from $ETH0_IP_ADDR/32 table 128 priority 128
>>> ip rule add    from $ETH0_IP_ADDR/32 table 128 priority 128
>>> ## this is the route through broadview gateway ip
>>> ip route add default via $ETH0_IP_GATEWAY table 128
>>>
>>> ip rule add    fwmark 0x1 table 128 prio 126
>>>
>>> ip rule add    fwmark 0x2 table 128 prio 127
>>>
>>> and then set-mark 0x1 to all packets from the voip server:
>>>
>>> $IPT -t mangle -A PREROUTING -i eth1 \
>>>   -s $AST_IP_ADDR -j MARK --set-mark 0x1
>>>
>>>
>>> But the asterisk server can't access the internet. I assume the 
>>> problem is that iptable server isn't NAT'ing the voip server. That 
>>> is, it routes the packet out through the broadview pipe, but doesn't 
>>> send any of the responses back to the asterisk server.
>>>
>>> Any help appreciated.
>>>
>>> sean
>>>
> 
> The asterisk server has no public address. Everything goes through the 
> one machine running iptables which has the two public addresses - 
> verizon and broadvoice.
> 
> sean

Solved. I needed to masquerade (or DNAT) both external interfaces.

So I had:

$IPT        -t nat -A POSTROUTING -o $VERIZONIF   -j MASQUERADE

but I needed to add:

$IPT -t nat -A POSTROUTING -o $BROADVIEWIF -j SNAT --to-source <my fixed 
ip address>

sean

