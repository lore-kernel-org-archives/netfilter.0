From: =?iso-8859-1?Q?Paul_Blond=E9?= <jpb@entel.ca>
Subject: RE: iptables doesn't keep chain list after reboot
Date: Thu, 17 May 2007 08:00:01 -0700
Message-ID: <001801c79894$0b0fe000$5a05a8c0@nisgaa.net>
References: <b6d73fa90705170741o690baad4u9b37ff8b51cf530a@mail.gmail.com>
Reply-To: jpb@entel.ca
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-reply-to: <b6d73fa90705170741o690baad4u9b37ff8b51cf530a@mail.gmail.com>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

This is to keep you from making a mistake and not being able to get back
into your server. One reboot, and everything is back to the way it was
before the change. Of course, you can take other measures to regain =
access
without having to take your server down, but this is a last-ditch method =
in
case you didn't take any other precautions.

Once you have a rule set that you are confident with, you have to make =
it a
part of your server's startup sequence, much like a personal firewall
automatically makes itself a part of your Windows startup.

You will find all this and more here: http://www.iptablesrocks.org



~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Paul Blond=E9



> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org=20
> [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of TheNokia
> Sent: Thursday, May 17, 2007 7:41 AM
> To: netfilter@lists.netfilter.org
> Subject: iptables doesn't keep chain list after reboot
>=20
>=20
> Hi,
>=20
> iptables doesn't keep chan list after rebooting. I need to recreate
> all of them.
>=20
> Is there something to do?
>=20
> Thanks.
>=20


