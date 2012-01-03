From: "Lloyd Standish" <lloyd@crnatural.net>
Subject: Re: Advice on best way to set up multi-route NAT for lots of IPs
Date: Mon, 02 Jan 2012 18:46:43 -0600
Message-ID: <op.v7hgf5rkx1lyi3@debiandesk2.net>
References: <CAKywjPrbjoLhcvPXVYg+8kZ53rPRJ5+dhePx4FB=OkpNjqUGxw@mail.gmail.com> <op.v7e9nhxox1lyi3@debiandesk2.net> <CAKywjPpKpVdBz9boAhgj=-F488ayAtoLK1ua=GWKZ1hjNMWpZA@mail.gmail.com> <op.v7fekow7x1lyi3@debiandesk2.net> <CAKywjPprq497Ox7hZRMXNApC24nkm4syEbrAkX02N-QOPBpKiA@mail.gmail.com> <op.v7gsi0a4x1lyi3@debiandesk2.net> <CAKywjPpK97N9hCVO7hsH4grCV62rmSbH_Dm5d=WcOutor3afWg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAKywjPpK97N9hCVO7hsH4grCV62rmSbH_Dm5d=WcOutor3afWg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed	delsp=yes"
To: Anton Melser <melser.anton@gmail.com>
Cc: netfilter@vger.kernel.org

On Mon, 02 Jan 2012 16:14:56 -0600, Anton Melser <melser.anton@gmail.co=
m> wrote:

> In a nutshell, one client =3D one IP =3D one reputation =3D many MTAs=
 (for
> redundancy and capacity and for no other reason) is the goal.
>

One client - one IP is NOT the method promoted by mailchimp, the servic=
e you said is an example of what you are doing.

 From the mailchimp.com page you referred me to (http://blog.mailchimp.=
com/should-you-send-from-a-dedicated-ip-address/):

"[ISPs' spam filters give low ranking to new IPs that suddenly send a l=
arge volume of email.] To try to offset the high volume from this new I=
P, we take huge chunks of their campaign and distribute those across ou=
r shared IPs. Only a small fraction of this customer=E2=80=99s email is=
 actually being sent from this dedicated IP during the break-in period.=
 But as you can see, for some filters, it=E2=80=99s still risky looking=
=2E And so you get delivery problems for a while.

So long as the volume stays somewhat consistent, and so long as spam co=
mplaints stay within acceptable thresholds, their dedicated IP will mak=
e its way to =E2=80=9CTrusted.=E2=80=9D Actually, it=E2=80=99ll go to =E2=
=80=9Cneutral=E2=80=9D for a while, then trusted."

I think the above makes it very clear why I understood that your servic=
e seeks to send out email for customers with source IPs *other* than th=
e customers' own IP, at least during the IPs "break-in period".

Now you explain what you are really trying to do is provide mail server=
 redundancy.  You can do that easily and cheaply with DNS failover.  Bu=
t that is off-topic.

I must not understand the solution you have in mind, because I can't se=
e how NAT could be of any help.

--
Lloyd
