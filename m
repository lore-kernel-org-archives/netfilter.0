From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: TWO ROUTING
Date: Thu, 20 Nov 2003 13:25:53 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031120182553.GC21892@cannon.eng.us.uu.net>
References: <E1AMU5R-0001oJ-Io@vishnu.netfilter.org> <3FBCC194.1080008@Loudoun-Fairfax.com> <200311201340.hAKDeN722163@onyx.rockstone.co.uk> <3FBCD315.3020902@Loudoun-Fairfax.com> <20031120164218.GA21892@cannon.eng.us.uu.net> <3FBCE8C8.6070100@Loudoun-Fairfax.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <3FBCE8C8.6070100@Loudoun-Fairfax.com>
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
Content-Transfer-Encoding: 7bit
To: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Cc: netfilter@lists.netfilter.org

On Thu, Nov 20, 2003 at 11:16:08AM -0500, Jeffrey Laramie wrote:

> Interesting. I take it you're referring to the "TEQL" device?

Isn't TEQL for loadbalancing (bundling two or more interfaces terminating
on the same remote device)? No, I was referring to the "ip ro ..."
command which gives you tons of options, including multiple default
routes, routing dicision based on other stuff than only the dst addr...


> Is this 
> installed by a kernel module? From the iptables perspective (trying to 
> stay at least marginally on topic!) if you used this would you use -i 
> eth0 or -i teql0 to identify the interface?

If you bundled eth0 and eth1 to have teql0 then the rules should
reference teql0.

Also, please note that the TEQL stuff is linux specific (interoperability
issues).

Ramin

> Jeff

