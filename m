From: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Subject: Re: OT: curious about eth0/eth1
Date: Wed, 8 Jan 2003 12:40:20 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0301081236290.27534-100000@dns.toxicfilms.tv>
References: <6620000.1041983993@leverage>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <6620000.1041983993@leverage>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tommy McNeely <Tommy.McNeely@Sun.COM>
Cc: netfilter@lists.netfilter.org

> Again.. I am just curious as to why some do it one way.. and some the
> other... the above is only MY opinion, and could be dreadfully wrong :)
Well, i never care for which is internal or external, sometimes i set up
eth1 as external, sometimes it's eth0 or ppp0. What is funny,
on my experimentalbox i have the network with default route on eth1, and
eth0 is connected to a roaming port in a 3com corebuilder (== i get a copy
of the whole Internet<->LAN traffic), it's unusual, and i very often have
to reconfigure programs that make this assumption that eth0 is the
Internet interface.
I take it as totally free to choose, and propably random.

Anyway i alwyas refer to interfaces as EXT, INT, not their names.

Regards,
Maciej Soltysiak


