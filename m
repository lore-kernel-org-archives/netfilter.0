From: George Alexandru Dragoi <waruiinu@gmail.com>
Subject: Re: Fw: Problem with CONNMARK
Date: Fri, 29 Oct 2004 10:15:38 +0300
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <3063e50410290015da521fd@mail.gmail.com>
References: <002701c4bd79$589838c0$2a245cc2@cea05>
Reply-To: George Alexandru Dragoi <waruiinu@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <002701c4bd79$589838c0$2a245cc2@cea05>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

You need to get the latest iptables source and recompile it against
the kernel source you are running.


On Fri, 29 Oct 2004 07:37:07 +0200, Tomek Macioszek <tomekm@cea.pl> wrote:
> Hi!
> I have problems with use target CONNMARK. When I type command :
> iptables -j CONNMARK -h
> output gives me  information that iptables is compiled with this options,
> but when I use command like this i.e.:
> iptables -t mangle -A PREROUTING -p tcp -j CONNMARK --restore-mark
> system couldn't do this. It write to me :
> iptables: No chain/target/match by that name
> 
> My system: FEDORA 2
> KERNEL: 2.6.5 ( compiled with target CONNMARK)
> IPTABLET: v 1.2.9.
> What is wrong wiht it??
> Sorry for my English
> Best regards
> Tomek
> 
> 


-- 
Bla bla

