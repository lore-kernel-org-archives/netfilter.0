From: Maximilian Wilhelm <max@rfc2324.org>
Subject: Re: two subnets...
Date: Wed, 1 Aug 2007 15:38:04 +0200
Message-ID: <20070801133804.GB8336@outback.rfc2324.org>
References: <46ADBDF0.3020200@mp.pl> <46AF4FC7.1000500@riverviewtech.net>
	<46AF8D63.8080900@interia.pl> <46AF9694.1060709@riverviewtech.net>
	<46AFBA57.3040702@mailinator.com>
	<46AFC5BB.7050701@riverviewtech.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <46AFC5BB.7050701@riverviewtech.net>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Am Tuesday, den 31 July hub Grant Taylor folgendes in die Tasten:

Hi!

[..].
> >-A FORWARD -physdev --physdev-in eth0 --physdev-out eth2 -j DROP
> >-A FORWARD -physdev --physdev-in eth2 --physdev-out eth0 -j DROP
> >-A FORWARD -j ACCEPT

> I have never worked with the physdev match extension so I can not say 
> for sure.  I do not recall which features were being taken out of main 
> line NetFilter code, but I want to say that physdev was one of them, 
> thus meaning you would have to keep patching the kernel when you upgrade 
> to make this work.  Thus in my opinion making the EBTables option more 
> maintainable and thus more appealing.

The physdev match is in the vanilla kernel for some time now.
I've used it on several bridgewall without patching the kernel.

max@pandora:linux-2.6.21.3$ grep PHYSDEV net/netfilter/Kconfig 
config NETFILTER_XT_MATCH_PHYSDEV

Ciao
Max
-- 
	Follow the white penguin.

