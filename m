From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: need help firewalling homebrew http+smtp+dns+vpn
Date: Sun, 21 Dec 2003 10:38:34 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312211038.35016.Antony@Soft-Solutions.co.uk>
References: <20031221070757.GD15390@dragonII>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031221070757.GD15390@dragonII>
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

On Sunday 21 December 2003 7:07 am, Andrea Tasso wrote:

> hello, these are my naive questions, I am a newbie:
>
> I need to firewall my homebrew linux boxes, say to close everything I can
> to/from outside (internet), and do everything inside my vpn. On the
> FIREWALL machine I also run some server whose services/ports must keep to
> be accessible to/from outside. Those kinds of connections I need to do also
> to servers outside. All the machines of the VPN need to be free to suft the
> outside internet. So also masquerading and forwarding are needed.

I don't really see anything about this setup which is not dealt with very well 
by the tutorials available at 
http://www.netfilter.org/documentation/index.html#tutorials

The only thing I would say about the protocols marked with "?" on your diagram 
is that DNS uses TCP port 53 and UDP port 53; it does not use port 42.   I 
can't understand why you have marked the DSL router with "?" as this is 
nothing to do with the netfilter setup.

It would help us greatly if you could read one of the tutorials, use a ruleset 
which you think will do (part of) what you want, and then tell us if you are 
having specific problems afterwards.

Read the documentation - it really is good, and it will not only give you good 
examples of what to do, but help you understand why it works as well.

Regards,

Antony.

-- 
Behind the counter a boy with a shaven head stared vacantly into space,
a dozen spikes of microsoft protruding from the socket behind his ear.

 - William Gibson, Neuromancer (1984)

                                                     Please reply to the list;
                                                           please don't CC me.


