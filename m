From: Adam Rosi-Kessel <adam@rosi-kessel.org>
Subject: Re: Why would certain packets not reach nat PREROUTING chain?
Date: Tue, 15 Nov 2005 18:57:45 -0500
Message-ID: <20051115235745.GA2513@bostoncoop.net>
References: <20051110031834.GB9770@samad.com.au>
	<20051110032733.GA19073@bostoncoop.net>
	<3063e50511100055m41abd50hc3af78a67896db7d@mail.gmail.com>
	<20051114145348.GA12841@bostoncoop.net>
	<Pine.LNX.4.58.0511141559360.1983@blackhole.kfki.hu>
	<4378A8B1.8010206@rosi-kessel.org>
	<Pine.LNX.4.58.0511150855520.4319@blackhole.kfki.hu>
	<4379E61F.5000807@rosi-kessel.org>
	<Pine.LNX.4.58.0511151453480.4373@blackhole.kfki.hu>
	<20051115235319.GA1727@bostoncoop.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20051115235319.GA1727@bostoncoop.net>
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
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@lists.netfilter.org

On Tue, Nov 15, 2005 at 06:53:19PM -0500, Adam Rosi-Kessel wrote:
> > > So, setting aside the question of why I wasn't seeing that before, shouldn't
> > > I be able to see the incoming packets as they are routed to the internal
> > > client machine, even if they are tracked connections?  When I watch the
> > > inward-facing interface with tcpdump, I don't see any of these packets
> > > getting routed to that machine, although I do see the outbound packets.
> > I don't clearly understand you here. It is always best to run tcpdump on
> > both interfaces so that one can compare what packets are routed properly
> > and how they were mangled/NAT-ed by the firewall. If some packets are
> > missing from either side then that's a clear sign that those packets were
> > dropped by either a matching rule/policy or by the system itself.
> > Did the logging produce anything?

I should probably also mention that the NAT box has two external IP
addresses, both on eth0 (eth0 and eth0:1), although I don't think this
should affect anything, maybe there's something I don't know. All
outbound traffic from the LAN is SNAT'ed to the eth0:1 external IP
address, and the VPN traffic I'm seeing is coming back into that same IP
address.
-- 
Adam Rosi-Kessel
http://adam.rosi-kessel.org

