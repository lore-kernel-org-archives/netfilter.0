From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: bandwidth again maybe O T
Date: Thu, 5 Sep 2002 11:00:03 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209051000.g85A0Ev32654@vulcan.rissington.net>
References: <200209041908.49707@.> <3D77196B.7090301@iprimus.com.au> <3D773301.9040109@iprimus.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3D773301.9040109@iprimus.com.au>
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

On Thursday 05 September 2002 11:33 am, Michael wrote:

> Ohh toss....
>
> My appologies, I shall clarify:
>
> If a packet originates from local processes, and is destined for a local
> process, the INPUT chain is traversed only.

That's not *quite* right - a packet from a local process to a local process 
traverses both the OUTPUT and INPUT chains (in that order).

Antony

-- 

Documentation is like sex:
when it's good, it's very very good;
when it's bad, it's still better than nothing.


