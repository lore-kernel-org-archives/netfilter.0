From: "Bob Hockney" <zeus@ix.netcom.com>
Subject: Re: IRC DCC between 2 clients on the same net.
Date: Thu, 21 Nov 2002 19:52:39 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DDD3987.28137.1A389300@localhost>
References: <20021118035555.GA5525@sexycoder.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <20021118035555.GA5525@sexycoder.com>
Content-description: Mail message body
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
To: Jihoon Chung <difro@sexycoder.com>, netfilter@lists.netfilter.org

> I have 2 clients behind a masquerading gateway.
> 
> When one of them DCC SEND to the outside world, everything's fine.
> (Thanks
> to ip_conntrack_irc/ip_nat_irc)
> 
> But when I DCC-SEND from one client to the other client on the same
> network, it doesn't work.  The sending side fails almost immediately.
> 
> Is this normal?
> I'm using kernel 2.4.17.

DCC is a passive protocol so sending a file means an inbound tcp connection, why 
you need the irc modules in the first place.  What is happening is that 
ip_nat_irc has little choice but to substitute the external ip of your gateway 
for your LAN ip in the DCC SEND request, thus making the other client think it 
should connect to your gateway instead of the LAN address of the client machine 
to get the file -- what you want if the other client is outside your firewall.  
ip_nat_irc then intercepts this and forwards the connection to the LAN ip making 
to DCC SEND request.

Try unloading the two irc modules and attempting a SEND, which should work if 
the two LAN computers can connect to each other.  Also, make sure the rules in 
the FORWARD chain of the gateway box allow connections to the external ip from 
you LAN.

-Bob

