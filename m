From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: forward traffic web to squid server
Date: Thu, 13 Feb 2003 01:46:37 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200302130146.37200.netfilter@newkirk.us>
References: <F83liatzHAC7h6gU2vL00027cec@hotmail.com>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <F83liatzHAC7h6gU2vL00027cec@hotmail.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-9"
To: Linux User <linux_user_78@hotmail.com>, netfilter@lists.netfilter.org

On Wednesday 12 February 2003 05:24 pm, Linux User wrote:
> Hi friends,
>
> In my server RedHat-8.0, I have installed script-firewall with
> iptables, this firewall-server has connection to Internet and the
> users of the internal network correctly work, now my restlessness is
> in which I have installed a squid server in the internal network but
> that simultaneously this connected by another network to a server with
> line ADSL to Internet, my question is as I can configure my firewall
> to forward all traffic web to my squid server that this in the
> internal network?

You can use a nat PREROUTING rule to DNAT all HTTP traffic to the squid=20
box, then out its internet connection (if so configured), and the rest=20
of the traffic will go out the internet connection on the firewall box. =20
HOWEVER:

1 - you must also SNAT the traffic that goes to the squid server in nat=20
POSTROUTING to ensure that return traffic comes back to the firewall box=20
from the squid server, NOT directly to the clients.

2 - hopefully HTTP is the only connections the squid box will accept=20
and/or forward, otherwise your firewall covers the front of the internal=20
network while leaving its butt exposed...

The rules you'd need are:

/sbin/iptables -t nat -A PREROUTING -p tcp --dport 80 -j DNAT
--to 192.168.100.254
/sbin/iptables -t nat -A POSTROUTING -p tcp --dport 80 -d 192.168.100.254
-j SNAT --to 192.168.100.1

plus appropriate FORWARD rules, which you may already have in place.

j

> __________
>
> |Internet |
> |
> |_________|
>
> ___|____200.37.245.159
>
> |Server |
> |with   |
> | ADSL  |
> |_______|192.168.105.1
>
> __|____
>
> |Squid  |192.168.105.2
> |Server |
> |_______|
> |
>    |192.168.100.254
>    |
>    |___________________________INTERNAL NETWORK
>
> ___|_____
>
> |Firewall|192.168.100.1
> |Server  |___________________________INTERNET
> |_______ |
>
> I can configure my firewall to forward all traffic web to my squid
> server that this in the internal network?
>
>
> THANKS
> Joseph
>
>
> _________________________________________________________________
> Charla con tus amigos en l=EDnea mediante MSN Messenger:
> http://messenger.yupimsn.com/


