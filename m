From: Eliezer Croitoru <eliezer@ngtech.co.il>
Subject: Re: VoIP conntrack issue
Date: Tue, 13 Nov 2012 22:09:39 +0200
Message-ID: <50A2A903.3050702@ngtech.co.il>
References: <CABY2qi9ge+3jkt5ePM-iZU2XycBic6orCvjF63WArCvjWPS4og@mail.gmail.com> <201211122202.02082.neal.p.murphy@alum.wpi.edu> <CABY2qi9-dYnr8AkTmoeQZgbxM02T=OFw0-FKZoyt+_N6xHuJgA@mail.gmail.com> <50A213B1.4050601@ngtech.co.il> <CABY2qi86ntiYHDzaSeyEwy8vVSy8z8gc+uc8B8EANvya7m6f8w@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CABY2qi86ntiYHDzaSeyEwy8vVSy8z8gc+uc8B8EANvya7m6f8w@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?J=F6rn_Krebs?= <jk@smartbyte.de>
Cc: netfilter <netfilter@vger.kernel.org>

Hi J=F6rn,

You must first understand that you description is kind of vague on what=
=20
the actual network setup is and you are just referring to specific=20
things in the whole picture which what leads every reader to another=20
conclusion.

I will try to write you the question that I still dont know the answer =
for:
what is the network path of the packets?(routing)
Where is this NAT happening?
I will give you an example that can clear up what We need to try to hel=
p=20
you stay focused:
http://wiki.squid-cache.org/ConfigExamples/UbuntuTproxy4Wccp2#Toplogy

The above diagram shows and describes path and network diagram in a way=
=20
that seems to me good.

192.168.1.38 sends packet to?
what external IP this router use? 114.XX.234.123 ?
if the IP of the asterisk server is:  122.XX.115.203 then what nat? to=20
what direction? on what machine?
If it's a xen host that hosts the asterisk server I would say it's one=20
of the bad choices ever(from my experience) to host VOIP server.
The whole question you are asking looks very weird from the conntrack=20
output.

 From netfilter\technial point of view fire-walling is not NAT in any=20
way while they both use some common modules.
(I dont know how much you know so I am now on the "syn-ack" part of the=
=20
question from you to make sure we get the connection right and on the=20
same src,dst logic)

If you do host any SIP service behind a firewall and\or nat you should=20
be explicit on what is allowed to the direction of the SIP server.

I still dont understand how you managed to capture all this conntrack=20
(topology+machines) data on the same machine.

If you do have problem with this specific part:
 > # The connection is assured, because Asterisk is basically listening
 > to everything on that port and changes the port it send the data bac=
k
 > # But my VoIP Provider is not that intelligent. :-((( See the follow=
ing
 > [NEW] 192.168.1.38:44608 -> 62.52.147.185:35642  | 62.52.147.185:356=
42
 > ->114.XX.234.123:1030 [UNREPLIED]
 > [NEW] 62.52.147.185:35642 -> 114.XX.234.123:44608 |
 > 114.XX.234.123:44608 -> 62.52.147.185:35642 [UNREPLIED]
 > [NEW] 62.52.147.185:44609 -> 114.XX.234.123:44609 |
 > 114.XX.234.123:44609 -> 62.52.147.185:35643 [UNREPLIED]
 > [NEW] 192.168.1.38:57890 -> 62.52.147.185:35643 | 62.52.147.185:3564=
3
 > -> 114.XX.234.123:57890 [UNREPLIED]

You should configure the RTP and SIP settings right.
how exactly the VOIP phone "192.168.1.38" contacts the PSTN provider=20
"62.52.147.185" and why?(make it clear so I and others can understand=20
the situation)
If you do have Asterisk server then this server should contact the=20
SIP\PSTN provider and not the SIP phone.

The stun should be and should only be related to the external=20
connections from the phone to a server in the internet.
Any other stuff should be static as possible to assure that the service=
=20
will WORK.

You have mentioned:
/sbin/iptables -t nat -A POSTROUTING -j MASQUERADE -s 192.168.0.0/16
before which is not any mechanism of symmetric nat but more of=20
snat(source nat).

NAT can never assure you symmetric port to port mapping and especially=20
when you are natting more then 1000 hosts.
There is a great possibility that in such a wide NAT size you will have=
=20
problems.
two clients can use somehow the same port in the same time.

My recommendation is that IF you can use even simple routing=20
tunnel(IPIP\GRE) to avoid nat just use it.
it's simple to setup and supported on any linux distribution I know of.

(all the above is based on that I didnt understood the network=20
infrastructure and is a speculation only until I will know more)

You can always contact me on my personal email to send me data you dont=
=20
want to publish on the public lists.


Best Regards,
Eliezer

On 11/13/2012 1:42 PM, J=F6rn Krebs wrote:
> Hi Eliezer,
>
> I think your comment is a bit offensive, yes I understand how NAT
> works, and yes I know what STUN does,
> but in this case it is the NAT firewall who does some unneeded Port m=
apping!
>
> Setup:
> External IP: 114.XX.234.123
> Local Network : 192.168.1.0/24 -> Internal VoIP Phone: 192.168.1.38
> STUN Server: 216.93.246.14
> Asterisk Server: 122.XX.115.203
> VoIP-PSTN Provider: 62.52.147.185
>
> And what I do is:
> Call a number on my Asterisk Server, who then reroutes the call / the
> RTP stream directly to my VoIP Phone.
> (I tried directmedia and directrtpsetup, both do not work, because
> netfilter/conntrack does a port mapping.)
>
> I though you might be able to read this out of my first email, but to
> be honest, it was very hard to read,
> that's why I shortened the conntrack -E log and made it a bit more
> readable, and attach it here:
> ---------------------------------------------------------------------=
------------------------------------------------------------------
> # Here is the STUN-Part
> [NEW] 192.168.1.38:44608 -> 216.93.246.14:3478 | 216.93.246.14:3478 -=
>
> 114.XX.234.123:44608
> [NEW] 192.168.1.38:57890 -> 216.93.246.14:3478 | 216.93.246.14:3478 -=
>
> 114.XX.234.123:57890
> [UPDATE] 192.168.1.38:44608 -> 216.93.246.14:3478 | 216.93.246.14:347=
8
> -> 114.XX.234.123:44608 [ASSURED]
> [UPDATE] 192.168.1.38:57890 -> 216.93.246.14:3478 | 216.93.246.14:347=
8
> -> 114.XX.234.123:57890 [ASSURED]
> # STUN ended - Two connections assureds, ports: 44608 and 57890
>
> # Now we try to connect to the VoIP Server source port 44608 and 5789=
0
> ( this might be some ICE related thing, I cannot explain, why my
> client does it, but that's actually not the problem.
> [NEW] 122.XX.115.203:10020 -> 114.XX.234.123 44608 |
> 114.XX.234.123:44608 -> 122.XX.115.203:10020 [UNREPLIED]
> [NEW] 192.168.1.38:57890 -> 122.XX.115.203:10021 |
> 122.XX.115.203:10021 -> 114.XX.234.123:57890 [UNREPLIED]
> # !!!!!!! Look here !!!!!!! That's where it starts! Why do we have a
> port mapping here???
> [NEW] 192.168.1.38:44608 -> 122.XX.115.203:10020 |
> 122.XX.115.203:10020 -> 114.XX.234.123:1030 [UNREPLIED]
> # And from that point on it goes down the drain!
> # Se the port mapping to port 1030!!!???!!!! Why?!
> [UPDATE] 192.168.1.38:44608 -> 122.XX.115.203:10020 |
> 122.XX.115.203:10020 -> 114.XX.234.123:1030
> [UPDATE] 192.168.1.38:44608 -> 122.XX.115.203:10020 |
> 122.XX.115.203:10020 -> 114.XX.234.123:1030 [ASSURED]
> # The connection is assured, because Asterisk is basically listening
> to everything on that port and changes the port it send the data back
> # But my VoIP Provider is not that intelligent. :-((( See the followi=
ng
> [NEW] 192.168.1.38:44608 -> 62.52.147.185:35642  | 62.52.147.185:3564=
2
> ->114.XX.234.123:1030 [UNREPLIED]
> [NEW] 62.52.147.185:35642 -> 114.XX.234.123:44608 |
> 114.XX.234.123:44608 -> 62.52.147.185:35642 [UNREPLIED]
> [NEW] 62.52.147.185:44609 -> 114.XX.234.123:44609 |
> 114.XX.234.123:44609 -> 62.52.147.185:35643 [UNREPLIED]
> [NEW] 192.168.1.38:57890 -> 62.52.147.185:35643 | 62.52.147.185:35643
> -> 114.XX.234.123:57890 [UNREPLIED]
> ---------------------------------------------------------------------=
----------------------------------------------------------------
> As you can see, half way through ( Underneath my !!!!!!!! comment)
> conntrack/netfilter, linux does a port mapping, and does not use the
> internal port 44608, but mapps the port to port 1030, for whatever
> reason.
> I am pretty sure this port-mapping is unneeded, and it messes up my
> VoIP calls, as the providers are thinking my external port is 44608
> (that's the port the device uses), but linux maps it to port 1030.
> Can anyone technically explain to me why conntrack/netfilter does
> this? Why can't netfilter just do a second mapping (first mapping was
> the one from the STUN connection, line 3)?
>
> This is not a symmetrical NAT!
>
> And please I do my best to explain this, if you need more info or you
> don't understand my explanation, I am willing to give more detailed
> info, or explain it in a different way, but don't be offensive,
> please.
>
> Thanks.


--=20
Eliezer Croitoru
https://www1.ngtech.co.il
IT consulting for Nonprofit organizations
eliezer <at> ngtech.co.il
