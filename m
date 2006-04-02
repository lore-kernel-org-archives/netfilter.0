From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Update Iptables in order to use String-Match
Date: Mon, 3 Apr 2006 00:31:31 +0200
Message-ID: <001b01c656a5$314bc680$0101000a@sterenborg.info>
References: <44304504.7010808@hin.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <44304504.7010808@hin.de>
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

>> So your iptables isn't installed or installed in a different path
>> than the original.
> hmm bad...how do I correct this?

>> iptables: match `string' v1.3.3 (I'm v1.3.5)

The last part between the brackets, I suppose iptables wrote it ? (I
think I got confused there.)
If this is true, you have the string match from 1.3.3 installed (if you
already had it, why build a new kernel/iptables ?) and are using
iptables 1.3.5. (That means you have iptables-1.3.5 installed but didn't
install string match 1.3.5 which would be true, reading below.)

>> The string match is in the Extra repository. Did you run POM with
>> "./runme extra" ? 
>
> hmm no, I will do this now...

I think that will solve your problem.
(Remember to also recompile iptables..)


Gr,
Rob


