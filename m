From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: question on the nat table and iptables && REDIRECT
Date: Mon, 23 Sep 2002 16:17:28 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209231517.g8NFHZv24723@vulcan.rissington.net>
References: <3D8EA8EF.60909@mindspring.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3D8EA8EF.60909@mindspring.com>
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

On Monday 23 September 2002 6:38 am, Joe wrote:

> Hello,
>     I am trying to get the redirect to work for use with squid. I know
> that squid is working, but it seems that nothing from the local machine
> is going through the nat PREROUTING table.

Why should it?   PREROUTING is for packets entering the machine, before the 
routing decision which determines whether they're stopping here or going on 
somewhere else.

Packets generated on the local machine go through the OUTPUT and POSTROUTING 
chains.

>     1) how do the tables interact with each other?  i.e. if a rule in
> the FILTER table is processed is that the end of it or does it make its
> way through the NAT and MANGLE tables as well?

Check out Oskar Andreasson's excellent tutorial, section 3:

http://www.netfilter.org/documentation/tutorials/blueflux/iptables-tutorial.html

Antony.

-- 

In science, one tries to tell people
in such a way as to be understood by everyone
something that no-one ever knew before.

In poetry, it is the exact opposite.

 - Paul Dirac

