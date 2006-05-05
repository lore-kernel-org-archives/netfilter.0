From: Petr Pisar <petr.pisar@atlas.cz>
Subject: Re: Not NATed packets
Date: Fri, 05 May 2006 19:26:04 +0200
Message-ID: <e3g1re$etf$1@sea.gmane.org>
References: <Pine.LNX.4.64N.0604231700330.6204@tank.eu.org>	<e30e0b$284$1@sea.gmane.org>
	<445A7E88.406@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <445A7E88.406@plouf.fr.eu.org>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Pascal a wrote:
> Petr Pisar a =C3=A9crit :
>>
> Only NEW packets can create an entry in the connection tracking table
> (which contents can been seen through /proc/net/ip_conntrack) and can go
> through the 'nat' chains. That's why :
> - INVALID packets bypass the nat chains, thus aren't NATed nor counted
> - only the first NEW packet of a connection, which is usually a SYN in
> TCP connections, goes through the nat chains. Duplicate SYN, although
> NEW too, or subsequent packets belonging (ESTABLISHED) or related
> (RELATED) to the same connection in either direction don't. However all
> get automatically NATed according to the conntrack entry in a way
> determined by how the first packet was NATed.

Thanks for hint. I skipped notice in iptables man page about nat filter
and NEW packets, that explains this behaviour.

>>
>> I'm not sure if any INVALID packet can also be considered as a health
>> packet. Can you see any false positivities?
>=20
> Unlike malformed packets which the experimental "unclean" match tries to
> detect, INVALID packets are not "unhealthy" in nature, they're just
> unexpected. And yes, false positive can occur.

Yes, of course (e.g. valid FIN packet looses somewhere after NAT, client
retransmits it and iptables will consider this second FIN as INVALID. Or
does nefilter remeber for this sitation?).

Maybe I should explain whole scenario to you:

I have a provider which connection is terminated with PPP device on my
router. I have assigned only one public dynamic IP. Therefore I
masquerade all packet originating in my local network. The problem is
when packet with source IP different from now assigned public address is
sent from ppp0 device to the provider, the provider will terminate the
PPP connection.

If I have one invalid packet, then it will not be SNATed, provider close
connection, ppp0 link will be going down, iptables flush conntrack
table, pppd redial provider, I get new IP, all applications in local
network retransmitte TCP packets, netfiler on router recognise them as
INVALID, it will not NATed them, provider close conncetion again and so
on. The pppd deamon begin throthling and connection become unusable.

Therefore I need be sure, all packets leaving ppp0 device have right
public IP.

- --Petr
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)

iD8DBQFEW4qruR4f4nEwzHIRAugmAKCSQ6jKEXkrEPDcMQWFxS3H1Lvt5wCfRoZc
asBbX5Bird0l/wfD7ipJbAc=3D
=3Dmcrc
-----END PGP SIGNATURE-----


