From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: problem with forward/nat
Date: Sun, 7 Mar 2004 18:37:16 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403071837.16641.Antony@Soft-Solutions.co.uk>
References: <BAY1-F168WzqJX7rVGS00004a39@hotmail.com> <1078683840.404b68c0641ac@realdealz.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1078683840.404b68c0641ac@realdealz.ch>
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

On Sunday 07 March 2004 6:24 pm, Fabian Hartmann wrote:

> > hello,
>
> Hi Pierre
>
> > #forward
> >
> > iptables -A FORWARD -s 192.168.1.0/24 -j ACCEPT -o eth0
>
> The rule above won't work! you must set the -o flag before you set the -j
> <TARGET> i. e. iptables -A FORWARD -o eth0 -s 192.168.1.0/24 -j ACCEPT

My netfilter accepts it perfectly well, and afterwards "iptables -L FORWARD 
-nvx" shows:

pkts   bytes target    prot opt in     out     source              destination
   0     0 ACCEPT    all  --  *      eth0    192.168.1.0/24       0.0.0.0/0

> Otherwise the rule won't be accepted by iptables and you have no rule that
> accepts  forwarded traffic when the default policy for the FORWARD chain is
> set to DROP.

Let me know which version of netfilter you have a problem with using the above 
syntax - admittedly it's non-standard, but it seems to work okay.

Antony.

-- 
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing on usenet and in e-mail?

                                                     Please reply to the list;
                                                           please don't CC me.


