From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: ip_conntrack_max
Date: Thu, 8 Jul 2004 10:56:14 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407081056.14826.Antony@Soft-Solutions.co.uk>
References: <40ED161F.5070804@cisbic.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40ED161F.5070804@cisbic.com>
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

On Thursday 08 July 2004 10:38 am, Fallucchi Antonio wrote:

> hi
>
> i have the problem width "ip_conntrack: table full, dropping packet."
>
> what is the good and max dimension  of the ip_conntrack_max ?

The answer to this depends on:

1. How many connections you need to support through your firewall.
2. How much memory you have in your machine (each connection table entry uses 
a small amount of memory, therefore this is what sets the limit on the 
maximum size you can make it on a given machine.

What is the output of "wc -l /proc/net/ip_conntrack", and how much memory do 
you have in your system?

Regards,

Antony.

-- 
In science, one tries to tell people
in such a way as to be understood by everyone
something that no-one ever knew before.

In poetry, it is the exact opposite.

 - Paul Dirac

                                                     Please reply to the list;
                                                           please don't CC me.


