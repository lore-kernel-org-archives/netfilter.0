From: Julian Gomez <julianjose.gomez@getronics.com>
Subject: Re: Benchmark
Date: Wed, 14 Jul 2004 09:41:17 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040714014117.GA2183@jgomez-p-latitude.asia.unity>
References: <1089752682.6507.7.camel@aflores> <20040713151747.5af1ef20@mgalepc.utilitran.com> <1089754372.6507.19.camel@aflores>
Reply-To: julianjose.gomez@getronics.com
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1089754372.6507.19.camel@aflores>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Tue, Jul 13, 2004 at 06:32:52PM -0300, Alejandro Flores spoke thusly:

>Hello Michael,
>
>Agreed. If well designed, it will improve performance. But, what
>is the cost to send a packet to another chain? And if you have
>something like:

I don't have those numbers.

>When the packet arrives, and it's from 192.168.0.7, it will be handled
>by INPUT, then C1 and finally C1_SSH at the second rule. What I'm
>trying to discover is, what is the cost to send the packet from one
>chain to another. It's more easy to configure and maintain your rules
>with user-chains, but how much it will cost in performance, if instead
>of the above example, I use the following rules:

That's relative right? If you properly organise your user-chains taking
into account that more frequent traffic types are at the top - then
performance wise, you shouldn't be seeing that dramatic a hit.

On an old bastion host I used to control, I had 6,000++ rules running at
one time (_no optimisation_ at all). I didn't notice a performance hit,
except adding/deleting rules took a bit of time to fully finish; but
Harald has mentioned that problem before on the list - its due to the
way the rules are stored (circular link list?) IIRC.

For good security- your rulesets should be really small (where
possible!) otherwise it becomes a nightmare to maintain.

In regards to "rule sorting" google the firewall-wizards mailing list
archives, Paul Robertson has participated in a couple of interesting
threads on the subject.

(snip)

