From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: SNAT
Date: Tue, 12 Nov 2002 21:29:11 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021112212916.OYRS3711.mta02-svc.ntlworld.com@there>
References: <001a01c28a8e$9af7b7b0$0401000a@robbysan.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001a01c28a8e$9af7b7b0$0401000a@robbysan.org>
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

On Tuesday 12 November 2002 9:01 pm, Rob Sterenborg wrote:

> > I want when to request internal 192.168.0.1:53 he leaves how
> > ip external
> > 200.200.200.1:53
> > I tried to do that. But no this working
> > iptables -t nat -I POSTROUTING -p udp -s 192.168.0.1 --sport 53 -j
> > SNAT --to-source 200.200.200.1:53
>
> I don't know if dns traffic is always sent *from* 53/udp, but I do
> know it is always sent *to* 53/udp.

Not *always* :-)   Sometimes it goes to 53/tcp...

Antony

-- 

With thanks to God,
For all that's come before,
For all that will come after,
But most of all, for this bit right here now.

