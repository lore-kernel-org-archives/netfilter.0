From: Jason Opperisano <opie@817west.com>
Subject: Re: Fw: Upgrading kernel 2.4.26 cuts out DNAT --to rules.....!!??
Date: Wed, 2 Feb 2005 11:20:51 -0500
Message-ID: <20050202162051.GA331@bender.817west.com>
References: <004c01c50940$a5c53950$1d01000a@cingo.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <004c01c50940$a5c53950$1d01000a@cingo.net>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Wed, Feb 02, 2005 at 02:02:51PM -0200, Emilio Lombardo wrote:
> So what we did was upgrading to iptables 1.2.11 on kernel 2.4.26  and recompiling it whithin patch-o-matic and it worked out !
> Now we got simultaneous and various vpn on gre protocol perfectly working passing by the firewall whitout any problem (and of course it was really the firewall because we tested the vpn's bypassing it and they worked.all toghether...)
> Well...now when everithing looked working but than debugging the internal rules we saw that any attempt to add a "DNAT --to" always got an answer of 
> Invalid Argument ..........the same rules that before was working ....!!!!!And here came the problem.....
> How is it possible for us making both instances (The VPN's and the DNAT --to rules) work togheter...is there any linux guru...:-) who can lend a hand and help us to find a way out in this maze ?

it sounds like you didn't compile iptables *after* applying POM and
recompiling your kernel.  steps are:

apply patches from POM
recompile kernel
recompile iptables

-j

--
"Simpson, Homer Simpson, he's the greatest guy in his-tor-y. From
 the town of Springfield, he's about to hit a chestnut tree....D'oh!"
        --The Simpsons

