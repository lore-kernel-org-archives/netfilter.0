From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Maxium concurrent connections with IPTables
Date: Mon, 2 Aug 2004 20:14:54 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200408022014.54628.Antony@Soft-Solutions.co.uk>
References: <564DE4477544D411AD2C00508BDF0B6A22073275@usahm018.exmi01.exch.eds.com> <200408022001.49637.Antony@Soft-Solutions.co.uk>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200408022001.49637.Antony@Soft-Solutions.co.uk>
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

On Monday 02 August 2004 8:01 pm, Antony Stone wrote:

> On Monday 02 August 2004 7:15 pm, Small, Jim wrote:
> > I'm curious, what is the maximum number of concurrent connections
> > possible with IPTables using connection tracking for udp and for tcp? 
> > (using latest 2.4 kernel and 2.6 kernel)
>
> Depends on the amount of memory in your machine, and the setting of
> /proc/sys/net/ipv4/ip_conntrack/max

Oops - that should be /proc/sys/net/ipv4/ip_conntrack_max of course.

Incidentally, if you don't change this value, it's calculated so that it uses 
approximately 5% of the system's memory (in other words, you should be able 
to increase the conntrack table capacity by a factor of about 20 on a system 
which isn't using memory for anything else).

Antony.

-- 
Software development can be quick, high quality, or low cost.

The customer gets to pick any two out of three.

                                                     Please reply to the list;
                                                           please don't CC me.


