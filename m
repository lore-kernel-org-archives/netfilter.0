From: Carlos Carvalho <carlos@fisica.ufpr.br>
Subject: Re: per-connection byte counts
Date: Sun, 18 Jan 2004 18:16:24 -0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <16394.59800.443846.342711@fisica.ufpr.br>
References: <20040118140903.GA3351@glympton.airtime.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040118140903.GA3351@glympton.airtime.co.uk>
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
To: Adam Rice <adamrice@ntlworld.com>
Cc: netfilter@lists.netfilter.org

Adam Rice (adamrice@ntlworld.com) wrote on 18 January 2004 14:09:
 >I'd like to be able to get per-connection byte-counts from the kernel, so I
 >can create a sort of top program showing what processes and users are
 >currently using the network and how much. Since I want this to be something I
 >can keep running all the time, I don't want to do it by snooping the
 >interface. Is there some way to do this with netfilter? Sadly
 >/proc/net/ip_conntrack doesn't appear to provide this information.

iftop and iptraf give statistics per interface, per machine and per
traffic type plus other interesting info. That's all that can be
obtained from a firewall since you cannot retrieve user info from
another machine. The performance impact is usually negligible.

If you want to run the monitor in a multi-user system where users are
logged in you can associate the network connections with processes and
users but I don't know a program that does it. This is a "me too"...

