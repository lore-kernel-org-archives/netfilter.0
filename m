From: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Subject: Re: Ping With Iptables.
Date: Tue, 29 Oct 2002 18:52:51 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0210291851320.14356-100000@dns.toxicfilms.tv>
References: <200210291629.g9TGT6e10461@vulcan.rissington.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200210291629.g9TGT6e10461@vulcan.rissington.net>
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
To: Antony Stone <Antony@Soft-Solutions.co.uk>
Cc: netfilter@lists.netfilter.org

> I would instead recommend
> iptables -P INPUT DROP
>
> and then only add rules for the things you really do want to come in to the
> firewall (established & related is probably a good start).
Well of course, i wrote that, keeping in mind that he could have other
rules like:
-s 0/0 -j ACCEPT

> "Allow what you know you want, and drop everything else" is a good policy.
Is the best in most cases.

> Antony.
Maciej



