From: Duncan Sands <baldrick@free.fr>
Subject: Re: nat "regression" in 2.4.23-pre and 2.5/6
Date: Wed, 24 Sep 2003 22:11:23 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200309242211.23683.baldrick@free.fr>
References: <200309242047.41774.baldrick@free.fr> <Pine.WNT.4.55.0309241254510.1448@TIPPER.shorewall.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.WNT.4.55.0309241254510.1448@TIPPER.shorewall.net>
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
To: Tom Eastep <teastep@shorewall.net>
Cc: netfilter@lists.netfilter.org

On Wednesday 24 September 2003 21:58, Tom Eastep wrote:
> On Wed, 24 Sep 2003, Duncan Sands wrote:
> > where ppp0_masq is a user defined chain.  This no longer works with the
> > 2.4.23-pre kernels (it hasn't worked with 2.5 for a while): iptables:
> > invalid argument.
>
> I've now caught up with Duncan and have built a 2.4.23-pre5 kernel.
> Running that kernel on my firewall, I'm not seeing the behavior that
> Duncan is experiencing. My iptables is from RH Rawhide (1.2.8-8.80.2).

Interesting - I will look into it tomorrow.  Maybe it is just a bug after all.

Good night!

Duncan.

