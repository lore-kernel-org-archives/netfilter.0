From: "Raul I. Becette" <raulbecette@unp.edu.ar>
Subject: Re: port forwarding partially working (SOLVED)
Date: Fri, 18 Feb 2005 10:52:57 -0300
Message-ID: <4215F339.1000806@unp.edu.ar>
References: <4213B3F5.1010508@unp.edu.ar>	<1108588628.3944.13.camel@anduril.intranet.cartel-securite.net>
	<4214B68A.7000301@unp.edu.ar>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <4214B68A.7000301@unp.edu.ar>
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

Raul I. Becette wrote:

> Cedric Blancher wrote:
>
>> Le mercredi 16 f=E9vrier 2005 =E0 17:58 -0300, Raul I. Becette a =E9cr=
it :
>> =20
>>
>>> I am having trouble forwarding ports to internal servers.
>>> $IPTABLES -A FORWARD -i $PUB_IF -p tcp --dport 1024 -j ACCEPT
>>> $IPTABLES -t nat -A PREROUTING -i $PUB_IF -p tcp --dport 1024 -j=20
>>> DNAT --to $SERV_BIBL:110
>>> works ok when I telnet $PUB_IF 1024. I got redirected to the POP=20
>>> server with no problems.
>>>  =20
>>
>>
>> I should not.
>> =20
>>
> How can I accomplish the port forwarding for the services?
>
> What I want to do is assign ports 1024-1030 to redirect services for=20
> $SERV_BIBL, ports 1031-1039 to redirect services for $SERV_ING and so o=
n.
>
>> If you DNAT your connexion to $PUB_IF port 1024 to $SERV_BIBL:110, the=
n
>> your FORWARD chain will see a packet to destined to port 110, not 1024=
.
>> If you just look at Netfilter architecture, you will see FORWARD chain
>> traversal occurs _after_ PREROUTING traversal. Thus, packets are alrea=
dy
>> NDATed and have their destination modified when hitting FORWARD rules.
>>
>> That's why, in order to accept your DNATed connection, you should have=
 :
>>
>> $IPTABLES -A FORWARD -i $PUB_IF -p tcp --dport 110 -j ACCEPT
>>
>> If it works anyway, it means you must have some kind of overlaping rul=
e
>> that accidentally accepts thoses packets.
>>
>> Now, going to your script, there's indeed a rule that accepts
>> destination port 110 whatever their destination is :
>>
>> $IPTABLES -A FORWARD -i $PUB_IF -p tcp --dport 110 -j ACCEPT
>>
>> So your stuff works, but that's an accident !
>>
>>
>> =20
>>
> Why is an accident?
>
> TIA
>
Hello list

I solved the problem modifying the FORWARD line adding the state of the=20
connection as NEW

$IPTABLES -A FORWARD -p tcp --dport $SERVICE_PORT -m state --state NEW=20
-j ACCEPT

and deleted the FORWARD lines that accepted connections with --dport=20
10nn. The PREROUTING chain takes care of redirecting that port.

That part of my script now is:

# Abro el puerto de smtp para enviar los correos desde unpata hacia a La=20
Gran Bestia POP
$IPTABLES -A FORWARD -i $PUB_IF -s $LAN_SMTP -p tcp --dport 25 -j ACCEPT
$IPTABLES -t nat -A PREROUTING -i $PUB_IF -p tcp --dport 25 -j DNAT --to=20
$LAN_POP:25

# Abro puertos para servicios accesibles desde Internet
$IPTABLES -A FORWARD -i $PUB_IF -p tcp --dport 21 -m state --state NEW=20
-j ACCEPT

# POP a cuentas unpata.edu.ar y unp.edu.ar
$IPTABLES -A FORWARD -i $PUB_IF -p tcp --dport 110 -j ACCEPT
$IPTABLES -t nat -A PREROUTING -i $PUB_IF -p tcp --dport 110 -j DNAT=20
--to $LAN_POP:110

# Servicios biblioteca.unp.edu.ar
$IPTABLES -t nat -A PREROUTING -i $PUB_IF -p tcp --dport 1024 -j DNAT=20
--to $SERV_BIBL:21
$IPTABLES -t nat -A PREROUTING -i $PUB_IF -p tcp --dport 1025 -j DNAT=20
--to $SERV_BIBL:25
$IPTABLES -t nat -A PREROUTING -i $PUB_IF -p tcp --dport 1026 -j DNAT=20
--to $SERV_BIBL:110

# Servicios ing.unp.edu.ar
$IPTABLES -t nat -A PREROUTING -i $PUB_IF -p tcp --dport 1030 -j DNAT=20
--to $SERV_ING:21
$IPTABLES -t nat -A PREROUTING -i $PUB_IF -p tcp --dport 1031 -j DNAT=20
--to $SERV_ING:110


I used information from the "slow ftp" thread and wondered myself "what=20
if I specify the state of the connection?"
It worked.

Thanks a lot for the help

--=20


-----------------------------------------------------------------
Raul I. Becette
E-mail: raulbecette@unp.edu.ar
Area Redes y Telecomunicaciones
Univ. Nac. de la Patagonia San Juan Bosco
Ciudad Universitaria - Km.4.
9000 - Comodoro Rivadavia - Chubut
Tel/Fax : (0297) - 4550073
------------------------------------------------------------------


