From: alexander.swann@synetics.fr
Subject: =?iso-8859-1?Q?R=E9f=2E_=3A_Re=3A_How_to_block_Yahoo_Messenger_through_IP?=
 Tables
Date: Sun, 6 Oct 2002 13:51:13 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OF2D6B6B5A.A090A314-ONC1256C4A.0040F95A-C1256C4A.00411AE8@synetics.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-9"
To: netfilter@lists.netfilter.org


Re,

Stupid question :
Inetd or Xinetd cant block an outgoing port ?

Regards
Swann ;-)



|---------+----------------------------------->
|         |           Krishna                 |
|         |           <Krishna_shekhar@vsnl.ne|
|         |           t>                      |
|         |           Envoy=E9 par :            |
|         |           netfilter-admin@lists.ne|
|         |           tfilter.org             |
|         |                                   |
|         |                                   |
|         |           05/10/2002 11:00        |
|         |                                   |
|---------+----------------------------------->
  >--------------------------------------------------------------------=
-----------------------------------------------------------------------=
-------|
  |                                                                    =
                                                                       =
       |
  |       Pour :    netfilter@lists.netfilter.org                      =
                                                                       =
       |
  |       cc :                                                         =
                                                                       =
       |
  |       Objet :   Re: How to block Yahoo Messenger through IP Tables =
                                                                       =
       |
  >--------------------------------------------------------------------=
-----------------------------------------------------------------------=
-------|




Hi,

    But why do you want to do that? If you want to block a particular
port then either disable it in inetd or xinetd. Or make rules
for that destination port to DROP packets.


regards
Krishna

Krishna Shekhar
Network Administrator
Wiplash Wireless

On Sat, 2002-10-05 at 11:59, Alok Shukla wrote:
> Hi ,
>
> Sorry for asking this newbie question first.
>
> I am running a network with a Linux Server as a
> gateway. I am using IPtables as to masquerade internal
> IPs for Internet usage. I want to block the uses of my
> intranet for using yahoo messenger. I needed help for
> this. In general i wanted to know how to block a
> particular port.
>
> Thanks in Advance
>
> Alok Shukla
>
> __________________________________________________
> Do you Yahoo!?
> Faith Hill - Exclusive Performances, Videos & More
> http://faith.yahoo.com
>






=



