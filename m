From: Sertys <sertys@supportivo.org>
Subject: Re: Iptables and vserver
Date: Sun, 20 Mar 2005 19:52:34 +0200
Message-ID: <opsnx6lwh276nf2y@xonix>
References: <200503201710.46087.werner_schalk@gmx.de>
	<Pine.LNX.4.62.0503201728510.4948@l01.thnet>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <Pine.LNX.4.62.0503201728510.4948@l01.thnet>
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
Content-Type: text/plain; format="flowed"; delsp="yes"; charset="us-ascii"
To: Netfilter list <netfilter@lists.netfilter.org>

On Sun, 20 Mar 2005 17:34:27 +0100 (CET), Michael Tautschnig =20
<michael.tautschnig@zt-consulting.com> wrote:

> Hello,
>>
>> So set up PRE- and POSTROUTING rules and I was able to transparently =20
>> access
>> the 10.0.1.x network. However of course I am not able to access the SS=
H =20
>> and
>> HTTP servers on the host itself anymore because iptables can not
>> differentiate between the SSH and HTTP server provided by my host with=
 =20
>> the
>> (one and only) public IP address and those servers provided by the =20
>> Vserver
>> the host also acts as a DNS server for. Can anybody point me to feasab=
le
>> solutions to this problem because I don't want (or actually I simply =20
>> can't)
>> to use more than public IP address on the host. Anyone? Might that be
>> possible with advanced routing maybe?
>>
>
> I don't think this would ever be possible with advanced routing or the =
=20
> like - how would the server know, whether you are trying to access the =
=20
> vserver or the router? But it could be easily one, if you just changed =
=20
> the ports of the ssh/http-daemons to, let's say, 23 and 81 ...
>
> It could probably be done for http, though, if you are using different =
=20
> names for the instances provided by the vservers and the ones on the =20
> router using layer7-filter.
>
> Regards,
> Michael

Indeed michael is right. It's stupid to have several IP's sharing a domai=
n =20
name and vice versa unless for service backup. Since you are vhosting you=
 =20
can split the traffic on http proto queries and redirect it. You may do =20
that with squid for example, cause it talks http. NameVhosting is another=
 =20
solution, but then you just have to issue a redirect page from your =20
main(the public one) server and cross your fingers the clients use HTTP1.=
1 =20
:) It's a bit harder, not to say impossible to redirect trafic different =
=20
 from HTTP. SSH packets would come with destination a.b.c.d and not =20
containt some headers like "I wanna reach vmachine2.a.b.c.d". Thus, get =20
your services across different ports. 222,2222,22222 is easy to remember =
:)


--=20
www.supportivo.org

I can't stop myself checking for pigs in the outlets. Everybody thinks i'=
m =20
a punk, cause of the hairstyle(220V).
end

