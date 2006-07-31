From: Pedro Werneck <pedro.werneck@terra.com.br>
Subject: Re: Connection through gateway fails in a random basis
Date: Mon, 31 Jul 2006 14:53:48 -0300
Message-ID: <20060731145348.779b4055.pedro.werneck@terra.com.br>
References: <20060730221120.7668ee28.pedro.werneck@terra.com.br>
	<44CE37FA.4050005@mailinator.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <44CE37FA.4050005@mailinator.com>
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

On Mon, 31 Jul 2006 10:03:54 -0700
list user <xktnniuymlla@mailinator.com> wrote:

> Hi Pedro,
> 
> I can't answer your question but I can point out what looks like a 
> serious error in your rules -- the firewall is wide open.  You should 
> either change your default policy on the INPUT chain to DROP, or you 
> should append a rule "-A INPUT -j DROP".
> 
> For my personal preference I always start with no rules and default 
> policy of DROP on both INPUT and FORWARD, then begin adding rules to 
> allow specific traffic.

Yes... I know that. I changed it in the hope it would fix the problem
and then I could add another rules to find exactly what it is.


Thanks

-- 
Pedro Werneck

