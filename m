From: Gavin Hamill <gdh@acentral.co.uk>
Subject: Re: Iptables forwarding
Date: Tue, 22 Mar 2005 10:47:39 +0000
Message-ID: <200503221047.39552.gdh@acentral.co.uk>
References: <BAY21-F1133FDC9FA14439DDF527AA14E0@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <BAY21-F1133FDC9FA14439DDF527AA14E0@phx.gbl>
Content-Disposition: inline
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

On Tuesday 22 March 2005 10:33, N Gal wrote:
> Hallo,
>
> I'm  trying to set up a 'statistics box' that should simply IP forward
> everything from one ethernet card to the other (Transparent Firewall?) in
> the same subnet. The problem is that it will not do this. Any suggestions
> welcome...

You want this : http://ebtables.sf.net

Short version - use a 2.6 kernel and when you configure Linux Bridging 
(interface br0 spanning eth0 and eth1, for example), you will be able to 
apply rules, or simply count the number of packets matching rules / 
interfaces...

If you use a 2.4 kernel, you will need to patch it (see URL above)

Cheers,
Gavin.


