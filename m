From: "Darrell Dieringer" <netfilter@darrelldieringer.com>
Subject: RE: pptp and nat
Date: Fri, 27 Sep 2002 17:12:40 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <IMEDICLPAGAOCBLCCKLPMEKPEBAA.netfilter@darrelldieringer.com>
References: <200209240346.g8O3kBl06609@brooks.nu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200209240346.g8O3kBl06609@brooks.nu>
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
To: Lane Brooks <lane@brooks.nu>, netfilter@lists.netfilter.org

Hello,

Others are certain to have more experince with PPTP that I do.
However, if you believe it is a rules-related problem (as in some
packets needed by PPTP are getting blocked), make sure you have a
LOGging line before every DROP rule (or at the end of chains with a
default DROP policy).

There may very well be a PPTP helper module that you need, though.  I
don't know since I haven't tried to use PPTP through netfilter myself.
I only brought up the LOG/DROP scenario since you hadn't mentioned
checking the logs for problems.

D

> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org
> [mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Lane Brooks
> Sent: Monday, September 23, 2002 10:46 PM
> To: netfilter@lists.netfilter.org
> Subject: pptp and nat
>
>
>
> I have a linux firewall/nat server that is working well
> using iptables.  I also
> have a pptp client on this machine (ppp0).  The internal network is
> 192.169.0/24 on eth0 and the internet is on eth1.  NAT is
> working fine for
> everything except the pptp connection.  The pptp connection
> works fine from
> the firewall machine, but nothing on the internal network
> can talk through it.
>  I used to have ipchains on kernal 2.2, and internal
> computers could talk fine
> through the pptp connection, so I am thinking I need to add
> something more to
> my iptable rules.  Any ideas or help?  My routing table is
> exactly the same as
> that which used to work on ipchains with the older kernel,
> so I dont think it
> is that.
>
> Thanks
> Lane Brooks
>
>
>
>


