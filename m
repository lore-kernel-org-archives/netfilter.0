From: KOVACS Krisztian <hidden@balabit.hu>
Subject: Re: big table tweaks ?
Date: Thu, 15 Sep 2005 14:21:34 +0200
Message-ID: <200509151421.34336@nienna>
References: <201E6F5AC48C274996A5AD8304FAEF860BFCFE@p001ex03.porta.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <201E6F5AC48C274996A5AD8304FAEF860BFCFE@p001ex03.porta.local>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org
Cc: Jan Eidtmann <cmak_@arcor.de>


  Hi,

On Thursday 15 September 2005 14.09, Baake, Matthias wrote:
> try to split up your input rules into some custom chains that the
> packets have not a really long way to traverse your input chain thats
> what i would do..

  Or you could try using IPSet, maybe you can simplify your ruleset 
using the set match.

  http://ipset.netfilter.org

-- 
 Regards,
  Krisztian Kovacs

