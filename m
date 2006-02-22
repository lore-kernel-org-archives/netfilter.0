From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: updated iptables doesn't work with old rules
Date: Wed, 22 Feb 2006 12:01:25 +0100 (CET)
Message-ID: <54666.193.173.147.3.1140606085.squirrel@webmail.sterenborg.info>
References: <5f56302b0602220158k76b68705p88dd35b4c2782caa@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <5f56302b0602220158k76b68705p88dd35b4c2782caa@mail.gmail.com>
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
To: netfilter@lists.netfilter.org

On Wed, February 22, 2006 10:58, Daniel Nogradi wrote:
> I have updated my Fedora Core 3 box to the latest versions (in the FC3
> branch) and now have
>
> iptables-1.2.11-3.1.FC3
> kernel-2.6.12-1.1381_FC3
>
> and ip forwarding stopped working. Before the upgrade I had
>
> iptables-1.2.11-3.1
> kernel-2.6.9-1.667
>
> The configuration is this:
>
> machine A with FC3 ---------------- adsl modem -------------------- int=
ernet
>   |
>   |
>   |
> machine B
> on a LAN
>
> The FC3 box was using iptables for ip ipforwarding in order to let
> 'machine B' access the internet using these rules:
>
> iptables --flush
> iptables -t nat --flush
> iptables --delete-chain
> iptables -t nat --delete-chain

Does the nat table have user defined chains ?
If not then you don't need this rule.

> iptables -t nat --append POSTROUTING --out-interface eth0 -j MASQUERADE
> iptables -t nat --append POSTROUTING -s 192.168.10.0/255.255.255.0 -j
> MASQUERADE

If eth0 is your internet NIC, eth1 your LAN nic and you use 192.168.10.0/=
24 on
your LAN then I think that no packet ever hits the latter rule.

> iptables --append FORWARD --in-interface eth1 -j ACCEPT
>
> echo 1 > /proc/sys/net/ipv4/ip_forward
>
> Now after the update these rules stopped working and nothing gets
> through from 'machine B', although pinging works between machines A
> and B both ways.

Machine A and B are on the same LAN so the FORWARD chain does not apply.
That traffic is controlled by the INPUT/OUTPUT chains.

> Any ideas as to what to change in these rules to have the same effect
> as before the update?

And the script does not generate any errors ?
Try adding (a) logging rule(s) in the FORWARD chain to see why packets ar=
e
dropped or rejected.
I suppose this is not your complete ruleset. Could it be that you have an=
y
rules that might block this traffic ?


Gr,
Rob



