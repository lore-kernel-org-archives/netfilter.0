From: Nuutti Kotivuori <naked@iki.fi>
Subject: Re: Per connection transfer rate matching
Date: Tue, 10 Feb 2004 20:02:44 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <87wu6ubynv.fsf@iki.fi>
References: <877jz2iiil.fsf@iki.fi> <1075966119.5355.0.camel@raylinux.internal>
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

Ray Leach wrote:
> On Thu, 2004-02-05 at 00:31, Nuutti Kotivuori wrote:
>> The 'connbytes' match in the patch-o-matic matches on cumulative
>> transfer amounts on a per connection basis. The 'limit' match
>> matches packets on a simple token bucket implementation. Combining
>> these two to something which matches bytes on a simple token bucket
>> per connection would create the desired result.
>
> Could you not do it then by using two user defined chains, one for
> limit match and one for connbytes?

Nay. If you think about what I am wanting, it should be obvious that
it can't work.

Anyway, I cooked up a patch to do what I wanted - I posted it on the
netfilter-devel list just recently. It's still in development and very
basic, but seems to work fine.

-- Naked



