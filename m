From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: DROP or REJECT
Date: Tue, 11 May 2004 13:16:03 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1084295762.1965.8.camel@grendel>
References: <163801c4375e$49bb6d50$49caa8c0@caris.priv>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <163801c4375e$49bb6d50$49caa8c0@caris.priv>
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
To: Peter Marshall <peter.marshall@caris.com>
Cc: netfilter <netfilter@lists.netfilter.org>

On Tue, 2004-05-11 at 09:45, Peter Marshall wrote:
> Which is better (to drop or reject packets)?  I am asking more
> specifically for connections from the internet to my external
> firewall.

Depends. I like rejecting with host-unreachables as it makes it look
like you do not have a firewall. It also has the ability to shut down
certain scanning tools before they can find exposed ports.

Some worry this could be a potential DoS situation. If you are worried
about this you can combine it with rate limiting.

> My second question is if I have a DNS in my DMZ (contains only ip's in
> my dmz.  internal boxes use this as their DNS.  This DNS falls back to
> my ISP), do I have to allow both TCP and UDP connections on port 53 ? 
> Can I not just have UDP, or does it use both ? 

Again, it depends. Queries use UDP/53 _unless_ the answer exceeds a 512
byte packet size. If it does, the connection can switch over to TCP/53. 

So, outbound you need TCP and UDP. Inbound to your DNS server, it
depends if you answers will exceed this maximum. If not, you only need
to permit UDP/53 from the Internet in general, and TCP/53 only from
servers (if any) that are acting as secondaries.

HTH,
Chris



