From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: Using iptables for bandwidth mesurement
Date: Wed, 8 Jan 2003 04:03:11 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200301080403.11273.netfilter@newkirk.us>
References: <ID0NVT4YQPJ4WB6TSIMGSLF8632.3e195dc8@europe>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <ID0NVT4YQPJ4WB6TSIMGSLF8632.3e195dc8@europe>
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
To: marco_simon@web.de, netfilter@lists.netfilter.org

On Monday 06 January 2003 05:43 am, Marco Simon wrote:
> Hello netfilter-group,
>
> we are using iptables on our gateway-server for doing NAT and
> package-filtering.
>
> Actually one of our hosting-customers wants to be informed how much
> off of our bandwidth to the internet (1.5 MBit maximum) is used, in
> order to avoid that some of his "homepage - guests" are not able
> visite his site due lack of bandwidth. Is there any way, how I can use
> IPtables for giving him a report about the bandwith usage ? e.g. how
> can I get the current bandwidth - usage on a special interface ?
>
> The other point we need, is an report about the traffic which comes up
> between our cusomers web-server (which is inside our lan, packages
> will have to pass the firewall) and the outside-world. How can I set
> up such a service using iptalbes ??
>
> Thanks for any comment !

Look into software packages that are addressed through the ULOG target to=
=20
perform detailed accounting of traffic.  There are several available,=20
IIRC, which can sift, sort, and map the data collected on all the=20
traffic through the firewall, so long as you set an appropriate "-j=20
ULOG" rule.=20

A quick and dirty answer to part two is to use "iptables -L -v -n" and a=20
rule at the start of your FORWARD chain which does nothing but match ALL=20
traffic outbound from that customer's server, but has no target.  The=20
rule will then count packets and bytes but not actually DO anything. =20
This is NOT a good solution, but you can use it for rough numbers over a=20
short period.  (if the firewall is reset, or the counts reset, then=20
everything is lost)  Just zero the counts, (iptables -Z, or iptables -Z=20
FORWARD) and after a period of time list the rules with "-v" and check=20
the packet and byte counts.  If you want to try this without zeroing all=20
counts, just remove and reinsert the rule.

j


