From: "Alexander Konovalenko" <a-konovalenko@yandex.ru>
Subject: Re: Internet Servers behind firewall (passthrough)
Date: Wed, 11 Feb 2004 20:24:23 +0300 (MSK)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <402A6547.000003.12994@soapbox.yandex.ru>
References: <E1AqjCT-0004ja-FZ@vishnu.netfilter.org> <1076479135.2747.44.camel@raylinux.internal>
Reply-To: a-konovalenko@yandex.ru
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1076479135.2747.44.camel@raylinux.internal>
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
To: netfilter@lists.netfilter.org, sceotjp@ybb.ne.jp
Cc: raymondl@knowledgefactory.co.za

[ ... ]
>> I have 10 public(internet) IP addresses, each for a server.
[ ... ]
>> I would like this Linux "routing machine" to take all traffic to the 10
>> internet IP's
>> and pass them straight on to the servers connected on the other side of this
>> machine.
>> 
>You need to investigate DNAT.

No, you don't.

DNAT is a form of Network Address Translation which would be necessary if you didn't have enough public IP addresses.

What you need is to set up your Red Hat machine (one that is directly connected to the internet) to be a router, that is, to forward IP packets it gets from both sides in the right direction.

You can read how IP routing works in the Linux Network Administrator's guide at http://www.tldp.org/LDP/nag2/x-087-2-issues.html.  Start from there and then search for any additional info on how to set up routing table for your router.  Notice that this issue is offtopic in this list, which is dedicated to packet _filtering_, NAT, etc.

You may want to set up some kind of firewalling at your router to protect your servers against different kinds of attacks or abuse.  _This_ is done using iptables.  Please consult appropriate documentation at http://www.netfilter.org/ and http://www.tldp.org/ first.

 -- alexkon

