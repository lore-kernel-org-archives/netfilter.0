From: Mike Wright <xktnniuymlla@mailinator.com>
Subject: Re: need help with ipset [SOLVED]
Date: Wed, 20 Sep 2006 09:20:42 -0700
Message-ID: <45116A5A.2090801@mailinator.com>
References: <4504CC74.3040607@mailinator.com>	<Pine.LNX.4.58.0609140855340.18386@blackhole.kfki.hu>
	<450AD4EE.3050205@mailinator.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <450AD4EE.3050205@mailinator.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

> Now I want to add a rule to iptables.
> 
>   "iptables -A INPUT -m set --set BADIPS src -j DROP"
> 
> But it errs with
> 
>   "iptables: No chain/target/match by that name"
> 
> It seems that iptables does not know about BADIPS? <Grasping />

Sorry for the noise.  This was not an ipset problem.  It was operator 
error.  My kernel modules got out of sync.  There is a BIG difference 
between "make modules install" and "make modules_install".

Thanks for the ipset module, Jozsef.  It replaced a really UGLY iptables 
ruleset with a very elegant one line solution.

:m)



