From: Kevin Dwyer <kevin.dwyer@algx.net>
Subject: Re: Creating a Hybrid Connection to Balance Traffic
Date: Sat, 26 Oct 2002 21:28:54 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021026212854.5da2995f.kevin.dwyer@algx.net>
References: <20021026190433.24795.qmail@web40607.mail.yahoo.com>
	<39397.192.168.7.14.1035674081.squirrel@iw.k1k2.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <39397.192.168.7.14.1035674081.squirrel@iw.k1k2.com>
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

On Sun, 27 Oct 2002 10:14:41 +1100 (EST)
Andrew Smith <nfml@k1k2.com> wrote:

> Use google to look up egress, but basically it means that they
> may only allow the source IP of outgoing packets to match the
> IP address they supply you and they drop all other packets.
> This is apparently common in the USA.

But distressingly not common enough.

I know for a fact that Verizon does do this with their DSL which uses
PPPoE (except I was hypothetically testing some theoretical spoofing
ideas ;). I know for a fact dozens of ISPs who do not because it would
load their equipment to excess.

-- 
/* Kevin Dwyer                                Allegiance Internet */
/* network security engineer                   Commerce Center II */
/* email: Kevin.Dwyer@algx.net                7601 Ora Glen Drive */
/* phone: 240-616-2075                        Greenbelt, MD 20770 */
/*      >++++++++++[<++++++++++>-]<.+++++.----.[-]++++++++++.     */


