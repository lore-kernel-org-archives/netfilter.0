From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: PPTP connection tracking and Poptop on same box
Date: Mon, 19 Jan 2004 00:03:32 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401190003.32170.Antony@Soft-Solutions.co.uk>
References: <739652C2AFA4834AAB5986A215F68CEC4977@svr1.home.compsup.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <739652C2AFA4834AAB5986A215F68CEC4977@svr1.home.compsup.net>
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

On Sunday 18 January 2004 11:47 pm, Carl Farrington wrote:

> From: Antony Stone [mailto:Antony@Soft-Solutions.co.uk]
>
> > On Sunday 18 January 2004 11:00 pm, Carl Farrington wrote:
> > > Does anybody know if there is a workaround for this problem? As soon
> > > as I insmod ip_nat_pptp , poptop cannot accept any incoming pptp
> > > connections.
>
> > Why do you want to use both of these on the same box?

> Well, I want to do both. I am putting together a router/gateway box. It
> performs NAT for all the workstations on the private side of the box
> (hence the need for ip_nat_pptp since some workstations need to contact
> outside pptp servers), and also allows access from the outside when
> users are roaming (hence the need for poptop).
>
> Astaro Security Linux (www.astaro.com) is one product which achieves
> this without problem using poptop, as is win2k rras.

In that case your simplest solution might be to ask Astaro how they've done 
it.   Their products are based on Linux / netfilter etc, so should be fully 
GPL.

Antony

-- 
The difference between theory and practice is that in theory there is no 
difference, whereas in practice there is.


