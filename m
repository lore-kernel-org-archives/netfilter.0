From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: a question of NAT
Date: Tue, 7 Jan 2003 15:23:15 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200301071523.15800.netfilter@newkirk.us>
References: <3E1A9223.00001A.23552@bj230.163.com>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3E1A9223.00001A.23552@bj230.163.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="gb2312"
To: netfilter@lists.netfilter.org

On Tuesday 07 January 2003 03:38 am, =C1=CE=E7=F7 wrote:
> I have a question when i use the NAT.
>
> I have two LAN A and B , A is 202.115.60.0/24 and B is 202.115.70.0/24
> . LAN A have a server C which ip is 202.115.60.2, and  LAN B have a
> server D which ip is 202.115.70.3 , normal, the server C provide the
> service, when the server D shutdown, I want use server B provide the
> service intead of the server C.

I'm not sure where 'server B' came from here...  And I'm not sure if I=20
follow what you are really trying to do, maybe because 'server B'=20
confuses things.  However:

>  I think the NAT maybe solve the question . So, I use the DNAT and
> SNAT:
>
> at the netgate of LAN A,do this:
> #iptables -t nat -A PREROUTING -s ! 202.115.70.0/24 -d 202.115.60.2
> -j DNAT --to 202.115.70.3=20
> #iptables -A FORWARD -d 202.115.70.0/24 -j ACCEPT
>
> at the netgate of LAN B , do this:
> #iptables -t nat -A POSTROUTING -s 202.115.70.3 -d ! 202.115.60.0/24
> -j SNAT --to 202.115.60.2
>
> but when I check the ip package use tcpdump , I find the SNAT did not
> work, the source address of the package from the server D is
> 202.115.70.3 , not 202.115.60.2.
>
> then I do a test. when i send a ping package from the server D, the
> source address of the ping
>
> package change the 202.115.60.2, here the SNAT work well.

OK.  The SNAT works when the packet originates from server D, but DOESN'T=
=20
work when the packet comes from D as a reply.  I would suspect a DNAT=20
getting reversed, except you say that tcpdump finds the original IP=20
intact.  (Where are you checking it?)  It seems that the only reason the=20
packet would not match your SNAT rule then is if the destIP doesn't=20
match. (or if an earlier POSTROUTING rule is catching it for some=20
reason)  You are checking if the destIP is NOT on LAN A, but the only=20
way packets get DNATted there initially is if they are NOT from LAN B. =20
If this is all internal, and just these two LANs, then this combination=20
doesn't make sense.  I'm not sure what your purpose is in this=20
crossover, so I'm having trouble visualizing what you want the packets=20
to do, but if you are sending them to the server on LAN B from clients=20
on LAN A, then you can't use "not LAN A" for return traffic and expect=20
it to match.

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =D4=AA=B5=A9=A1=A2=C7=E9=C8=CB=BD=DA=B2=BB=D4=D9=D7=F6=B9=C2=B6=C0=C8=CB=
!=C4=E3=BB=B9=B2=BB=BF=EC=C0=B4=D4=BC=BB=E1=A3=BF=09http://dating.163.com=
/
> =CD=F8=D2=D7=BE=E3=C0=D6=B2=BF=CE=AA=C4=E3=BD=A8=D4=EC=D2=BB=B8=F6=B3=AC=
=BC=B6=B5=C4=CB=BD=C8=CB=C9=E7=C7=F8=A3=A1=09=09http://our.163.com
> =D0=C2=C4=EA=D3=D0=C0=F1=A3=A1
> VIP=D3=CA=CF=E4=D2=B2=BF=C9=D2=D4=C3=E2=B7=D1=D3=C3=A3=A1=09=09http://v=
ip.163.com/payment/MobilePayment.shtml

Just as an aside,  I found this message in my SPAM folder instead of my=20
netfilter folder, because ANY email containing 163.com is automatically=20
dumped.  (and yours matches six times)  163.com is one of about 80=20
domain names that are regularly blocked completely by a number of=20
anti-spam products and services.  You also match spam filters based on=20
being in an IP block notable for out-of-control spamming.  You probably=20
already know this, and probably got automatic bounces like "The mail=20
server you are sending from is listed on an international Blacklist"=20
from several recipients.

Googling "spam 163.com" returns about 2000 hits, while "spam vip.163.com"=
=20
returns about 200. =20

I REALLY hope and pray that you (or the servers in question here) are not=
=20
involved in spamming, and that I haven't just perhaps actually helped a=20
spammer.  Being the recipient of around 300 spams per month, (and an=20
anti-spam activist) that would really nauseate me.  If this is NOT the=20
case, I hope you understand and forgive, and consider getting a=20
different email address.  (If it IS the case, I won't offend people with=20
what I hope... >;^)  I thought about not replying, but decided that=20
wasn't fair to you, as I have no reason to believe you have anything to=20
do with spamming.

j



