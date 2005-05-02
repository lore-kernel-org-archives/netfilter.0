From: Daniel Lopes <lopsch@lopsch.com>
Subject: Re: rules for skype
Date: Mon, 02 May 2005 16:36:21 +0200
Message-ID: <42763AE5.1000606@lopsch.com>
References: <20050501223241.CF7E4103130@correio.solutti.com.br>
	<427559CC.9050108@solutti.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <427559CC.9050108@solutti.com.br>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Leonardo Rodrigues Magalh=E3es schrieb:
>=20
>    Skype is able of connect using squid throw HTTPS connections, which=20
> makes it harder to block using squid ACLs, as when HTTPS is used, squid=
=20
> sees nothing only the hostname that you're connecting and NOT the whole=
=20
> URL.
>=20
>=20
>    Sincerily,
>    Leonardo Rodrigues
>=20
>=20
> Seferovic Edvin escreveu:
>=20
>> DEVIL_MODE =3D 1;
>> You can stop it by blocking incoming high ports ;)
>> DEVIL_MODE =3D 0;
>> Why should you block all incoming high ports? Hm.. maybe you want to=20
>> allow
>> only web traffic that comes and goes through a squid proxy ;)
>>
>> Regards,
>>
>> Edvin Seferovic
>>
>> -----Original Message-----
>> From: netfilter-bounces@lists.netfilter.org
>> [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Taylor, Gr=
ant
>> Sent: Montag, 02. Mai 2005 00:00
>> To: netfilter@lists.netfilter.org
>> Subject: Re: rules for skype
>>
>> =20
>>
>>> iptables -A FORWARD -p tcp --dport SKYPEPORT -j ACCEPT
>>>  =20
>>
>>
>> <devilish @^*% eating grin> He, Skype does not have a port (per say).
>> </devilish @^*% eating grin>
>>
>> Skype will use just about any port that it can use (all the standards =
you
>> would think for internet traffic) to connect to any ""super node that=20
>> it can
>> connect to.  unfortunately what qualifies as a Super Node is any node =
/
>> computer that is running Skype that is directly connected to the inter=
net
>> with out a firewall that would inhibit other systems from connecting
>> directly to it.  Do a Google for "Skype Protocol" and see what you=20
>> find.  I
>> have a PDF on it at the office that I'd be happy to send you.  (If you=
=20
>> want
>> this PDF I'll find the URL to it and post it to the list or email
>> individually as I don't think the list would like a PDF sent to it.)  =
The
>> only way that I've heard to even slow down Skype is to force it to pas=
s
>> through a proxy, beyond that nothing, that I have heard of or read abo=
ut,
>> will stop it.
>>
>>
>>
>> Grant. . . .
>>
>>
Yes this 443 port thing is the only reason why it seems that Skype is=20
unstoppable. You could block connections to that port but then you would=20
also cut off https based websites :(.

