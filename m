From: "Jim Robinson" <jim@linux-sp.com>
Subject: RE: Deny all but certain Websites
Date: Wed, 26 Feb 2003 23:57:19 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <CAEGIDAMMMOCIHNIEGCJKECJEGAA.jim@linux-sp.com>
Reply-To: <jim@linux-sp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: Netfilter <netfilter@lists.netfilter.org>

To everyone that replied to my initial post (see below) -
thank you!

Using bits from a number of replies I was able to find the
answer to denying IP addresses to the Internet as a whole
but allowing said internal nodes to specific places on the
web.
The final syntax I used was:

iptables -A PREROUTING -t nat -s 192.168.1.100/24 -d
a.pub.lic.ip -p tcp --dport 80 -j ACCEPT
iptables -A PREROUTING -t nat -s 192.168.1.100/24 -d 0/0 -p
tcp --dport 80 -j DROP

I think a number of the other posts were also correct but my
firewall was somewhat customized :)
I especially liked the one about using Squid instead - glad
to see people can think outside the "list"!

Appreciate the help.

Regards,

Jim


----------------------------------
> From: netfilter-admin@lists.netfilter.org
> [mailto:netfilter-admin@lists.netfilter.org] On Behalf Of
Jim Robinson
> Sent: Wednesday, February 26, 2003 3:55 AM
> To: netfilter@lists.netfilter.org
> Subject: Deny all but certain Websites
>
>
> Hi,
>
> I am trying to write a rule to allow certain IP addresses
on
> the inside of my firewall (NAT) to only connect to 1 or 2
IP
> ranges on the internet.  I have tried without success to
find
> some examples online and have played with some rules but
> without much success.
>
> Does anyone have any ideas on this?  Your help very much
appreciated.
>
>
> Allowed Website Only
> |
> |
> |
> (Internet)
> |
> |
> ETH0: Public IP
> ----
> FIREWALL (NAT)
> ----
> ETH1: 192.168.1.1
> |
> |
> Client IP: 192.168.1.100
>
>
>
>
> Jim
>
>


