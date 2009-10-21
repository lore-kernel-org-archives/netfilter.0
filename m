From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: Ramdom NAT drop
Date: Wed, 21 Oct 2009 23:19:07 +0200
Message-ID: <4ADF7ACB.8080203@chello.at>
References: <034DEBCAE934A74991E6E76B8DA72D14182B54DFB0@HSSBS.holdstead.local> <034DEBCAE934A74991E6E76B8DA72D14185DD50990@HSSBS.holdstead.local> <4ADEBE76.20700@chello.at> <034DEBCAE934A74991E6E76B8DA72D14185DD509A2@HSSBS.holdstead.local> <034DEBCAE934A74991E6E76B8DA72D14185DD509C1@HSSBS.holdstead.local>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <034DEBCAE934A74991E6E76B8DA72D14185DD509C1@HSSBS.holdstead.local>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Gary Smith wrote:
>> I would also expect to see this, but I don't think the packet is eve=
n
>> making it to the filter section.  I have logging for anything droppe=
d
>> and yet nothing is coming in from originating IP's that are affected=
=2E
>> I will probably do something painful and put more logging in the cha=
ins
>> to see if I can better catch the problem.  The only issue I have is
>> that the problem is random.
>>
>> I will definitely look for that though.
>>    =20
>
>
> Included is the rule that I think is being randomly ignored. =20
>
> -A PREROUTING -d 208.46.23.38 -j DNAT --to-destination 10.80.65.38
>
> This is in effect.  So I believe that I should never see a hit in the=
 INPUT chain for this rule since all requests are being forwarded to th=
e 10.80.65.38 IP address.  Only 10.80.0.0/16 are local. =20
>
> I expcted to see this rule as the forward is indeed happening (basica=
lly we logged all traffic prior to this rule to generate the hit:
>
> Oct 21 13:33:35 hsoakfiw01c kernel: FW-F-443: IN=3Deth1 OUT=3Deth0 SR=
C=3D116.250.48.135 DST=3D10.80.65.38 LEN=3D1050 TOS=3D0x00 PREC=3D0x00 =
TTL=3D102 ID=3D30940 DF PROTO=3DTCP SPT=3D2374 DPT=3D80 WINDOW=3D32768 =
RES=3D0x00 ACK PSH URGP=3D0
>
> The INPUT catch had a rule to log all traffic coming in as well, whic=
h is where we picked up this hit:
>
> Oct 21 13:31:01 hsoakfiw01c kernel: FW-I: IN=3Deth1 OUT=3D MAC=3D00:0=
c:29:9c:88:9b:00:13:c3:d7:a3:68:08:00 SRC=3D189.162.111.146 DST=3D208.4=
6.23.38 LEN=3D40 TOS=3D0x00 PREC=3D0x00 TTL=3D241 ID=3D16396 DF PROTO=3D=
TCP SPT=3D3552 DPT=3D80 WINDOW=3D0 RES=3D0x00 ACK RST URGP=3D0=20
>
> So, am I wrong in thinking that external traffic forwarded in via NAT=
 should never hit the INPUT chain and go straight to FORWARD chain, or =
is my problem something else completely?
>
>
>  =20
 From a request few days ago 'Re: FIN packets not getting NAT-ed',=20
Pascal Hambourg answered:

Dhyanesh Ramaiya a =E9crit :

> >=20
> > I have setup a Linux firewall on the edge of the network and doing =
SNAT for
> > internal IPs. When I sniff on external interface for internal sourc=
e IPs,I
> > am seeing FIN packets from internal IPs going out without being NAT=
-ed.
>  =20
> These packets are probably classified in the INVALID state by the
> connection tracking. Such packets are ignored by the NAT. A reason ma=
y
> be that they belong to old connections the connection tracking has
> forgotten about or considers already closed.
>
> Does your rulest DROP outgoing packets in the INVALID state ?

Maybe it's the same thing just with DNAT at your end.

