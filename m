From: Buddy wu <ejournal4me@gmail.com>
Subject: Re: Re: iptables problem
Date: Wed, 2 Nov 2005 09:37:39 +0800
Message-ID: <43a0cdcb0511011737r266fc4fj@mail.gmail.com>
References: <4367AEA5.7080501@pcraft.com>
	<43a0cdcb0511011631k1bd1cfci@mail.gmail.com>
	<43681694.1040406@pcraft.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43681694.1040406@pcraft.com>
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
To: "Ashley M. Kirchner" <ashley@pcraft.com>
Cc: netfilter@lists.netfilter.org

>     Problem is that while they can connect OUT, nothing from the outside
> can connect to them.

I think you should load the ip_nat_ftp and ip_conntrack_ftp moudles.
do you load them?

