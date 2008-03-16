From: mouss <mouss@netoyen.net>
Subject: Re: simple netfilter machine redirection
Date: Sun, 16 Mar 2008 23:36:50 +0100
Message-ID: <47DDA102.4060607@netoyen.net>
References: <200803162323.m2GNNXe3013255@dell2.home> <alpine.DEB.1.00.0803161825030.19487@p34.internal.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.1.00.0803161825030.19487@p34.internal.lan>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: 
Cc: netfilter@vger.kernel.org

Justin Piszcz wrote:
>
>
> On Sun, 16 Mar 2008, Marty Leisner wrote:
>
>> I want to accomplish something simple with iptables..
>> (I've used IPtables successfully without really understanding how to do
>> something from scratch -- I just followed "recipes")
>>
>> I want machine A to redirect port 80 to machine B.
>>
>> What's a way to do it?  (seems simple enough).
>>
>> I've tried a number of ways, and nothing seems to work...
>>
>> (the machine isn't a firewall)
>>
>> marty
>
> 152] How do I forward a port from the internet to the LAN? iptables -A 
> PREROUTING -i eth0 -t nat -p tcp --dport 22 -j DNAT --to 192.168.0.5:22
>
> Forward port 22 -> internally to host 192.168.0.5:22 for instance.
>
> .. and yes I did test this just now, it still works :)

OP did not give enough details. The above works if the machine is a 
"gateway" (if A is between the client and B).

if the client and B are on the same side of the gateway, B will respond 
directly to the client. and since there is no TCP triplet, this won't 
work (This is the "reflection" problem). If this is the case, OP must 
also NAT the client (source) IP address to force responses to get back 
via machine A.
