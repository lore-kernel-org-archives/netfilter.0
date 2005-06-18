From: "Netfilter" <netfilter@cjseng.com>
Subject: Re: What's the best way to block these IP's?
Date: Sat, 18 Jun 2005 13:02:31 -0500
Message-ID: <004701c5742f$e5d47c40$45d4a8c0@martin>
References: <003001c57425$4bb210a0$45d4a8c0@martin>
	<200506181246.09879.rob0@gmx.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@lists.netfilter.org

Thanks fo the reply... I noticed the error of the "/32" CIDR right after I 
sent it.
Brain fart on my part.
I just wanted to know if
 218.0.0.0 without the" /*"  would work. (blocking the whole 218.0.0.0 
block)




From: "/dev/rob0" <rob0@gmx.co.uk>
To: <netfilter@lists.netfilter.org>
Sent: Saturday, June 18, 2005 12:46 PM
Subject: Re: What's the best way to block these IP's?


> On Saturday 18 June 2005 11:46, Netfilter wrote:
>> What's the best way to block these IP's?
>
> I'm not sure what your question is. I see a few main possibilities
> about which you might be asking. I'll address those.
>
>> -A INPUT -p tcp -s 213.0.0.0/32 -i eth1 -j DROP
>>
>> or
>>
>> -A INPUT -p tcp -s 218.0.0.0 -i eth1 -j DROP
>
> Maybe you don't understand CIDR notation, and thus don't know what
> these do. A /32 netmask means "this IP only" in English. 32 bits of
> netmask is 255.255.255.255. Both forms are the same!
>
> If you want to block all IP's starting with 213 or 218, those won't do
> it. You would need to use /8 or smaller. 218.0.0.0/8 is 218.0.0.0
> through 218.255.255.255; 218.0.0.0/7 is 218.0.0.0 through
> 219.255.255.255. Rusty's Networking Concepts HOWTO might help.
>
> Generally the best strategy for firewalling is to choose what to allow
> and let everything else hit a DROP or REJECT policy or rule. Here the
> Packet Filtering HOWTO has examples which might help. Note as well that
> all your examples are only limiting TCP traffic, and only if coming in
> your eth1 interface.
>
> Furthermore there are common misunderstandings concerning the role of
> INPUT as opposed to FORWARD. If you're wanting to block traffic from or
> to NAT users, your INPUT rules will not do it. Again this is explained
> in the Packet Filtering HOWTO.
>
> When I have common rules I want called from both INPUT and FORWARD, I
> use a new chain ...
> # iptables -N Common
> # iptables -vA Common -s 218.0.0.0/7 -j DROP
> [ ... other rules as wanted ... ]
> # iptables -vA INPUT -j Common
> # iptables -vA FORWARD -j Common
> You can of course limit the type of traffic sent to the chain with
> matches on the calling rule.
>
> HTH, and if not you, HTH someone else.
> -- 
>    mail to this address is discarded unless "/dev/rob0"
>    or "not-spam" is in Subject: header 


