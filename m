From: alexander.swann@synetics.fr
Subject: =?iso-8859-1?Q?R=E9f=2E_=3A_Re=3A_Logging_-_where_does_it_go=3F=3F?=
Date: Wed, 3 Jul 2002 20:41:27 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <OF502635B7.8CB56F79-ONC1256BEB.00668D27-C1256BEB.0066E13F@synetics.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.samba.org


File exist :-))
but anyway, it should log in /var/log/messages because it logs everythi=
ng
from info to crit
.... Hummmm I just do not understand :((




|---------+------------------------------->
|         |           "riffraff"          |
|         |           <riffraff@mail.ev1.n|
|         |           et>                 |
|         |           Envoy=E9 par :        |
|         |           netfilter-admin@list|
|         |           s.samba.org         |
|         |                               |
|         |                               |
|         |           03/07/2002 20:30    |
|         |           Veuillez r=E9pondre =E0 |
|         |           riffraff            |
|         |                               |
|---------+------------------------------->
  >--------------------------------------------------------------------=
-----------------------------------------------------------------------=
-----|
  |                                                                    =
                                                                       =
     |
  |       Pour :    <netfilter@lists.samba.org>                        =
                                                                       =
     |
  |       cc :                                                         =
                                                                       =
     |
  |       Objet :   Re: Logging - where does it go??                   =
                                                                       =
     |
  >--------------------------------------------------------------------=
-----------------------------------------------------------------------=
-----|




---------- Original Message ----------------------------------
From: alexander.swann@synetics.fr
Date: Wed, 3 Jul 2002 20:24:03 +0200

>I tested to add these 2 ones (as suggested by GeorgeV)... but without =
any
>result ...
>
>*.*                                       /var/log/test
>*.=3Ddebug                                  /var/log/debugF
>
>(I restarted the syslogd also)
>
>So my stupid question is :
>What did I miss so that all logs goes in a file ? /var/log/messages or=
 an
>other one ...
>
>Help ;-))
>
I believe syslog also requires the file to exist before it can log to i=
t,
so do a touch /var/log/test /var/log/debugF, then restart syslod.





=



