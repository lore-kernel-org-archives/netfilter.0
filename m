From: "Evan Borgstrom" <evan@unixpimps.org>
Subject: Re: Strange setup
Date: Sun, 19 Jan 2003 19:45:02 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1084.10.35.120.83.1043023502.squirrel@mail.unixpimps.org>
References: <1648.10.35.120.83.1043012159.squirrel@mail.unixpimps.org>
        <1043015513.24583.16.camel@wizardslair>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1043015513.24583.16.camel@wizardslair>
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
To: netfilter@lists.netfilter.org

That's not gonna work in my sitation. I guess I need to further explain
how I'm looking for traffic to flow.


If traffic is from the WAN bound for the DMZ then the return path needs to
leave the WAN.

If traffic is from the WLAN bound for the DMZ then the return path needs
to leave the WLAN.

So, I need to be able to mark the connection somehow as the inbound
traffic from the WAN is bound for the DMZ so that I can specify a
different routing table for the return path so that it will leave the WAN
as well, otherwise it might end up with a more specific route through the
WLAN which will cause problems.

Does that make more sense?

-Evan

> If this traffic isn't LAN related then just do
>
> ip rule add from $WAN_IP table $TABLE_NAME
>
> ip route add default via $WAN_PEER_IP dev $WAN_IF table $TABLE_NAME
>
> This will add a source based route so that traffic entering on the
> $WAN_IF has its resonses exit on the $WAN_IF.
>
> See the Advanced Routing HOWTO for more info.
>
> Regards,
>
> PJ
>
> On Mon, 2003-01-20 at 08:35, Evan Borgstrom wrote:
>> I've got sort of a strange setup that I'm looking to accomplish some
>> strange async routing. I know how I want to accomplish it and am
>> pretty sure that I can do it with netfilter but just can't seem to
>> find the proper way.
>>
>> Here's the rundown on the network setup:
>>
>> [ LAN ] --
>> [ DMZ ] -- [ Firewall/Router ] -- [ WAN ]
>>                     |
>>                     |
>>                  [ WLAN ]
>>
>>
>> The WLAN is between myself and a couple of other people in my building
>> to provide redundant paths out of each of our networks and is working
>> beautifully. We all advertise (via BGP) blocks close to us to each to
>> provide the shortest path as well.
>>
>> Comming from the WAN I have a /29 routed to the DMZ which services a
>> number of machines that provide different services.
>>
>> The firewall/router is a linux box that is running iptables.
>>
>>
>> Now the problem:
>> Because of the advertisments comming over the WLAN I now have about 40
>> routes in the kernel routing table. Most of them are not very specific
>> since we advertise our ISP's blocks to each other, so I have routes
>> for /16's, /21's, etc... What happens is when someone that resides in
>> one of these blocks that I'm getting advertisements for tries to
>> access an address in my /29 their return path follows the advertisment
>> over the WLAN.
>>
>> Using the iproute2 package I've created a second routing table with a
>> single default route out my WAN default route. I'm hopping that
>> there's a way to tag the connection in the conntrack table and then -j
>> MARK it when a related,established packet comes back so that I use the
>> iproute2 package to specify that the second routing table will be
>> used.
>>
>> Anyone know of a way that I can accomplish this?
>>
>> Thanks in advance,
>> Evan
>>
>> --
>> Evan Borgstrom <evan@unixpimps.org>
>> http://www.unixpimps.org - SIG:ILL
>>
>>
>>
> --
>
> 'Conformity is the jailer of freedom and the enemy of growth.' - John F.
> Kennedy


-- 
Evan Borgstrom <evan@unixpimps.org>
http://www.unixpimps.org - SIG:ILL



