From: Herman <Herman@AerospaceSoftware.com>
Subject: Re: Port forwarding now *almost* works...
Date: Sun, 12 Oct 2003 19:52:35 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200310121952.35289.Herman@AerospaceSoftware.com>
References: <LFEHKEBEBHAFGJBMNKAOKELACCAA.markee@bandwidthco.com> <200310121917.08663.Herman@AerospaceSoftware.com> <200310121930.04757.Herman@AerospaceSoftware.com>
Reply-To: Herman@AerospaceSoftware.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200310121930.04757.Herman@AerospaceSoftware.com>
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
To: netfilter@lists.netfilter.org

Aaaaaaaaahhhhh...

It appears that nat is *not* handled by iptable_nat as one would expect, or at 
least not *only* by that one.  The missing module is iptable_mangle and the 
nice Redhat firewall script that I have been using, doesn't load that one, 
saying that it is an unneeded kernel module - sigh.

Once I loaded that with:
iptables -F -t mangle

and added my rules again, they now show up in the nat list, although it still 
doesn't friggen work.  I think it is time to reboot the whole machine and 
start over, but I thought I'll send this message first.

Wheee, at least now I'm getting somewhere and in another day or so I can stop 
banging my head on the table - maybe.

Cheers,
-- 
Herman Oosthuysen 
B.Eng(E), MIEEE
Aerospace Software Ltd.
Ph: 1.403.241-8773, Cell: 1.403.852-5545, Fx: 1.403.241-8841
Herman@AerospaceSoftware.com, http://www.AerospaceSoftware.com

