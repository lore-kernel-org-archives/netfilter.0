From: Tom Eastep <teastep@shorewall.net>
Subject: Re: nat "regression" in 2.4.23-pre and 2.5/6
Date: Wed, 24 Sep 2003 12:58:12 -0700 (Pacific Daylight Time)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.WNT.4.55.0309241254510.1448@TIPPER.shorewall.net>
References: <200309242047.41774.baldrick@free.fr>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200309242047.41774.baldrick@free.fr>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Duncan Sands <baldrick@free.fr>
Cc: netfilter@lists.netfilter.org

On Wed, 24 Sep 2003, Duncan Sands wrote:

>
> where ppp0_masq is a user defined chain.  This no longer works with the
> 2.4.23-pre kernels (it hasn't worked with 2.5 for a while): iptables: invalid argument.
>

I've now caught up with Duncan and have built a 2.4.23-pre5 kernel.
Running that kernel on my firewall, I'm not seeing the behavior that
Duncan is experiencing. My iptables is from RH Rawhide (1.2.8-8.80.2).

-Tom
--
Tom Eastep    \ Nothing is foolproof to a sufficiently talented fool
Shoreline,     \ http://shorewall.net
Washington USA  \ teastep@shorewall.net

