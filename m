From: Jason Opperisano <opie@817west.com>
Subject: Re: connection tracking without iptables?
Date: Thu, 30 Sep 2004 19:34:30 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1096587270.22962.24.camel@wolfpack.ljm.dom>
References: <7C9884991ADAE0479C14F10C858BCDF591E37C@alderaan.smgtec.com>
	<561dc326040930160476d839c7@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <561dc326040930160476d839c7@mail.gmail.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Thu, 2004-09-30 at 19:04, Jiann-Ming Su wrote:
> 
> Another thing I'm interested in is the total number of current
> connections.  Does /proc/net/ip_conntrack provide this info?  I've
> taken my iptables firewall offline,  and I would expect
> /proc/net/ip_conntrack to show very few connections, but it seems to
> still have quite a bit of historical connections left in it.
> 
> Basically, what I want to be able to do is graph the number of
> connections as a function of time with MRTG.  I just need to make sure
> I'm grabbing the right information.  The output of "iptables -nvxL"
> seems to be total packets processed.  Thanks again for any tips.

  egrep 'ESTABLISHED|ASSURED' /proc/net/ip_conntrack | wc -l

should give you the number of "active" TCP & UDP connections at any
given point in time.

-j

-- 
Jason Opperisano <opie@817west.com>


