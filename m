From: Vladimir Mosgalin <mosgalin@VM10124.spb.edu>
Subject: Re: Dynamic change of iptables (building Wi-Fi hotspot)
Date: Sun, 4 Jul 2004 22:10:37 +0400 (MSD)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.58.0407042142420.8244@localhost.localdomain>
References: <Pine.LNX.4.58.0407042011460.3513@localhost.localdomain>
 <200407041803.40828.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200407041803.40828.Antony@Soft-Solutions.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Sun, 4 Jul 2004, Antony Stone wrote:

AS>DNAT rules belong in the PREROUTING chain, nat table, not the FORWARD chain, 
AS>filter table :)

Ah.. yes. Well, I had an example that used my own chain, and incorrectly
changed it for simplicity before posting.

AS>Also, instead of -j DNAT --to 127.0.0.1, I think you should use -j REDIRECT.

Right. That was a quick&dirty example, I forgot about that.

AS>I see no reason not to change netfilter rules as often as you like.
AS>After all, adding one rule when a user registers, and removing one
AS>rule when they unregister or time out, is unlikely to be a large
AS>quantity of changes.

Yes, but who knows, maybe when changing tables a lot something will
overflow after a month or so, or maybe some packets will be dropped.
And I may need to add or remove two rules (one for ICMP, because ICMP
won't be just dropped or accepted, but filtered though another chain).

AS>As for whether the several scripts are a problem - that depends on
AS>how good the scripts are :)   I don't see that they need to be at all
AS>complicated - the interesting part is going to be looking up the
AS>username / password (PHP / MySQL would seem an obvious candidate for
AS>this?), and then checking at regular intervals to see whether the
AS>time has been exceeded and the user need disconnecting.

Yes, php, mysql & perl are the choosen tools, but it would be a bit more
complicated. For example, there should be ULOG rule and one of the
script will have to analyze ulogd's mysql dumps.

AS>Note, by the way, that if a user has an established connection, then
AS>neither changing the DNAT rule/s, nor removing their FORWARD rule
AS>from netfilter will result in their connection being terminated - you
AS>will need to explicitly add a DROP rule either at the top of the
AS>FORWARD chain (before the -m state --state ESTABLISHED,RELATED rule),
AS>or else in one of the mangle tables, in order to make sure the
AS>connection gets cut off.

Thanks, I'll note this.

AS>The other thing I would say is that because you are talking about
AS>doing this over a wireless link, I think you *really* should use
AS>HTTPS, not HTTP, otherwise someone else in the vicinity will simply
AS>sniff the traffic, find out a valid username & password, and use it
AS>themselves.
AS>
AS>I recommend the Apache 404 error handler redirects to an https: login
AS>page and you accept the username & password there.

Actually, that was the reason why 404 redirects to other page, not
displays login page itself ;)

-- 

Vladimir

