From: David Lang <david.lang@digitalinsight.com>
Subject: Re: iptables 1.2 in an AMD64 bit kernel howto ??
Date: Fri, 13 Jul 2007 12:52:37 -0700 (PDT)
Message-ID: <Pine.LNX.4.63.0707131252130.17664@qynat.qvtvafvgr.pbz>
References: <4697479B.9040707@ditro.com>
	<200707130949.l6D9nBlY008820@toshiba.co.jp>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200707130949.l6D9nBlY008820@toshiba.co.jp>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Yasuyuki KOZAKAI <yasuyuki.kozakai@toshiba.co.jp>
Cc: netfilter@lists.netfilter.org

On Fri, 13 Jul 2007, Yasuyuki KOZAKAI wrote:

> From: BipinDas - Ditro <bipindas.k@ditro.com>
> Date: Fri, 13 Jul 2007 15:06:27 +0530
>
>> Dear List,
>>
>> I do have a server with Debian-2.6.8-12-amd64-generic kernel image on
>> AMD64 processor.
>> When i try to enter the command iptables -L -n -v the following error
>> happens.
>>
>> "iptables v1.2.11: can't initialize iptables table `filter': Module is
>> wrong version
>> Perhaps iptables or your kernel needs to be upgraded"
>>
>>  Please let me know how can i solve it?
>
> The old kernels have '64bit kernel and 32bit userland' problem.
> Your iptables is 32bit binary (try readelf -a `which iptables`) ? If so,
> building 64bit binary of iptables will solve the problem. Upgrading the
> recent kernel should also solve it, of cause.

what kernel versions are recent enough to have this problem solved?

David Lang

