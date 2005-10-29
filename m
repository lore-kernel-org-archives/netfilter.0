From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: why can't use connlimit ??
Date: Sat, 29 Oct 2005 10:11:46 +0200
Message-ID: <20051029081703.0AB336A8F8@smtp.sterenborg.info>
References: <43a0cdcb0510282100q5473c6eav@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43a0cdcb0510282100q5473c6eav@mail.gmail.com>
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

> do you mean iptalbes can work without netfilter? or I can use

No. iptables is the userspace utility to set rules for netfilter.

> connlimit function just only with a libipt_connlimit.so file?
> then how to do it. I try to use modprobe to load the library,
> but it said to me that no such module could be found. to load
> a .so fromat module need a diffrent way?

The .so is not a kernel module but a shared object. You don't load
shared objects yourself.


Gr,
Rob


