From: Jason Opperisano <opie@817west.com>
Subject: Re: Fwd: set up my DMZ
Date: Sun, 19 Sep 2004 09:40:07 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1095601207.1723.4.camel@wolfpack.ljm.dom>
References: <web-3246067@infinito.it>
	<1095356390.2489.70.camel@wolfpack.ljm.dom>
	<1403218a0409190112632977da@mail.gmail.com>
	<1403218a040919011254781075@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1403218a040919011254781075@mail.gmail.com>
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

On Sun, 2004-09-19 at 04:12, Mohamed Eldesoky wrote:
> >   ip address add x.x.x.52 dev eth1
> >   ip address add x.x.x.53 dev eth1
> >
> 
> He really needs to do this step ????
> The firewall is his gateway !!

yes.  he does.  the firewall is his gateway on the inside/dmz.  these IP
aliases are on the outside, internet-facing interface.

-j

-- 
Jason Opperisano <opie@817west.com>


