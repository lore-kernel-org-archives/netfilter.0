From: Sven Koch <haegar@sdinet.de>
Subject: Re: can iptables do this?
Date: Tue, 21 May 2002 14:27:51 +0200 (CEST)
Sender: netfilter-admin@lists.samba.org
Message-ID: <Pine.LNX.4.44.0205211422380.4011-100000@space.comunit.de>
References: <200205211157.MAA18294@slate.rockstone.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <200205211157.MAA18294@slate.rockstone.co.uk>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Antony Stone <Antony@Soft-Solutions.co.uk>
Cc: netfilter@lists.samba.org

On Tue, 21 May 2002, Antony Stone wrote:

> On Tuesday 21 May 2002 10:47 am, Eduardo GARCIA wrote:
> > For example my network is 1.2.3.0 and I want that a host with an IP from
> > any unknown network (i. e. 10.9.8.7) can navigate.
>
> No way.   You can't create a network which will allow a host with some
> arbitrary preset IP address (and gateway, and DNS...) to come along an plug
> into - for two reasons:

You can, at least one commercial device does right that - see
www.nomadix.com for ther usg (universal subscriber gateway).

It seems to be some kind of "answer to every arp request" combined with
nat - won't be easy, but it should be doable with iptables and some
home-grown programs.

c'ya
sven

-- 

The Internet treats censorship as a routing problem, and routes around it.
(John Gilmore on http://www.cygnus.com/~gnu/)


