From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: how to block 10000's of addresses?
Date: Sun, 13 Oct 2002 13:10:23 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021013121026.EKOU27697.mta05-svc.ntlworld.com@there>
References: <20021013065007.A15824@hamal.ipal.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20021013065007.A15824@hamal.ipal.net>
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

On Sunday 13 October 2002 12:50 pm, Phil Howard wrote:

> I would like to know how best to block 10000's of addresses using
> netfilter.  Clearly I do not want to be placing 10000's of individual
> filter table entries in.

Sounds like an incompatible set of requirements.   If you want to block 10000 
addresses (and assuming they don't fit into contiguous network ranges) then 
you need 10000 rules to be able to specify what you want to block.

Why don't you want 10000 rules on your netfilter box ?   Have you tried it 
and found it causes any problems ?

> Is there some kind of means to set up the
> equivalent of a routing table like lookup structure (which can be
> added to and removed from separately) which a single netfilter rule
> would reference to apply matches?

Set up source routing and send the packets to a separate netfilter box whose 
sole purpose is to eat packets ?

> I want to block _incoming_ packets.  Null routing these addresses is
> not sufficient, as the lame SYNs will continue to eat up resources.

I don't understand that last part.   If you null route packets, surely 
there's no destination for the SYNs, therefore no half-open connections get 
set up ?

Antony.

-- 

Never write it in Perl if you can do it in Awk.
Never do it in Awk if sed can handle it.
Never use sed when tr can do the job.
Never invoke tr when cat is sufficient.
Avoid using cat whenever possible.

