From: =?UTF-8?Q?J=C3=B6rn_Krebs?= <jk@smartbyte.de>
Subject: Fwd: VoIP conntrack issue
Date: Wed, 14 Nov 2012 09:51:42 +1100
Message-ID: <CABY2qi9s0b1Ztbg7uj=H+YU4eac0K2uxD3qwtT0XpvcvhWsyrA@mail.gmail.com>
References: <CABY2qi9ge+3jkt5ePM-iZU2XycBic6orCvjF63WArCvjWPS4og@mail.gmail.com>
 <201211122202.02082.neal.p.murphy@alum.wpi.edu> <CABY2qi9-dYnr8AkTmoeQZgbxM02T=OFw0-FKZoyt+_N6xHuJgA@mail.gmail.com>
 <50A213B1.4050601@ngtech.co.il> <CABY2qi86ntiYHDzaSeyEwy8vVSy8z8gc+uc8B8EANvya7m6f8w@mail.gmail.com>
 <50A2A903.3050702@ngtech.co.il> <CABY2qi8w6eDME-OUYM_5Y8Pk63TxBudoHkC54EdzHtuEwQGjZQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:from:date
         :x-google-sender-auth:message-id:subject:to:content-type
         :content-transfer-encoding;
        bh=eO8dxSrvdHeFhgHJsh2j7e4Z/xTa/i73vIxXhX1Cq6E=;
        b=hY7iijFeuiVU4qot/9W0sNQA4ZNAndICtjWtFvuPO6CHUpUqfrz33K+UOvf9wA/z3T
         i8pxNNqDH4eVhLLlFszcCYoIfXp1LFLsmwIoVw5zmnVxDfVr4Mrk0rlXcnsc11npdM20
         bb1AiUlP8hqj4aRrpPMKPAKIKTP+p7jPHrY2YGqvxOx7P4qQB4AwyvDTTBqg4fayA3yI
         M5lk8bvD/qpFjmAVIVwYnRtlZJJ9+ztypVDk/0HKVZAwT3snuw5JQMgpG2/Pz32X1BXJ
         bd7VAyw3QQIzS5IbySlpL6OAoAJeXXKfOBqL2+l+keRqNUE8x6GUpMTWI5RiajZpvjBg
         qeLg==
In-Reply-To: <CABY2qi8w6eDME-OUYM_5Y8Pk63TxBudoHkC54EdzHtuEwQGjZQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter <netfilter@vger.kernel.org>

Thanks, I really liked your answer that was very helpfull:

I try to explain a few more things to make my situation a bit clearer:
=46irst I have my nice little Android phone (192.168.1.38 here).
That phone operates in different places, like work, home, customer,
etc, so I need one config that fits all
(that's a big problem I know, but I think I solved it for most places,
except my own home network,
which is very odd, as this is the network I am the admin in, and I can
configure everything...)

O.K. so, in this case 192.168.1.38 is my Android phone with CSIPSimple.
My PC/router at home is my old linux system, with kernel 3.4.7, so
fairly recent.
My home network is 192.168.1.0/24
And the public IP address of my home system is: 114.XX.234.123
(That system has two network cards, one internal and one external. But
this system is a router only, I don't want to have any asterisk server
on that system!)

The I have a public Xen VoIP Asterisk server, which actually does a
good job for me: The public IP address is: 122.XX.115.203

And then there is my German VoIP-PSTN-Provider I use to actually do
phone calls to landlines. (GMX).
GMX uses a different IP-address everytime, depending on the region you
call. So I cannot put static rules in my iptables config.

I live in Australia, and what I try to achieve is NOT to route the RTP
traffic through the Asterisk server (which does work perfectly by the
way), because of the extra delay I have with it).
I would like Asterisk to just do the SIP stuff, and when it comes to
the RTP traffic, I want that RTP traffic to go directly from my
Android device to GMX, or any other VoIP provider (I actually have
about 5 different providers, not just GMX)
But most traffic goes over GMX, so it is my aim to get direct RTP
working with GMX.

I don't want to include the conntrack log again, as this doesn't seem
to help explaining the issue.
So I try it in text form here, as this mailing list doesn't allow any
HTML code, so I cannot show that in a graphic.

Here is a list of different connections that are used in this case
(the log I show here is from my linux router box
114.XXXXXXX/192.168.1.1):
1) STUN: My phone connects to the STUN server stun.sipgate.net via UDP
on ports 44608 and 57890, which is shown in the conntrack log as
assured
Phone (src Port 44608) ----------> Router (src Port 44608) ---------->
STUN Server
Phone (src Port 57890) ----------> Router (src Port 57890) ---------->
STUN Server
(STUN Server (dst Port 44608) ----------> Router (src Port 44608)
----------> Phone)
(STUN Server (dst Port 57890) ----------> Router (dst Port 57890)
----------> Phone)


2) SIP: My Android phone connects to the Asterisk server on the SIP
ports (not shown here, as this works fine)
Phone (src Port 5092) ----------> Router (src Port 5092) ----------> SI=
P Server
(SIP Server (dst Port 5092) ----------> Router (dst Port 5092)
----------> Phone)

3) RTP1: My SIP Server tries to send the RTP traffic back to the
Android phone (initialised from the SIP protocol) to port 44608
(that's the same port that has been used by my phone to connect to the
STUN server !), but that doesn't work, because conntrack/netfilter has
mapped the port 44608, that my phone uses as the src port, to src port
1030 at the router.
Asterisk (DST Port 44608) ----------> Router (DST Port 44608) ------FAI=
LS---->
Phone    (SRC Port 44608) ----------> Router (SRC 1030) ----------> Ast=
erisk
(Asterisk, very intelligent "sees" that wrong port mapping, and rectifi=
es it!!!)
Asterisk (DST Port 1030) ----------> Router (DST 1030) ----------> Phon=
e (44608)

And this is the important point: Why does linux does a port mapping
here? why can't linux just use the same src port externaly that my
phone uses as the src port (44608), when sending data to my asterisk
box?
It re-maps the port my phone uses from 44608 (192.168.1.38) to
external port 1030 (external IP router 114.XXX.XXX.XXX).
(But as I said here, because asterisk is pretty intelligent it "sees"
that and rectifies it's ports. My phone says via the SIP protocol: "I
am on port 44608, please connect me there", but the actual connection
from my phone to the asterisk server comes from port 1030, because my
linux box does a (in my opinion wrong) port mapping), so asterisk
rectifies the dst port from 44608 to 1030, and lives with that. And it
works!

4) RTP2: Now Asterisk tries to "switch" the RTP stream and not be "in
the middle" anymore, and tells GMX to NOT send the RTP data to the
asterisk server anymore, but to the router (the Phone). But because
this is a new connection, asterisk assumes, that this port mapping of
port 44608 to 1030 is for the Asterisk VoIP server only and tells GMX
to use the RTP port 44608 that my Phone is using as it's src port for
sending RTP audio data. At the same time my phone gets the same
inmormation, "Please send the RTP stream directly to the GMX server
Port dst port (35642).
Phone (DST Port 35642, SRC Port 44608) ----------> Router (DST Port
35642, SRC Port 1030)   ----------> GMX (WORKS!) (But one way audio
onlye, because:)
GMX   (SRC Port 35642, DST Port 44608) ----------> Router (SRC Port
35642, DST Port 44608) -----FAILS!----->

See the clash here: The connection should be between: GMX Port 35642
<-----> Phone Port 44608
But because linux is in between and does a port mapping that
connection fails, as linux remaps port 44608 of the port to external
port 1030,

Is that clearer now?
Here is a summary of the UDP connections again (see FAILS for the
errors I have because of the wrong port mapping linux does):
Phone (src Port 44608) ----------> Router (src Port 44608) ---------->
STUN Server
(STUN Server (dst Port 44608) ----------> Router (src Port 44608)
----------> Phone)
Phone (src Port 57890) ----------> Router (src Port 57890) ---------->
STUN Server
(STUN Server (dst Port 57890) ----------> Router (dst Port 57890)
----------> Phone)
Phone (src Port 5092) ----------> Router (src Port 5092) ----------> SI=
P Server
(SIP Server (dst Port 5092) ----------> Router (dst Port 5092)
----------> Phone)
Asterisk (DST Port 44608) ----------> Router (DST Port 44608) ------FAI=
LS---->
Phone    (SRC Port 44608) ----------> Router (SRC 1030) ----------> Ast=
erisk
Asterisk (DST Port 1030) ----------> Router (DST 1030) ----------> Phon=
e (44608)
Phone (SRC Port 44608) ----------> Router (SRC 1030) ----------> Asteri=
sk
GMX   (SRC Port 35642, DST Port 44608) ----------> Router (DST 44608)
-----FAILS!----->

Please let me know, if you have other questions.
As I said, I can only post Text Mails to this mailing list, so I
cannot provide any nice pictures.
I tried my best to provide text-graphics.

Thanks, Joern.

The conntrack log in a more readable form (hope it comes through):

# Here is the STUN-Part
[NEW] 192.168.1.38:44608      -> 216.93.246.14:3478 |
216.93.246.14:3478 -> 114.XX.234.123:44608
[NEW] 192.168.1.38:57890      -> 216.93.246.14:3478 |
216.93.246.14:3478 -> 114.XX.234.123:57890
[UPDATE] 192.168.1.38:44608 -> 216.93.246.14:3478 | 216.93.246.14:3478
-> 114.XX.234.123:44608 [ASSURED]
[UPDATE] 192.168.1.38:57890 -> 216.93.246.14:3478 | 216.93.246.14:3478
-> 114.XX.234.123:57890 [ASSURED]
# STUN ended - Two connections assureds, ports: 44608 and 57890

# Now we try to connect to the VoIP Server source port 44608 and 57890
( this might be some ICE related thing, I cannot explain, why my
client does it, but that's actually not the problem.
[NEW] 122.XX.115.203:10020 -> 114.XX.234.123 44608 |
114.XX.234.123:44608 -> 122.XX.115.203:10020 [UNREPLIED]
[NEW] 192.168.1.38:57890    -> 122.XX.115.203:10021 |
122.XX.115.203:10021 -> 114.XX.234.123:57890 [UNREPLIED]
# !!!!!!! Look here !!!!!!! That's where it starts! Why do we have a
port mapping here???
[NEW] 192.168.1.38:44608     -> 122.XX.115.203:10020 |
122.XX.115.203:10020 -> 114.XX.234.123:1030 [UNREPLIED]
# And from that point on it goes down the drain!
# Se the port mapping to port 1030!!!???!!!! Why?!
[UPDATE] 192.168.1.38:44608 -> 122.XX.115.203:10020 |
122.XX.115.203:10020 -> 114.XX.234.123:1030
[UPDATE] 192.168.1.38:44608 -> 122.XX.115.203:10020 |
122.XX.115.203:10020 -> 114.XX.234.123:1030 [ASSURED]
# The connection is assured, because Asterisk is basically listening
to everything on that port and changes the port it send the data back
# But my VoIP Provider is not that intelligent. :-((( See the following
[NEW] 192.168.1.38:44608   -> 62.52.147.185:35642  |
62.52.147.185:35642   ->114.XX.234.123:1030 [UNREPLIED]
[NEW] 62.52.147.185:35642 -> 114.XX.234.123:44608 |
114.XX.234.123:44608 -> 62.52.147.185:35642 [UNREPLIED]
[NEW] 62.52.147.185:44609 -> 114.XX.234.123:44609 |
114.XX.234.123:44609 -> 62.52.147.185:35643 [UNREPLIED]
[NEW] 192.168.1.38:57890   -> 62.52.147.185:35643  |
62.52.147.185:35643   -> 114.XX.234.123:57890 [UNREPLIED]

On Wed, Nov 14, 2012 at 7:09 AM, Eliezer Croitoru <eliezer@ngtech.co.il=
> wrote:
>
> Hi J=C3=B6rn,
>
> You must first understand that you description is kind of vague on wh=
at the actual network setup is and you are just referring to specific t=
hings in the whole picture which what leads every reader to another con=
clusion.
>
> I will try to write you the question that I still dont know the answe=
r for:
> what is the network path of the packets?(routing)
> Where is this NAT happening?
> I will give you an example that can clear up what We need to try to h=
elp you stay focused:
> http://wiki.squid-cache.org/ConfigExamples/UbuntuTproxy4Wccp2#Toplogy
>
> The above diagram shows and describes path and network diagram in a w=
ay that seems to me good.
>
> 192.168.1.38 sends packet to?
> what external IP this router use? 114.XX.234.123 ?
> if the IP of the asterisk server is:  122.XX.115.203 then what nat? t=
o what direction? on what machine?
> If it's a xen host that hosts the asterisk server I would say it's on=
e of the bad choices ever(from my experience) to host VOIP server.
> The whole question you are asking looks very weird from the conntrack=
 output.
>
> From netfilter\technial point of view fire-walling is not NAT in any =
way while they both use some common modules.
> (I dont know how much you know so I am now on the "syn-ack" part of t=
he question from you to make sure we get the connection right and on th=
e same src,dst logic)
>
> If you do host any SIP service behind a firewall and\or nat you shoul=
d be explicit on what is allowed to the direction of the SIP server.
>
> I still dont understand how you managed to capture all this conntrack=
 (topology+machines) data on the same machine.
>
> If you do have problem with this specific part:
>
> > # The connection is assured, because Asterisk is basically listenin=
g
> > to everything on that port and changes the port it send the data ba=
ck
> > # But my VoIP Provider is not that intelligent. :-((( See the follo=
wing
> > [NEW] 192.168.1.38:44608 -> 62.52.147.185:35642  | 62.52.147.185:35=
642
> > ->114.XX.234.123:1030 [UNREPLIED]
> > [NEW] 62.52.147.185:35642 -> 114.XX.234.123:44608 |
> > 114.XX.234.123:44608 -> 62.52.147.185:35642 [UNREPLIED]
> > [NEW] 62.52.147.185:44609 -> 114.XX.234.123:44609 |
> > 114.XX.234.123:44609 -> 62.52.147.185:35643 [UNREPLIED]
> > [NEW] 192.168.1.38:57890 -> 62.52.147.185:35643 | 62.52.147.185:356=
43
> > -> 114.XX.234.123:57890 [UNREPLIED]
>
> You should configure the RTP and SIP settings right.
> how exactly the VOIP phone "192.168.1.38" contacts the PSTN provider =
"62.52.147.185" and why?(make it clear so I and others can understand t=
he situation)
> If you do have Asterisk server then this server should contact the SI=
P\PSTN provider and not the SIP phone.
>
> The stun should be and should only be related to the external connect=
ions from the phone to a server in the internet.
> Any other stuff should be static as possible to assure that the servi=
ce will WORK.
>
> You have mentioned:
>
> /sbin/iptables -t nat -A POSTROUTING -j MASQUERADE -s 192.168.0.0/16
> before which is not any mechanism of symmetric nat but more of snat(s=
ource nat).
>
> NAT can never assure you symmetric port to port mapping and especiall=
y when you are natting more then 1000 hosts.
> There is a great possibility that in such a wide NAT size you will ha=
ve problems.
> two clients can use somehow the same port in the same time.
>
> My recommendation is that IF you can use even simple routing tunnel(I=
PIP\GRE) to avoid nat just use it.
> it's simple to setup and supported on any linux distribution I know o=
f.
>
> (all the above is based on that I didnt understood the network infras=
tructure and is a speculation only until I will know more)
>
> You can always contact me on my personal email to send me data you do=
nt want to publish on the public lists.
>
>
> Best Regards,
> Eliezer
>
>
> On 11/13/2012 1:42 PM, J=C3=B6rn Krebs wrote:
>>
>> Hi Eliezer,
>>
>> I think your comment is a bit offensive, yes I understand how NAT
>> works, and yes I know what STUN does,
>> but in this case it is the NAT firewall who does some unneeded Port =
mapping!
>>
>> Setup:
>> External IP: 114.XX.234.123
>> Local Network : 192.168.1.0/24 -> Internal VoIP Phone: 192.168.1.38
>> STUN Server: 216.93.246.14
>> Asterisk Server: 122.XX.115.203
>> VoIP-PSTN Provider: 62.52.147.185
>>
>> And what I do is:
>> Call a number on my Asterisk Server, who then reroutes the call / th=
e
>> RTP stream directly to my VoIP Phone.
>> (I tried directmedia and directrtpsetup, both do not work, because
>> netfilter/conntrack does a port mapping.)
>>
>> I though you might be able to read this out of my first email, but t=
o
>> be honest, it was very hard to read,
>> that's why I shortened the conntrack -E log and made it a bit more
>> readable, and attach it here:
>> --------------------------------------------------------------------=
-------------------------------------------------------------------
>> # Here is the STUN-Part
>> [NEW] 192.168.1.38:44608 -> 216.93.246.14:3478 | 216.93.246.14:3478 =
->
>> 114.XX.234.123:44608
>> [NEW] 192.168.1.38:57890 -> 216.93.246.14:3478 | 216.93.246.14:3478 =
->
>> 114.XX.234.123:57890
>> [UPDATE] 192.168.1.38:44608 -> 216.93.246.14:3478 | 216.93.246.14:34=
78
>> -> 114.XX.234.123:44608 [ASSURED]
>> [UPDATE] 192.168.1.38:57890 -> 216.93.246.14:3478 | 216.93.246.14:34=
78
>> -> 114.XX.234.123:57890 [ASSURED]
>> # STUN ended - Two connections assureds, ports: 44608 and 57890
>>
>> # Now we try to connect to the VoIP Server source port 44608 and 578=
90
>> ( this might be some ICE related thing, I cannot explain, why my
>> client does it, but that's actually not the problem.
>> [NEW] 122.XX.115.203:10020 -> 114.XX.234.123 44608 |
>> 114.XX.234.123:44608 -> 122.XX.115.203:10020 [UNREPLIED]
>> [NEW] 192.168.1.38:57890 -> 122.XX.115.203:10021 |
>> 122.XX.115.203:10021 -> 114.XX.234.123:57890 [UNREPLIED]
>> # !!!!!!! Look here !!!!!!! That's where it starts! Why do we have a
>> port mapping here???
>> [NEW] 192.168.1.38:44608 -> 122.XX.115.203:10020 |
>> 122.XX.115.203:10020 -> 114.XX.234.123:1030 [UNREPLIED]
>> # And from that point on it goes down the drain!
>> # Se the port mapping to port 1030!!!???!!!! Why?!
>> [UPDATE] 192.168.1.38:44608 -> 122.XX.115.203:10020 |
>> 122.XX.115.203:10020 -> 114.XX.234.123:1030
>> [UPDATE] 192.168.1.38:44608 -> 122.XX.115.203:10020 |
>> 122.XX.115.203:10020 -> 114.XX.234.123:1030 [ASSURED]
>> # The connection is assured, because Asterisk is basically listening
>> to everything on that port and changes the port it send the data bac=
k
>> # But my VoIP Provider is not that intelligent. :-((( See the follow=
ing
>> [NEW] 192.168.1.38:44608 -> 62.52.147.185:35642  | 62.52.147.185:356=
42
>> ->114.XX.234.123:1030 [UNREPLIED]
>> [NEW] 62.52.147.185:35642 -> 114.XX.234.123:44608 |
>> 114.XX.234.123:44608 -> 62.52.147.185:35642 [UNREPLIED]
>> [NEW] 62.52.147.185:44609 -> 114.XX.234.123:44609 |
>> 114.XX.234.123:44609 -> 62.52.147.185:35643 [UNREPLIED]
>> [NEW] 192.168.1.38:57890 -> 62.52.147.185:35643 | 62.52.147.185:3564=
3
>> -> 114.XX.234.123:57890 [UNREPLIED]
>> --------------------------------------------------------------------=
-----------------------------------------------------------------
>> As you can see, half way through ( Underneath my !!!!!!!! comment)
>> conntrack/netfilter, linux does a port mapping, and does not use the
>> internal port 44608, but mapps the port to port 1030, for whatever
>> reason.
>> I am pretty sure this port-mapping is unneeded, and it messes up my
>> VoIP calls, as the providers are thinking my external port is 44608
>> (that's the port the device uses), but linux maps it to port 1030.
>> Can anyone technically explain to me why conntrack/netfilter does
>> this? Why can't netfilter just do a second mapping (first mapping wa=
s
>> the one from the STUN connection, line 3)?
>>
>> This is not a symmetrical NAT!
>>
>> And please I do my best to explain this, if you need more info or yo=
u
>> don't understand my explanation, I am willing to give more detailed
>> info, or explain it in a different way, but don't be offensive,
>> please.
>>
>> Thanks.
>
>
>
> --
> Eliezer Croitoru
> https://www1.ngtech.co.il
> IT consulting for Nonprofit organizations
> eliezer <at> ngtech.co.il
