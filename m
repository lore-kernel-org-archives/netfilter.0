From: Sandro Dentella <sandro@e-den.it>
Subject: Re: Why would certain packets not reach nat PREROUTING chain?
Date: Thu, 10 Nov 2005 15:50:35 +0100
Message-ID: <20051110145035.GB21150@casa.e-den.it>
References: <20051110134516.GA2080@bostoncoop.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20051110134516.GA2080@bostoncoop.net>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

> > I also have a setup in which icmp packets will not get to PREROUTING.
> > My understanding is that the kernel does not understand they are destined
> > for that box: could that be your situation?
> 
> I don't think that's related, although I admit I don't have a thorough
> understanding of the issue... why would icmp packets matter when the
> issue is inbound UDP 500 packets that are showing up in tcpdump? Wouldn't

  I'm not saying they are related. I just see that in both cases we have
  packets that arrive (tcpdump shows them) but are not correctly understood
  by the kernel as being destined for the box.


> showing up in tcpdump indicate that the kernel understands the packet is
> destined for that box?

  I don't think so. A packet that is to be forwareded is not "destined for
  the box". In general my understanding is that tcpdump reads everything
  that passes on the wire, as it comes before any routing decision. It
  sees also packets that are not destined for the box.

  What I would like to understand is why a packet that tcpdump show as
  destined for the box in not understood as such.

  I have been asking this since a couple of weeks on 3 different lists
  (netfilter, lartc, netdev), but didn't get a single answer...

  sandro



-- 
Sandro Dentella  *:-)
e-mail: sandro@e-den.it 
http://www.tksql.org                    TkSQL Home page - My GPL work

