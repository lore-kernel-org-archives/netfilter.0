From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: REJECT target not as policy
Date: Tue, 21 Aug 2007 07:26:25 +0200
Message-ID: <000401c7e3b3$d168dcb0$0101000a@tanjian>
References: <20070820135206.GA18644@bart.bertram-scharpf.homelinux.com>	<200708201608.39032.r.laban@ism.nl>	<46C9B8A2.5040201@plouf.fr.eu.org><20070820174642.GA22613@bart.bertram-scharpf.homelinux.com>	<46C9E0E4.2080200@plouf.fr.eu.org><000801c7e35d$f7d39210$0101000a@tanjian>
	<46C9F94B.7010503@plouf.fr.eu.org>
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <46C9F94B.7010503@plouf.fr.eu.org>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

>> You could emulate a REJECT policy by having this as the very last
>> rules:
>>
>> $ipt -A INPUT -p tcp -j REJECT --reject-with tcp-reset
>> $ipt -A INPUT -j REJECT
>>
>> (I thought it was like this..)
>
> What was like what ?

Emulating a REJECT policy. If I'm not mistaken a closed tcp port
responds with tcp-reset and others with icmp-port-unreachable (REJECT's
default).
If the OP was told to set a REJECT policy, I think it would have been
with this in mind.

>> But, if you dynamically add rules then you have to take care of
>> at/from which position you insert/delete them.
>
> A user-defined chain comes in handy. Jump into it before the REJECT
> rules and add the dynamic rules in it.
>
> iptables -N input
> iptables -A INPUT -j input
> iptables -A INPUT -j REJECT
>
> iptables -A input blah...

Yes, I that's how I would do it.



