From: Josh Nerius <jnerius@gmail.com>
Subject: Re: Fwd: Linux as router (Gateway Server)
Date: Mon, 14 Feb 2005 20:32:38 -0600
Message-ID: <4f3930a70502141832715b4043@mail.gmail.com>
References: <1dceb012050211233357e23dd4@mail.gmail.com>
	<1dceb01205021123483860fb86@mail.gmail.com>
	<1108216901.4462.27.camel@hubcap.ljm.dom>
	<4f3930a705021214026db11902@mail.gmail.com>
	<420EB7C3.7040303@hotpop.com>
	<4f3930a70502121833627af1bd@mail.gmail.com>
	<420F4010.7050609@hotpop.com>
	<4f3930a705021313382ed454fe@mail.gmail.com>
	<1108419310.4338.4.camel@hubcap.ljm.dom>
Reply-To: Josh Nerius <jnerius@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <1108419310.4338.4.camel@hubcap.ljm.dom>
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

> didn't someone in this thread already point out that his rules don't
> include:
> 
>   iptables -A INPUT -i lo -j ACCEPT
>   iptables -A OUTPUT -o lo -j ACCEPT
> 
> -j

Yes, I believe I said something to that effect in my original reply. 


-- 
Math problems? Call 1-800-[(10x)(13i)^2]-[sin(xy)/2.362x]

