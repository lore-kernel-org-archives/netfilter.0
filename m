From: Martin Josefsson <gandalf@wlug.westbo.se>
Subject: Re: Natted IRC "inherently insecure"?
Date: 08 Jul 2002 02:38:00 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <1026088680.1283.253.camel@tux>
References: <3D243492.6090408@tampabay.rr.com>  <20020708001941.GC653@ns>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020708001941.GC653@ns>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Stephen Frost <sfrost@snowman.net>
Cc: "Jesse W. Asher" <jasher1@tampabay.rr.com>, Netfilter <netfilter@lists.samba.org>

On Mon, 2002-07-08 at 02:19, Stephen Frost wrote:

> > Comments?
> 
> The client/tool is one thing but I think what they were probably getting
> at is the issue of DCC.  The problem with DCC is that it expects to be
> able to reach any >1024 port on the remote system.  The two clients work
> out, over the IRC network, the ports to use.  If your firewall doesn't
> allow connections to high ports outbound or inbound, and you don't use
> some kind of IRC helper in your firewall, then DCC won't work.  This may
> be acceptable to you but some people feel they need DCC.  Using an IRC
> helper in your firewall can mitigate these problems some.  They can't
> fix everything though because of the way in which the DCC protocol
> works.  A user using DCC can potentially allow a scan of the high ports
> on at least the machine they're IRC'ing from.
> 
> Unfortunately I'm not very familiar with the internals of the netfilter
> IRC-helper module or what checks it does but there are some things it
> has no way to know due simply to where it has to be and what it gets to
> see.  I havn't heard of many people getting attacked in such a way
> though so the chances of you being exploited in that way are probably
> pretty slim.  Unless you have someone going for you specifically using
> an IRC helper will probably be enough.  Most attackers are going for
> 'easy' targets, things they can sweep large network blocks for; such as
> the recent OpenSSH holes, various Windows-based services, etc.

The only way to get a DCC expections set up is to send out a DCC request
and then the expectation will send packets only to the host that sent
the DCC request. This can be used to sort of add dynamic port-forwards
if you are sitting behind NAT. I don't see it as a real security-problem
as if you want real security you won't use a helper of any kind. And if
a DCC request is sent out with the purpose of letting an attacker in,
the chances are that the attacker already has access to this machine to
send out the DCC request because the user will probably not send it (or
perhaps it's a new email trojan for a certain unnamed mailclient? :).

-- 
/Martin

Never argue with an idiot. They drag you down to their level, then beat
you with experience.

