From: Jihoon Chung <difro@sexycoder.com>
Subject: Re: IRC DCC between 2 clients on the same net.
Date: Fri, 22 Nov 2002 13:11:46 +0900
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021122041146.GA19927@sexycoder.com>
References: <20021118035555.GA5525@sexycoder.com> <3DDD3987.28137.1A389300@localhost>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <3DDD3987.28137.1A389300@localhost>
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
To: Bob Hockney <zeus@ix.netcom.com>
Cc: netfilter@lists.netfilter.org

Thanks for the reply.

On Thu, Nov 21, 2002 at 07:52:39PM -0800, Bob Hockney wrote:
> > I have 2 clients behind a masquerading gateway.
> >
> > When one of them DCC SEND to the outside world, everything's fine.
> > (Thanks
> > to ip_conntrack_irc/ip_nat_irc)
> >
> > But when I DCC-SEND from one client to the other client on the same
> > network, it doesn't work.  The sending side fails almost immediately.
> >
> > Is this normal?
> > I'm using kernel 2.4.17.
>
> DCC is a passive protocol so sending a file means an inbound tcp connection, why
> you need the irc modules in the first place.  What is happening is that
> ip_nat_irc has little choice but to substitute the external ip of your gateway
> for your LAN ip in the DCC SEND request, thus making the other client think it
> should connect to your gateway instead of the LAN address of the client machine
> to get the file -- what you want if the other client is outside your firewall.
> ip_nat_irc then intercepts this and forwards the connection to the LAN ip making
> to DCC SEND request.
>
> Try unloading the two irc modules and attempting a SEND, which should work if
> the two LAN computers can connect to each other.  Also, make sure the rules in

Yes, unloading the two irc modules does work.  But, that means I have to
manually unload the modules when I'm sending to LAN computer, and load
it again when I want to send to outside world.  Surely there must be an
easier way to support both cases.

> the FORWARD chain of the gateway box allow connections to the external ip from
> you LAN.

Why FORWARD? Shouldn't it be the INPUT chain?
Anyway, I tried it with default policy of INPUT/FORWARD/OUTPUT set to
"ACCEPT", it didn't work.

