From: Julian Gomez <kluivert@tm.net.my>
Subject: Re: Traffic going out wrong interface
Date: Wed, 27 Aug 2003 13:33:59 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030827053359.GA2388@propaganda.localdomain>
References: <3F4B3DCC.8010104@chrisbrenton.org> <20030826145630.GB1956@propaganda.localdomain> <3F4B88F1.2020208@chrisbrenton.org>
Reply-To: kluivert@tm.net.my
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <3F4B88F1.2020208@chrisbrenton.org>
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

On Tue, Aug 26, 2003 at 12:21:05PM -0400, Chris Brenton spoke thusly:

>What I found weird was that there is no legitimate "communication" reason
>for the legal NAT address to be ARPing for the private NAT address, at
>least not that I can think of. Also, I don't *think* this is 
>a "ARP being seen off of all interfaces" problem, as I would expect to see
>ARPs for the external gateway on the internal network if it was and I
>never see these. Its always the legal NAT to private NAT address.

Yes. That would be odd. That said, I've personally seen these ARPs on all
interfaces issue cause odd (*) packet drops when we were debugging our
firewall previously. At that time, I was rather daft and had both the
internal & external ethernet cables plugged into the same 10Mbit hub.

(*) Odd until we figured out the problem. Its been documented on this
    netfilter list a couple of times also.

>>Are you running 'tcpdump' on the firewall/routing device itself ? I think a
>>number of us have noticed rather odd things in regards to snat/dnat
>>addresses when running tcpdump on the firewall itself.
>
>Hummm. I'm not running tcpdump, but I am running Snort which would have 
>the same effect on the interface. Let me shut Snort down for a while and 
>see if the problem goes away. If it does turn out to be Snort, that 
>would be kind of weird as well as I've run this config since last fall. 
>I did recently upgrade to Snort 2.0 however, so maybe something that's 
>changed in Snort from 1.9 --> 2.0 is causing it.

(snip rest)

