From: Martin Josefsson <gandalf@wlug.westbo.se>
Subject: Re: PPTP+NAT+MASQ anyone?
Date: 09 Dec 2002 13:25:46 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1039436746.25961.15.camel@tux>
References: <200212091226.23888.roy@karlsbakk.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200212091226.23888.roy@karlsbakk.net>
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
To: Roy Sigurd Karlsbakk <roy@karlsbakk.net>
Cc: Netfilter mailinglist <netfilter@lists.netfilter.org>

On Mon, 2002-12-09 at 12:26, Roy Sigurd Karlsbakk wrote:
> hi
> 
> I've kept trying now. many times, to do NAT+MASQ+PPTP, but as soon as I 
> compile 2.4.18 (the only one I've managed to patch-o-matic) and boot it, it 
> refuses to -j MASQUERADE. (invalid argument). Are anyone running this?

recompile userspace iptables against that kernel.

And patch-o-matic from cvs works with at least 2.4.19 (2.4.18 and .20
should work aswell)

-- 
/Martin

Never argue with an idiot. They drag you down to their level, then beat
you with experience.

