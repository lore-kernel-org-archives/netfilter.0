From: Eric Ellis <eellis@mail.co.gilchrist.fl.us>
Subject: Re: howto stop this packet
Date: Tue, 18 Jan 2005 08:26:12 -0500
Message-ID: <41ED0E74.5010802@mail.co.gilchrist.fl.us>
References: <20050115042522.594392BBE3@tharbad>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050115042522.594392BBE3@tharbad>
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
Content-Type: text/plain; charset="johab"
To: netfilter@lists.netfilter.org

> Eric=A3=A1
>=20
>     i know this iptables rule ,but 228.71.74.201:7777 is application po=
rt=20
This indicates that you are using port 7777 on 228.71.74.201 for a
service, is this true?

>,this packet is dos attack ,pls tell me howto  drop this packet"win
>16384 <mss 1460,nop,nop,sackOK>"   ,thanks

I'm not seeing enough data with that statement to understand what you're
wanting to do exactly.  If the packet has some defineing characteristics
that never change, there's usually a way to filter for it with IPTables,
or with a module for it.

>=20
>=20
>=20
>>jqb@markor.net wrote:
>>
>>>netfilter=A3=A1
>>>    howto stop this packet on iptables firewall;
>>>tcpdump capture packet example:
>>>10:35:31.881722 IP 218.6.45.6.51755 > 228.71.74.201.7777: S 1432831257=
:1432831257(0) win 16384 <mss 1460,nop,nop,sackOK>
>>>
>>>10:35:36.214120 IP 219.147.192.18.1272 > 228.71.74.201.7777: S 490321:=
490321(0) win 6400 <mss 1460,nop,nop,sackOK>
>>>
>>>=A1=A1=A1=A1
>>>
>>>Regards,=09
>>>
>>>
>>>xjjjk
>>>jqb@markor.net
>>>2005-01-14
>>>
>>
>>iptables -A FORWARD -p tcp --dport 7777 -j DROP
>>
>>or
>>
>>iptables -A FORWARD -p tcp --destination 228.71.74.201 -j DROP
>>
>>depends on if you don't want to connect to that machine, or you just
>>don't want that machine connecting to that port.
>>
>>On a side note, you should have your default policies set to DROP anywa=
y
>>on the default tables for best practice security.
>>
>>iptables -P INPUT DROP
>>iptables -P OUTPUT DROP
>>iptables -P FORWARD DROP
>>
>>and then just accept the data that you want to.  This is all covered in
>>the iptables tutortial @
>>http://iptables-tutorial.frozentux.net/iptables-tutorial.html
>=20
>  jqb@markor.net wrote:
>=20
>>netfilter=A3=A1
>>    howto stop this packet on iptables firewall;
>>tcpdump capture packet example:
>>10:35:31.881722 IP 218.6.45.6.51755 > 228.71.74.201.7777: S 1432831257:=
1432831257(0) win 16384 <mss 1460,nop,nop,sackOK>
>>
>>10:35:36.214120 IP 219.147.192.18.1272 > 228.71.74.201.7777: S 490321:4=
90321(0) win 6400 <mss 1460,nop,nop,sackOK>
>>
>>=A1=A1=A1=A1
>>
>>Regards,=09
>>
>>
>>xjjjk
>>jqb@markor.net
>>2005-01-14
>>
>=20
>=20
>=20
>=20
> Regards,=09
>=20
> xjjjk
> jqb@markor.net =20
> 2005-01-15


