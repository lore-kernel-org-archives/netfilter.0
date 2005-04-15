From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: Port Forwarding Problem
Date: Fri, 15 Apr 2005 09:32:53 -0500
Message-ID: <425FD095.9020507@riverviewtech.net>
References: <425F98B0.7040303@wan4u.co.za>
	<20050415084039.7032.qmail@arcoscom.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050415084039.7032.qmail@arcoscom.com>
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: =?UTF-8?B?U2FtdWVsIETDrWF6IEdhcmPDrWE=?= <samueldg@arcoscom.com>
Cc: netfilter@lists.netfilter.org

I do not recall seeing the original post so I did not see your firewall r=
ule set.  If you have your default policy for the FORWARD chain set to DR=
OP you will need to explicitly allow the traffic that you are trying to p=
ort forward in your FORWARD table.  For example you will need something l=
ike this:

iptables -t filter -A FORWARD -i $INet -o $LAN -p tcp --dport 800 -d $IP_=
of_server_to_forward_to -j ACCEPT
iptables -t filter -A FORWARD -i $INet -o $LAN -p udp --dport 800 -d $IP_=
of_server_to_forward_to -j ACCEPT
iptables -t filter -A FORWARD -i $LAN -o $INet -p tcp --dport 800 -s $IP_=
of_server_to_forward_to -j ACCEPT
iptables -t filter -A FORWARD -i $LAN -o $INet -p udp --dport 800 -s $IP_=
of_server_to_forward_to -j ACCEPT

I added rules for both TCP and UDP as I did not know which protocol you a=
re running.  If you don't need one or the other just take the pair (in an=
d out) of rules out.



Grant. . . .

Samuel D=C3=ADaz Garc=C3=ADa wrote:
> Without having a look into your scripts, I think you need:
> 1) Allow INPUT into filter table to the port.
> 2) Allow FORDWARD into filter table to the redirected conection.
> Good luck.
> Julian Labuschagne writes:
>=20
>> Hi everyone I'm a bit new to iptables so please bear with me on this=20
>> one ;)
>> I wrote a small firewall that basicaly nats users through my gateway=20
>> machine only allowing certain hosts on my network Web DNS and Mail=20
>> access.
>> This section works fine.
>> But I also want to port forward any connections from outside to port=20
>> 800 to a host running inside my LAN.
>> I added a rule in the PREROUTING table to do this.
>> But it seems that no connection gets forwarded.
>> If I set my default policies to ACCEPT and add the PREROUTING rule it =

>> actualy does the port forwarding correctly.
>> I attached a copy of the firewall I wrote with this message.
>> Please can someone have a look through it for me cause I'm sure I'm=20
>> just missing something.
>> Kind Regards Julian.
>> =20
>>
>=20
>=20
>=20
> Samuel D=EF=BF=BDaz Garc=EF=BF=BDa
> Director Gerente
> ArcosCom Wireless, S.L.L.
> mailto:samueldg@arcoscom.com
> http://www.arcoscom.com
> m=EF=BF=BDvil: 651 93 72 48
> tlfn.: 956 70 13 15
> fax:   956 70 34 83
>=20
>=20
>=20


