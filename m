From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: VPN PPTP
Date: Wed, 16 Jun 2004 20:41:34 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406162041.34287.Antony@Soft-Solutions.co.uk>
References: <20040616191246.81028.qmail@web50204.mail.yahoo.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040616191246.81028.qmail@web50204.mail.yahoo.com>
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

On Wednesday 16 June 2004 8:12 pm, Luis GUSTAVO wrote:

> hi people,
>
> I make nat with my linux, and i have other machine
> windo 2000 server installed and configured vpn with
> pptp.
>
> and i want forward:
>
> port 1723 and the protocol GRE.
>
> how can i make this.

iptables -A FORWARD -p gre -s a.b.c.d -d w.x.y.z -j ACCEPT
iptables -A FORWARD -p tcp --dport 1723 -s a.b.c.d -d w.x.y.z -j ACCEPT

If your /etc/protocols file does not contain a definition for GRE (some do, 
some don't) then simply substitute the number 47 for gre in the rule above.

You probably only want on of the -s a.b.c.d or the -d w.x.y.z specifications, 
depending on which end of the link you are controlling (you say it's the 
server, so you probably want the -d w.x.y.z).

Also, if you are doing NAT, be aware that you can only support one PPTP 
connection at a time unless you use the PPTP-NAT conntrack helper module from 
patch-o-matic.

Regards,

Antony.

-- 
In Heaven, the police are British, the chefs are Italian, the beer is Belgian, 
the mechanics are German, the lovers are French, the entertainment is 
American, and everything is organised by the Swiss.

In Hell, the police are German, the chefs are British, the beer is American, 
the mechanics are French, the lovers are Swiss, the entertainment is Belgian, 
and everything is organised by the Italians.

                                                     Please reply to the list;
                                                           please don't CC me.


