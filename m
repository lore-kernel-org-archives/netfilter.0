From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: [despammed] -i and -o options for iptables FORWARD chain
Date: Fri, 2 Jan 2004 14:03:02 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401021403.02171.Antony@Soft-Solutions.co.uk>
References: <009a01c3cff6$ee23bd90$a5bbd00c@issaquah> <20040102133002.GA6057@kaufbach.delug.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040102133002.GA6057@kaufbach.delug.de>
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

On Friday 02 January 2004 1:30 pm, Andreas Kretschmer wrote:

> am  Wed, dem 31.12.2003, um 15:36:34 -0800 mailte Gongya Yu folgendes:
> > Hi, I just updated Linux kernel to 2.6.0 with iptables and ebtables
> > enabled.
>
> I'm using iptables on 2.4.x, possible there are differences with 2.6.x.
>
> > But iptables ignores -i and -o options for FORWARD chain. Wheneneve I use
> > something like -i eth0 or -o eth0, the rule is just ignored.
>
> RTFM!
>
> -i is only for INPUT, FORWARD and PREROUTING
> -o is only for FORWARD, OUTPUT and POSTROUTING

Are you suggesting that -i and -o cannot be used in FORWARD?   As far as I can 
see the syntax of the rule Gonya posted is perfectly okay.

Antony.

-- 
Christmas is an opportunity to upgrade to kernel 2.6 while no-one's around to 
notice the downtime.

                                                     Please reply to the list;
                                                           please don't CC me.


