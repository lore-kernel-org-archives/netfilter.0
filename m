From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Routing rule for two gateways.
Date: Mon, 23 Sep 2002 15:14:38 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209231414.g8NEEjv24590@vulcan.rissington.net>
References: <00ce01c26051$994ca630$0200000a@ramasamy> <200209201417.35968.dharmu@nsecure.net> <005f01c26307$0c4cb5f0$8c01a8c0@sundaram>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <005f01c26307$0c4cb5f0$8c01a8c0@sundaram>
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

On Monday 23 September 2002 2:42 pm, Sundaram Ramasamy wrote:

> What is the Linux command and syntax to set two default gateway.

The question does not make sense.   You can have two (or more) gateways, but 
only one of them can be the default.

Default means "the one to use when there is no reason to use any other".

Although it is perfectly possible to type on a Linux machine:

route add default gw 192.168.0.1
route add default gw 172.16.0.1
route add default gw 10.0.0.1

And produce a routing table with three "default gateways" listed, only one of 
them will ever get used, because the Linux routing table works on a "first 
match" basis, so all packets will match the same entry and go out by that 
route.

Antony.

-- 

Never write it in Perl if you can do it in Awk.
Never do it in Awk if sed can handle it.
Never use sed when tr can do the job.
Never invoke tr when cat is sufficient.
Avoid using cat whenever possible.

