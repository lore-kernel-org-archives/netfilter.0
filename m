From: Nuutti Kotivuori <naked@iki.fi>
Subject: Per connection transfer rate matching
Date: Thu, 05 Feb 2004 00:31:30 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <877jz2iiil.fsf@iki.fi>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I have recently trying to find a solution to a QoS problem of sorts.

What I would wish to be able to do, is to mark a connection based on
the data transfer rate in that connection. That is, to have some sort
of a token bucket filter or rate estimator attached to a certain
connection tracking connection - and to be able to use that in
netfilter rules.

An example problem case is trivial. Let's assume we have an
interactive transfer class, which has several interactive sessions
where latency is tried to be kept to a minimum. Occasionally some
interactive session might start transferring a lot of data - in which
case it should be scheduled into the maximum throughput class,
forgetting latency, until it doesn't transfer that much and it should
be returned to the interactive class again.

The 'connbytes' match in the patch-o-matic matches on cumulative
transfer amounts on a per connection basis. The 'limit' match matches
packets on a simple token bucket implementation. Combining these two
to something which matches bytes on a simple token bucket per
connection would create the desired result.

So, does such a thing exist already? If not, do other people see this
as useful as I do? Or have I missed something crucial?

And finally, if it doesn't exist already, making such a module
shouldn't be too hard - would anyone be willing to undertake such an
ordeal?

-- Naked


