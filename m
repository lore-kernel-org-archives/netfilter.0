From: "Dan Searle" <dan@intrago.co.uk>
Subject: Re: Optimize large iptables by hashing on MAC address help
Date: Fri, 11 Oct 2002 17:01:43 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <00cc01c2713f$7e37f530$0800000a@wormhole>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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

Re,

I've had a look at the linux/net/ipv4/netfilter/ipt_mac.c source and had a
thought...

It wouldn't be too difficult to add an extra parameter to the mac match
module to allow masked matching, i.e. add a --mac-mask parameter which would
allow the user to specify a bit mask so that only the un-masked bits of the
6 byte mac address were compared, e.g...

iptables -A INPUT -m mac --mac-source 00:00:00:00:00:02 --mac-mask
00:00:00:00:00:0F -j ACCEPT

...meaning that only the least significant 4 bits of the mac source are
compared against the specified mac source parameter.

Perhaps if the person in charge of writing the ipt_mac.c file reads this
they may consider adding this masking functionality to the module. I would
have a go myself, but I'm not too confident at kernel hacking! :-)

Cheers, Dan...

P.S.
Aplolgies to Brad Morgan, I replied to you personaly first, by mistake
instead of to the list!

----- Original Message -----
From: "Brad Morgan" <B-Morgan@concentric.net>
To: "Dan Searle" <dan@intrago.co.uk>
Sent: Friday, October 11, 2002 4:05 PM
Subject: RE: Optimize large iptables by hashing on MAC address help


> Dan,
>
> I'm not sure if code exists to accomidate your needs but I've attached a
> message to this list from a while back that may improve your performance.
> I'm not associated with this project and am not using it on my small
> firewall.
>
> Regards,
>
> Brad Morgan
>




