From: Erik Bourget <erik@midmaine.com>
Subject: Re: Three kernel Oops/panic/BUG ksymoopses (kernel BUG at
 buffer.c:539)
Date: Mon, 05 Jan 2004 16:28:59 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <87oetidqzo.fsf@midmaine.com>
References: <Pine.LNX.4.44.0401031352040.2301-100000@poirot.grange>
	<87ekugzopi.fsf@midmaine.com>
	<Pine.LNX.4.58L.0401051359330.1188@logos.cnet>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.58L.0401051359330.1188@logos.cnet> (Marcelo
 Tosatti's message of "Mon, 5 Jan 2004 13:59:58 -0200 (BRST)")
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
To: Marcelo Tosatti <marcelo.tosatti@cyclades.com>
Cc: netfilter@lists.netfilter.org

Marcelo Tosatti <marcelo.tosatti@cyclades.com> writes:

> On Sat, 3 Jan 2004, Erik Bourget wrote:
>> I had a very bizarre situation where four boxes in the same rack all
>> simultaneously (within 30 minutes) hard-locked with Oops messages.  The
>> boxes
>
> Are you using ipchains ?
>
> There is a known problem with 2.4.23 and ipchains compatibility.

I'm not /using/ it, but it was compiled as a module (and is not loaded).
Would this perhaps cause the problematic code to be compiled as a dependancy?

ipt related modules loaded:
ipt_state
ipt_REJECT
ipt_connlimit (latest patchomatic)
ip_conntrack
iptable_filter
iptable_filter
ip_tables

Thanks, 

- Erik Bourget


