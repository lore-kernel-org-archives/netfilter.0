From: Faheem Mitha <faheem@email.unc.edu>
Subject: Re: comments about lokkit default script
Date: Fri, 12 Sep 2003 13:26:14 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0309121323530.1054-100000@Chrestomanci>
References: <200309120902.41066.gdh@acentral.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200309120902.41066.gdh@acentral.co.uk>
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
To: Gavin Hamill <gdh@acentral.co.uk>
Cc: netfilter@lists.netfilter.org



On Fri, 12 Sep 2003, Gavin Hamill wrote:

> On Friday 12 September 2003 07:11, Faheem Mitha wrote:
> > Dear People,
> >
> > Are the lines
> >
> > iptables -A RH-Lokkit-0-50-INPUT -p udp -m udp -s 207.69.188.18*
> > --sport 53 -d 0/0 -j ACCEPT
> >
> > allowing through the DHCP connection? The 207.69.188.18* are
> > Earthlink servers, they look like nameservers.
>
> Your second hunch is right - they are for Eathlink's nameservers, since that's
> what will be defined in /etc/resolv.conf... DNS lookups reply using a UDP
> source port of 53, hence the lines added by lokkit..
>
> I would be wary of the fact that DHCP (which uses UDP ports 67 and 68) is
> currently blocked, so if you start to get connection problems in the near
> future, you'll know why - you should probably see messages from your DHCP
> client that it was unable to renew the lease...
>
> iptables -A INPUT -p UDP -i eth0 --dport 67 --sport 68 -j ACCEPT
>
> is what I use to ensure that the DHCP traffic is permitted from the outside
> world.

Hi. Thanks for the info. Does the rest of the configuration look Ok then?

                                                              Faheem.


