From: Gioele Barabucci <dev@gioelebarabucci.com>
Subject: Re: Aren't these connections ESTABILISHED? (2nd take)
Date: Sun, 02 Oct 2005 20:11:56 +0200
Message-ID: <dhp7tp$849$1@sea.gmane.org>
References: <dhmn38$hsk$1@sea.gmane.org> <200510011907.27026.rob0@gmx.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7Bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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

/dev/rob0 wrote:
> On Saturday 2005-October-01 14:12, Gioele Barabucci wrote:
>> I spend the last weeks doing experiments with iptables but still I
>> have problems with connections that should be ESTABILISHED but are
> 
> You have it spelled correctly in the script, but perhaps you should
> check again. ESTABLISHED != ESTABILISHED. I am not sure if iptables
> would complain about that or not, but it's always safest to spell
> things correctly. :)
Couldn't english borrow more from Saxons and less from Latins. There are so
many spell-alike words in italian and english :(
I'll tell you a secret: I got it wrong the first time I wrote the script :)

>> a bit, iptables forget that the connection is ESTABILISHED and DROPs
>> the reply.
> When that happens you might want to check the conntrack table. Perhaps
> even script something to run from -j ULOG when a packet is dropped.
Can I dump the packet in a file?

> Is anything not working? I have a feeling these are just occasional
> strays that ip_conntrack isn't catching for some reason.
Sometimes the SPF policy daemon that waits for the DNS dies. But... couldn't
this be the the cause and not the effect?
If an application start up a query and dies before the server replies, would
I see packets like the ones I see in my log?

>> Here is my ruleset (BTW, I did not test much the "limit SMTP trafic",
>> do you think that it is correct?)
>> echo "Limit smtp traffic"
> If the problem is dictionary attacks be advised that this might
> not help at all. The attacker could be attempting as many as
> smtpd_recipient_limit (default 1000) usernames in a single session.
It is to make Postfix handle few messages at a time. I removed these rules,
I'll think something better later.

> Also, I'm not sure it would do anything at all, because there cannot be
> that many --state NEW connections in such a short time. Conntrack would
> call those "RELATED". I think you should try --syn, not --state NEW.
I tried with netcat and the fifth connection was DROP'd. I'll investigate
about the differences between --syn and --state NEW. Thanks for the
corrections.


-- 
Gioele <dev@gioelebarabucci.com>


