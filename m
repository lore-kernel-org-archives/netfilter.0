From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Strange logs...
Date: Sun, 11 Jan 2004 13:40:27 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401111340.27973.Antony@Soft-Solutions.co.uk>
References: <002201c3d837$a6c70e90$1530a8c0@HUSH> <200401111251.15250.Antony@Soft-Solutions.co.uk> <004001c3d846$e4e85e90$1530a8c0@HUSH>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <004001c3d846$e4e85e90$1530a8c0@HUSH>
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
To: netfilter <netfilter@lists.netfilter.org>

On Sunday 11 January 2004 1:29 pm, Carlos Fernandez Sanz wrote:

> I have to say that if I unplug any of the two cables (the one between the
> linux and the switch or the one between the linux and the router) strange
> things happen. So I'm really starting to believe that the packet does come
> from the wire physically.... no matter how impossible that seems.
>
> As I finished writing that I tried to ping from the windows box to the
> linux box and both cables must be connected for ping responses to arrive.

By "both cables", you mean the one connecting the Linux box to the switch (and 
thence to the Windows box) and also the one joining the Linux machine to the 
outside world!?!?

That is just plain wrong.   You should not need a connection to your external 
router in order to ping between two internal machines (assuming you are 
pinging the real IP addresses, and not relying on a DNS lookup or something).

> This happens even with all the iptables tables flushed (ie firewall down;
> no rules, and ACCEPT as policies for both input and policies).

Show us the routing tables on both machines.

> But this is starting to look more like
> a hardware issue to me. Definitely not related to the wiring, but maybe
> there's some kind of conflict between my NICs I haven't spotted yet.... so
> in case it helps:

Your IRQ/address etc setup looks fine to me, however there is clearly 
something weird about the network hardware arrangement for you to get the 
above-described ping behaviour.

Antony.

-- 
"Note: Windows 98, Windows 98SE and Windows 95 are not affected by [MS
Blaster].   However, these products are no longer supported.   Users of these
products are strongly encouraged to upgrade to later versions."

(which *are* affected by MS Blaster...)

http://www.microsoft.com/security/security_bulletins/ms03-026.asp

                                                     Please reply to the list;
                                                           please don't CC me.


