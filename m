From: Sheldon Hearn <sheldonh@starjuice.net>
Subject: Re: Transparant proxy
Date: Fri, 04 Jun 2004 15:14:41 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1086354881.2699.15.camel@axl.seasidesoftware.co.za>
References: <40BF3E60.2060206@efn.uncor.edu>
	 <1157.172.16.131.133.1086337464.squirrel@mail.suarapembaruan.co.id>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1157.172.16.131.133.1086337464.squirrel@mail.suarapembaruan.co.id>
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
To: david@suarapembaruan.co.id
Cc: netfilter@lists.netfilter.org

On Fri, 2004-06-04 at 10:24, david@suarapembaruan.co.id wrote:

> can anybody tell me how to set rules in iptables if i want to use
> transparant proxy.

That depends on what you mean by transparent proxy.  You may be looking
for the tproxy patch, which was included in patch-o-matic CVS on May 11,
or alternatively is available at:

http://www.balabit.com/products/oss/tproxy/

Ciao,
Sheldon.



