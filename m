From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: Re: looking for rules for samba-related traffic
Date: Mon, 7 Apr 2003 08:41:13 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0304070839140.1911-100000@localhost.localdomain>
References: <003301c2fcbb$faf6d700$7e00a8c0@speednet6>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <003301c2fcbb$faf6d700$7e00a8c0@speednet6>
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
To: "Anthony M. Rasat" <a.m.rasat@palangkaraya.speed.net.id>
Cc: netfilter@lists.netfilter.org

On Mon, 7 Apr 2003, Anthony M. Rasat wrote:

> Dear Robert,
> 
> Most times, when configuring a firewall, people blocked everything first
> then allow any service required. This goes for any incoming traffic rule.
> Now, outgoing rule may vary. Some people like to let any outgoing traffic
> may pass unchanged, some are not. In your case, if you wish to do so, your
> can set rules to block outgoing TCP and UDP port 137 - 139. This rules will
> not affecting Samba (or Microsoft Windows Network Sharing Service)
> communication inside your internal network.

no, you have it backwards.  i'm starting from a position of DROP on all
chains, and want to slowly *open up* my firewall.  what i was after
was a set of (ideally minimal) rules that would allow just what was
needed for samba-related traffic.

i'm aware that that traffic involves ports 137-9, but wanted to
know if there was a summary of *precisely* what ports were involved,
and what they were used for, so i could know exactly what i had
to allow and what i could leave closed.

rday


