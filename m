From: active <activeNO@SPAMdespammed.com>
Subject: Re: MAC addresses
Date: Sat, 11 Sep 2004 22:01:59 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20040911220159.4cee40bb@oldskool.actisystem.nix>
References: <200409111150.50506.bulliver@badcomputer.no-ip.com>
Reply-To: activeNO@SPAMdespammed.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200409111150.50506.bulliver@badcomputer.no-ip.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On "Sat 11 of September 2004" Darren Kirby wrote:

> Are MAC addresses unique for all ethernet cards? What I would like to
> know is could I use this rule to allow ssh connections ONLY from my
> notebook no matter what its current IP address happens to be, and drop
> all other connection requests?

Yes. MAC addresses are set in the card by the manufacturer. This is a
good method to control input traffic.

For more info: http://www.webopedia.com/TERM/M/MAC_address.html

