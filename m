From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: getting iptables into embedded kernel
Date: Tue, 31 Jul 2007 11:12:01 +0200
Message-ID: <024c01c7d352$daf7f250$0b0ffe0a@NS006819>
References: <4244373FF2155241B4AEDE42D89F665DDB8431@MSGCELMBX.ent.bhicorp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4244373FF2155241B4AEDE42D89F665DDB8431@MSGCELMBX.ent.bhicorp.com>
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

>> How to get iptables into a ppc kernel (2.6, netfilter
>> enabled) and where to store what to have functionality from the
>> start? I used NO_SHARED_LIBS=1
>> I am able to download start the kernel, but do not find iptables.
> 
> AFAIK you cannot.
> Iptables is a *user*space utility to configure the Netfilter framework
> and I don't see how you'd compile that into the kernel.
> 
> 
> Rob
> 
> 
> Ok, I am a little confused with kernel modules. Anyhow I would like to
> do something like this here (from the install):
> "
> 4) If you want to build a statically linked version of the iptables
>    binary, without the need for loading the plugins at runtime (e.g.
>    for an embedded device or router-on-a-disk), please use
> 
> 	% make NO_SHARED_LIBS=1
> "
> 
> and I get a rather large executable binary (700kB). But I
> can't execute this nor do I know how to make it run inside my target.
> Klaus

This is something different from compiling things "into" the kernel.
You've just built a statically linked iptables binary: those binaries
don't need external libraries, which is why they are larger because the
functionality in the libraries must be present in the binary to actually
make it standalone.

So, you still get a binary called iptables which must be run from some
shell (I guess).


Rob



