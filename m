From: William Stearns <wstearns@pobox.com>
Subject: Re: Order in ruleset edition
Date: Wed, 26 Nov 2003 13:59:18 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0311261355310.21792-100000@sparrow>
References: <00f201c3b44c$d9388520$0200a8c0@ale>
Reply-To: William Stearns <wstearns@pobox.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <00f201c3b44c$d9388520$0200a8c0@ale>
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
To: Alejandro Cabrera Obed <sisdis@tournet.com.ar>
Cc: "Netfilter lista (iptables)" <netfilter@lists.netfilter.org>, William Stearns <wstearns@pobox.com>

Good afternoon, Alejandro,

On Wed, 26 Nov 2003, Alejandro Cabrera Obed wrote:

> I'm trying to construct my own ruleset of iptables; I'm editing a file
> script.
> 
> My question is the following:
> 
> Is there any order about CHAINS and TABLES that I have to follow in order to
> construct my iptables ruleset ??? For example, is it the same if firstly I
> write in my script my the FORWARD rules and then the OUTPUT and INPUT rules
> or viceversa ???

	There isn't a difference in the final outcome, no.

	However, unless you're blocking all traffic until the firewall is
completely constructed, the second and third chains you construct will be
left unprotected longer (on the order of 1-5 seconds or so).  It's a minor
consideration, but I've seen an attack that sneaked through a firewall as
it was being reloaded.
	Cheers,
	- Bill

---------------------------------------------------------------------------
        "Don't say you don't have enough time.  You have exactly the
same number of hours per day that were given to Helen Keller, Pasteur,
Michaelangelo, Mother Teresa, Leonardo da Vinci, Thomas Jefferson, and
Albert Einstein."
        -- H. Jackson Brown 
(Courtesy of <drow@visi.com>)
--------------------------------------------------------------------------
William Stearns (wstearns@pobox.com).  Mason, Buildkernel, freedups, p0f,
rsync-backup, ssh-keyinstall, dns-check, more at:   http://www.stearns.org
Linux articles at:                         http://www.opensourcedigest.com
--------------------------------------------------------------------------


