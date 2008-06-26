From: Martin <mylists@itcom.com.ar>
Subject: load balance [OT?] [Solution]
Date: Thu, 26 Jun 2008 12:05:34 -0300
Message-ID: <1214492735.4427.6885.camel@kr0sty>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Hello netfilter list!

About a month ago, I've posted a question about load balance. Finally
it's working and in production environment.

I want to thanks the hole list and specially AcrosCom and Mark Perry,
and a special thanks to =EF=BB=BFJulian Anastasov who takes time to rep=
ly my
mails.

This is what I've done.

Start testing Julian's "combinations" patches adding by one to kernel
and testing load balance.

=EF=BB=BFVanilla kernel 2.6.23
 |
 |____ +arprules =3D Load balance ok after reboot
  |
  |_____+routes =3D Load balance ok after reboot
   |
   |_ +jumbo patch hidden & forward_shared=3D Load balance ok after reb=
oot
    |
    |__ +rp_filter_mask=3D *

=EF=BB=BF* Here comes the difference. At reboot it goes out only to the=
 first
"nexthop", the second is used only if 1st gateway is down or saturated.


Then added "send-to-self" patch, but nothing changes about load balance=
,
just the first nexthop is used.


Here is where I contacted Julian Anastasov for some help. He told me th=
e
key was to ping both gateways and keep pinging then each few minutes to
know they where still alive. Then try load balance.


That was it, pinging gateways before load balance script and pinging
them every 10 minutes do the trick.


Thanks again to everyone and ask me if there is something I'm omitting.

See you all in the list!


Cheers,


Martin

