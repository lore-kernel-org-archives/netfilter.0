From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: "connection tracking" and "Connection state"?
Date: Wed, 2 Apr 2003 16:04:16 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200304021604.16256.netfilter@newkirk.us>
References: <F9fFM7FJ5l7rOwSbiqW0000601a@hotmail.com> <00d301c2f92d$2e7b9210$2700a8c0@video>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <00d301c2f92d$2e7b9210$2700a8c0@video>
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
To: "Intercom@x" <intercomax@yahoo.com.br>, Netfilter <netfilter@lists.netfilter.org>

On Wednesday 02 April 2003 10:33 am, intercomax@yahoo.com.br wrote:
> Hi all,
>
> Is it possible to redirect any url request to another address, from an
> internal nat address requesting a valid url to a internal specific
> address? Something like  iptables -t nat -A PREROUTING -p tcp -d
> 192.168.0.0/255.255.0.0 --dport 80 -j DNAT --to-destination
> 192.168.5.254:80 ?

Yes.  However with your scenario above, if the client making the request=20
is in 192.168.0.0/16 then it will connect directly to the host, not=20
through the firewall.  If the destinations being redirected are public=20
IPs with a local client, and the DNAT target is also local, then it is=20
also necessary to add:
iptables -t nat -A POSTROUTING -p tcp --dport 80 -d 192.168.5.254 -j SNAT=
=20
--to {FirewallLocalIP}
So that replies will be sent to the firewall to be unDNATted (and now=20
unSNATted) to show the IP the client expects a reply from.

j


