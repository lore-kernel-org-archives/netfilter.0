From: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Subject: Re: why must linux for halted firewall?
Date: Tue, 16 Sep 2003 14:55:28 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F675CA0.9010107@Loudoun-Fairfax.com>
References: <BAY8-F93kuutSgcOrBL0000ec1b@hotmail.com>	 <Pine.LNX.4.53.0309161040220.4397@xena.cft.ca.us> <1063736809.783.62.camel@elendil.intranet.cartel-securite.net>
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------050707080307090005030306"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1063736809.783.62.camel@elendil.intranet.cartel-securite.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Cedric Blancher <blancher@cartel-securite.fr>
Cc: Jim Carter <jimc@math.ucla.edu>, Chua Boon Ping <nitb@hotmail.com>, netfilter@lists.netfilter.org

This is a multi-part message in MIME format.
--------------050707080307090005030306
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by NS1.Trans-Star.net id h8GItTc27524

Cedric Blancher wrote:

>Le mar 16/09/2003 =E0 19:46, Jim Carter a =E9crit :
> =20
>
>>I'm not sure what you mean by a "halted firewall".  Do you mean that th=
e
>>kernel uses the "halt" instruction when there is no work to do?
>>   =20
>>
>
>Nope.
>An halted firewall is a firewall that is halted, i.e. you have executed
>"halt" command. Box is configured not to send halt signal to ATX supply
>so it is still powered and network stuff is not killed (interfaces up,
>ruleset not flushed, etc.). As kernel is still alive, your box can
>continue it's routing/filtering tasks as they're handled within kernel.
>
>But, you won't have the ability to log onto the firewall to update rules
>or have applications running (no logs).
>
> =20
>

What would be the benefit in configuring a system like this? It seems to=20
run contrary to the evolution of IT appliances where you can configure=20
and manage everything usually without restarting (firewalls, switches,=20
print servers, even ups units). I don't get it ;-)

--------------050707080307090005030306
Content-Type: text/html; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by NS1.Trans-Star.net id h8GItTc27524

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta http-equiv=3D"Content-Type"
 content=3D"text/html;charset=3DISO-8859-15">
  <title></title>
</head>
<body text=3D"#000000" bgcolor=3D"#ffffff">
Cedric Blancher wrote:<br>
<blockquote type=3D"cite"
 cite=3D"mid1063736809.783.62.camel@elendil.intranet.cartel-securite.net"=
>
  <pre wrap=3D"">Le mar 16/09/2003 =E0 19:46, Jim Carter a =E9crit :
  </pre>
  <blockquote type=3D"cite">
    <pre wrap=3D"">I'm not sure what you mean by a "halted firewall".  Do=
 you mean that the
kernel uses the "halt" instruction when there is no work to do?
    </pre>
  </blockquote>
  <pre wrap=3D""><!---->
Nope.
An halted firewall is a firewall that is halted, i.e. you have executed
"halt" command. Box is configured not to send halt signal to ATX supply
so it is still powered and network stuff is not killed (interfaces up,
ruleset not flushed, etc.). As kernel is still alive, your box can
continue it's routing/filtering tasks as they're handled within kernel.

But, you won't have the ability to log onto the firewall to update rules
or have applications running (no logs).

  </pre>
</blockquote>
<br>
What would be the benefit in configuring a system like this? It seems
to run contrary to the evolution of IT appliances where you can
configure and manage everything usually without restarting (firewalls,
switches, print servers, even ups units). I don't get it ;-)<br>
</body>
</html>

--------------050707080307090005030306--


