From: Herman <Herman@AerospaceSoftware.com>
Subject: Re: Port forwarding doesn't work.
Date: Sun, 12 Oct 2003 16:04:06 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200310121604.06545.Herman@AerospaceSoftware.com>
References: <LFEHKEBEBHAFGJBMNKAOKELACCAA.markee@bandwidthco.com> <200310121411.00898.Herman@AerospaceSoftware.com> <1065994862.3562.10.camel@Marvin>
Reply-To: Herman@AerospaceSoftware.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1065994862.3562.10.camel@Marvin>
Content-Disposition: inline
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
To: Gerd Zemella <gzemella@gmx.net>
Cc: netfilter@lists.netfilter.org


Well, here goes:
iptables -t nat -I PREROUTING  -d 192.168.10.100 -j DNAT --to 192.168.10.245
iptables: Target problem

At least, now the error message changed and the only difference from before is 
the -I instead of -A.

So, with -A, I get Invalid Argument, and with -I, I get Target Problem.  Both 
cases don't work and the rule doesn't get added.

Can anybody give me a clue?

Cheers,
-- 
Herman Oosthuysen 
B.Eng(E), MIEEE
Aerospace Software Ltd.
Ph: 1.403.241-8773, Cell: 1.403.852-5545, Fx: 1.403.241-8841
Herman@AerospaceSoftware.com, http://www.AerospaceSoftware.com

