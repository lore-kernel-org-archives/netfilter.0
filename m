From: "Jeremy C. Reed" <reed@reedmedia.net>
Subject: RE: Desktop sharing with netmeeting
Date: Mon, 19 May 2003 11:53:41 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.43.0305191147160.1090-100000@pilchuck.reedmedia.net>
References: <ABEKJILKOKKGGDJKHKDFEEFFCBAA.patrick@vikus.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <ABEKJILKOKKGGDJKHKDFEEFFCBAA.patrick@vikus.com>
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
To: Patrick Ahler <patrick@vikus.com>
Cc: netfilter EMAIL <netfilter@lists.netfilter.org>

On Mon, 19 May 2003, Patrick Ahler wrote:

> I've patched the kernel with h323. Got netmeeting to talk through netfilter
> by opening tcp ports 389 522 1503 1720 1731, and udp everything above 1200,
> but if I want to do desktop sharing netmeeting won't allow it unless the
> firewall is down. Help?

Try having iptables do some logging to see what is blocking.

Have a look at  http://www.roeder.goe.net/~koepi/newnat.html

And
http://www.netfilter.org/documentation/pomlist/pom-extra.html#h323-conntrack-nat

   Jeremy C. Reed
   http://www.reedmedia.net/


