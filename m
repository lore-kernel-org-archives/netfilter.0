From: Alexandre Hautequest <hquest@linuxbr.com.br>
Subject: Limiting connections per time
Date: 26 May 2003 17:37:41 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1053981461.32547.24.camel@clk-gtk.sigmaperitos>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

Hello all.

First sorry if this had already replied before, but i found nothing in
ml archives. Second, sorry about my poor english.

Can i use netfilter to limit a number of connections allowed in a
per-time basis? Lets take this as an example:

I have a UDP shoutcast server. A want to limit its external access to
only one connection per IP for 30 minutes. Then i set up some rule (this
rule is what i want to know if is possible and if so, how can i do this,
what mods i need, and so on). Clients start to connect in (opens one
*session*). Another people is opening a 2nd connection (maybe behind a
NAT gw) and tries to connect in. It should block him. At the end of
time, the first *session* should be automaticaly blocked again (maybe
using my default DROP policy). A new connection can be accepted at this
time, but not as its continuation -- i mean, start another *session*.

This is what i have in mind, not actually for a shoutcast server, but is
almost this situation i have. 

Im not subscribed, so please cc me.

Again sorry for my poor english, and thanks in advance for your time.

--
Alexandre Hautequest

