From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: terminating connections when an interface goes down
Date: Sat, 13 Mar 2004 18:44:50 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403131844.50093.Antony@Soft-Solutions.co.uk>
References: <1127959457.20040313192408@anime-h.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1127959457.20040313192408@anime-h.com>
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

On Saturday 13 March 2004 6:24 pm, MaXxX wrote:

> Hello.
>
> Having recently switched to a faster ISP but with dynamically assigned
> (and forcibly changed every 24h) IP, I'd like the conntrack module to
> TERMINATE all active connections when the IP changes.
>
> So far I've been using the MASQUERADE target, but all the difference
> between it and SNAT is that it forgets its connections. What I'd like
> is that it terminated them - preferably by generating a two-way
> FIN+RST (or whatever a "terminate" packet looks like).

My recommendation is to use a utility quite independently of netfilter, which 
gets called when your IP address changes (the dhcpcd-eth0.exe script would be 
a good place to do this), and simply sends a suitable RST packet to each 
connection found in /proc/net/ip_conntrack at the time it is called.   
Netfilter will then sort itself out and remove the connection tracking table 
entries when it sees the RST packets.

I'm sure you can find a ready-made utility for generating such RST packets 
(they have to contain the right sequence number) if you don't want to do your 
own coding.

If you still want to try building this into netfilter, I suggest you ask on 
the developers' list instead of the users' list.

Regards,

Antony.

-- 
I want to build a machine that will be proud of me.

 - Danny Hillis, creator of The Connection Machine

                                                     Please reply to the list;
                                                           please don't CC me.


