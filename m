From: Jorge Davila <davila@nicaraguaopensource.com>
Subject: Re: SYN/ACK and NEW packets
Date: Mon, 06 Aug 2007 17:35:12 -0600
Message-ID: <web-22122741@bk3.webmaillogin.com>
References: <20070804192109.GB4205@sid.toystory.lan>
	<web-22036612@bk3.webmaillogin.com>
	<20070806182027.GA11849@sid.toystory.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20070806182027.GA11849@sid.toystory.lan>
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
To: Franck Joncourt <franck.joncourt@wanadoo.fr>, netfilter@lists.netfilter.org

Franck,

In the the RFC 793 [1] we can read:

   A TCP connection progresses from one state to another in response to
   events.  The events are the user calls, OPEN, SEND, RECEIVE, CLOSE,
   ABORT, and STATUS; the incoming segments, particularly those
   containing the SYN, ACK, RST and FIN flags; and timeouts.

Then, the rule

iptables -A INPUT -m state --state NEW \
-p tcp SYN,FIN,RST,ACK ACK -j RETURN

_must_ match the packet sent by nmap because have a valid state (NEW) and a=
=20
valid flag (ACK) -a flag that is present in a normal tcp negotiation.

Someone may want dig in this?

Jorge D=C3=A1vila.

[1] http://www.ietf.org/rfc/rfc793.txt

On Mon, 6 Aug 2007 20:20:27 +0200
  Franck Joncourt <franck.joncourt@wanadoo.fr> wrote:
>> On Sat, 4 Aug 2007 21:21:09 +0200
>>  Franck Joncourt <franck.joncourt@wanadoo.fr> wrote:
>>> Hi,
>>> Looking at this :
>>> http://iptables-tutorial.frozentux.net/iptables-tutorial.html#SYNACKAND=
NEW
>>> I understand that in order to prevent my ip address from being spoofed,
>>> I should reject NEW packets with the SYN/ACK flags set and the others
>>> cleared.
>>> However, with the following nmap command I have tried to check it out :
>>> nmap --scanflags SYNACK 192.168.0.1
>>> all packets are known to be in the INVALID state rather than in the NEW
>>> state.
>>> state NEW tcp flags:FIN,SYN,RST,ACK/SYN,ACK -> 0 packet
>>> state INVALID tcp flags:FIN,SYN,RST,ACK/SYN,ACK -> 170 packets
>>> They talk about sequence number, as well, in the document, but I can't
>>> figure out what difference it makes.
>>> Did I miss anything ?
>=20
> On Sat, Aug 04, 2007 at 02:26:12PM -0600, Jorge Davila wrote:
>> Well, in the three-way handshake the flags in the packets are:
>>
>> 1) syn packet sent by the client
>> 2) syn,ack sent by the server
>> 3) ack sent by the client
>=20
> So far, I agree :p!
>=20
>> The packets in the NEW state for a statefull firewall (as iptables) are =

>> packets that belongs to a new "data stream", marked with the syn flag.
>=20
> What about sending packets with only the ACK flag set.
>=20
> Those packets matched the following rule every time on random ports :
>=20
> iptables -A INPUT -m state --state NEW \
> 	-p tcp SYN,FIN,RST,ACK ACK -j RETURN
>=20
> using nmap --scanflags ACK 192.168.0.1
>=20
> So, there is something wrong since I did not send any SYN packets. 530
> packets send and 530 packets matched. And none of them are part of a
> connection.
>=20
>> The packets in the INVALID state are packets, in your case specifically,=
=20
>> that implies a new "data stream" (or more properly, packets that does no=
t=20
>> belongs to a connection previously ESTABLISHED or to a connection RELATE=
D=20
>> to a connection previously ESTABLISHED) but this new "data stream" is no=
t=20
>> negotiating for open a new socket, is just sending "data".
>=20
> I understand what you mean, I hope so. The flags SYN/ACK are not
> sufficent to be matched as a NEW state since there is nothing in the
> data stream "to negotiate for a new socket".
>=20
>>
>> In fact, there are 0 packets with the state NEW with the flags=20
>> FIN,SYN,RST,ACK/SYN,ACK because the packets that you sent does not have =

>>the=20
>> right flags to be considered a valid packets to open a new connection.
>=20
> Ok.
>=20
> Do not worry about the ACK packets, unless you have an explanation and
> the time to put it down. There must be something in the RFC 793 about
> it.
>=20
> Thanks
>=20
> I apologize for the delay, but I saw your message when I was sorting
> out my spams.
>=20
> --=20
>Franck Joncourt
> http://www.debian.org - http://smhteam.info/wiki/
> GPG server : pgpkeys.mit.edu
>Fingerprint : C10E D1D0 EF70 0A2A CACF 9A3C C490 534E 75C0 89FE

Jorge Isaac Davila Lopez
Nicaragua Open Source
+505 430 5462
davila@nicaraguaopensource.com

