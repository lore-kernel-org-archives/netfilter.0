From: "Jonathan Villa" <jvilla@e37.net>
Subject: Re: allow range syntax - perplexed
Date: Tue, 15 Jun 2004 13:41:34 -0500 (CDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1846.64.2.245.108.1087324894.squirrel@64.2.245.108>
References: <1613.64.2.245.108.1087318849.squirrel@64.2.245.108>
    <1087322336.2054.12.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1087322336.2054.12.camel@localhost>
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

> I'm not doing exactly what you are doing but I do use full subnets for
> both source and destination and it works fine for me.  What do you see
> that makes you believe it is not working? - John
> --
> John A. Sullivan III
> Chief Technology Officer
> Nexus Management
> +1 207-985-7880
> john.sullivan@nexusmgmt.com
> ---
> If you are interested in helping to develop a GPL enterprise class
> VPN/Firewall/Security device management console, please visit
> http://iscs.sourceforge.net
>
>

Access is denied.

I have more information now.

Here is the background:
A machine running MySQL is to be locked down for access only to a select
group of people working from home and people at the office, hence the
xx.xx.xx.0

I've noticed that the script works fine for anyone who is not on the
network but for those who are, well the rules block access to them all th=
e
time.

I have something similar to the following

ALLOWIPS=3D"array of ip addresses"

for ip in $ALLOWIPS;
do
$IPTABLES -A INPUT -p tcp --dport 3306 -s $ip -j ACCEPT
$IPTABLES -A INPUT -p tcp --dport 80 -s $ip -j ACCEPT
done

then I had the rules from my original post

$IPTABLES -A INPUT -p tcp --dport 3306 -s xxx.xxx.xx.0/24  -j ACCEPT
$IPTABLES -A INPUT -p tcp --dport 80 -s xxx.xxx.xx.0/24 -j ACCEPT

the ips in the loop are fine, but then ips on the same network were being
blocked regardless of my rules.  That is why I thought that it was the
syntax...

I have added 5 ips which are on the same network as the server to the
array ALLOWIPS and they get denied access while the other ips are granted
access.

so then I tried taking them out of the loop and doing them individually,
still no access.

Could it be because they are on the block?  Do I need to specify that the
interface is -i eth0 or something instead of specifying -s ip

example

use:


$IPTABLES -A INPUT -p tcp --dport 3306 -i eth0  -j ACCEPT

vs


$IPTABLES -A INPUT -p tcp --dport 3306 -s xxx.xxx.xx.0/24  -j ACCEPT


but then my question is, I only have one nic, so won't everything that is
not from lo come from eth0?

-very confused


