From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Update Iptables in order to use String-Match
Date: Tue, 4 Apr 2006 07:52:13 +0200
Message-ID: <000e01c657ab$ed115cc0$0101000a@sterenborg.info>
References: <44311E2F.20907@hin.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <44311E2F.20907@hin.de>
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

>> The last part between the brackets, I suppose iptables wrote it ? (I
>> think I got confused there.) If this is true, you have the string
>> match from 1.3.3 installed (if you already had it, why build a new
>> kernel/iptables ?) and are using iptables 1.3.5. (That means you
>> have iptables-1.3.5 installed but didn't install string match 1.3.5
>> which would be true, reading below.) 
>> 
>>>> The string match is in the Extra repository. Did you run POM with
>>>> "./runme extra" ?
>>> hmm no, I will do this now...
>> 
>> I think that will solve your problem.
>> (Remember to also recompile iptables..)
> 
> The last version of POM does not content String-match!
> I found it in a version of 2004, is that right?

Hm. I never used it so I never noticed ; it indeed appears to be dropped
or something.
If you really need it (we don't know what you actually want to do, so
maybe there's another/better way), maybe you can use an old POM for just
the string match, and a recent POM for the rest.. But I'm not sure if
that's such a good idea or even if that will break something : it's up
to you.


Gr,
Rob


