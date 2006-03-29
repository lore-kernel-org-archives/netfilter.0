From: bash <0x62ash@gmail.com>
Subject: Re: help me (nfcan: addressed to exclusive sender for this address)
Date: Wed, 29 Mar 2006 21:54:58 +0400
Message-ID: <20060329215458.bf063d97.0x62ash@gmail.com>
References: <20060329041937.7d7f5bbb.0x62ash@gmail.com>
	<1143597051.12219.91.camel@localhost>
	<20060329072933.26ba1e7a.0x62ash@gmail.com>
	<20060329042226.GK7855@salty>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060329042226.GK7855@salty>
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
Cc: netfilter@lists.netfilter.org

On Tue, 28 Mar 2006 23:22:26 -0500
Jim Laurino <nfcan.x.jimlaur@dfgh.net> wrote:

> I am not an expert on this,
> but for what it is worth:
> 
> Perhaps the rules used to detect
> and limit brute force ssh attacks
> could be adapted to your need.

You are talking about "recent" module... I don't know how I can use
it in my situation....
 
> Does NetLook have a predictable pattern?

Forget about NetLook...

My criteria for blocking is:
if rate of SYN packages from ONE source IP is greater then 3packets/sec
=> then block this IP

And i can't add rule "-m limit" per all source IP in my net,
because my net is big (~255^3)....

> You can find out about the ssh blocking rules
> if you search the archives for 'brute force'.
> 
> Hope that helps.



-- 
Biomechanica Artificial Sabotage Humanoid

