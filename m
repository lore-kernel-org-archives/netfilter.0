From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: postrouting and dmz
Date: Wed, 25 Feb 2004 22:08:51 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200402252208.51113.Antony@Soft-Solutions.co.uk>
References: <20040225065803.40555.qmail@web20730.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040225065803.40555.qmail@web20730.mail.yahoo.com>
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
To: ip tables <netfilter@lists.netfilter.org>

On Wednesday 25 February 2004 6:58 am, ip tables wrote:

> Hello,
>
> I use iptables 1.2.7a on RH 9.0 when i enable
> iptables -t nat --policy PREROUTING DROP
> it stops my connecting to the services offerd @ the
> natted dmz. Also nmap shows the ports opened when i do
> a "connect" scan. I have no user defined chanins. Any
> idea?

Don't use the nat table for filtering rules (DROP is a filtering action).

The nat tables are for SNAT and DNAT rules.

If you want to DROP packets, do it in INPUT, OUTPUT or FORWARD.

Regards,

Antony.

-- 
Anything that improbable is effectively impossible.

 - Murray Gell-Mann, Novel Prizewinner in Physics

                                                     Please reply to the list;
                                                           please don't CC me.


