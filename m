From: "Patrick Ahler" <patrick@vikus.com>
Subject: RE: Desktop sharing with netmeeting
Date: Mon, 19 May 2003 16:27:00 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <ABEKJILKOKKGGDJKHKDFEEGACBAA.patrick@vikus.com>
References: <Pine.LNX.4.43.0305191147160.1090-100000@pilchuck.reedmedia.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.43.0305191147160.1090-100000@pilchuck.reedmedia.net>
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
To: "Jeremy C. Reed" <reed@reedmedia.net>
Cc: netfilter EMAIL <netfilter@lists.netfilter.org>

ok... that would lead to my next question =) how do I do any logging?

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Jeremy C. Reed
Sent: Monday, May 19, 2003 2:54 PM
To: Patrick Ahler
Cc: netfilter EMAIL
Subject: RE: Desktop sharing with netmeeting


On Mon, 19 May 2003, Patrick Ahler wrote:

> I've patched the kernel with h323. Got netmeeting to talk through
netfilter
> by opening tcp ports 389 522 1503 1720 1731, and udp everything above
1200,
> but if I want to do desktop sharing netmeeting won't allow it unless the
> firewall is down. Help?

Try having iptables do some logging to see what is blocking.

Have a look at  http://www.roeder.goe.net/~koepi/newnat.html

And
http://www.netfilter.org/documentation/pomlist/pom-extra.html#h323-conntrack
-nat

   Jeremy C. Reed
   http://www.reedmedia.net/





