From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: iptables related
Date: Mon, 8 Dec 2003 19:42:21 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312081942.21166.Antony@Soft-Solutions.co.uk>
References: <20031208191947.GA1603@msservices> <200312081435.00136.JALaramie@Loudoun-Fairfax.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200312081435.00136.JALaramie@Loudoun-Fairfax.com>
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

On Monday 08 December 2003 7:35 pm, Jeffrey Laramie wrote:

> On Monday 08 December 2003 14:19, Jeffrin wrote:
> > hello all,
> >
> > iptables -A INPUT -sport 80 -j ACCEPT
> >
> > shows error ...
> >
> >  msservices:~# iptables -A INPUT --sport 80 -j ACCEPT
> > iptables v1.2.9: Unknown arg `--sport'
> > Try `iptables -h' or 'iptables --help' for more information.
> >
> > please help me ...
>
> There are 2 dashes before sport:  --sport 80

2 dashes and a protocol :)

Antony.

-- 
Behind the counter a boy with a shaven head stared vacantly into space,
a dozen spikes of microsoft protruding from the socket behind his ear.

 - William Gibson, Neuromancer (1984)

                                                     Please reply to the list;
                                                           please don't CC me.


