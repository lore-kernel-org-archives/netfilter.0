From: alexander.swann@synetics.fr
Subject: =?iso-8859-1?Q?R=E9f=2E_=3A_How_to_block_Yahoo_Messenger_through_IP?=
 Tables
Date: Sat, 5 Oct 2002 18:27:02 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OF2A444FE1.14BE65F7-ONC1256C49.0059E806-C1256C49.005A5A00@synetics.fr>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org


Hello
I just did a quick search in the mails I received ;-)

   -----------------------------------------------------
   Daryl Martin wrote on the 08/16/02 :

      Just block outgoing traffic on port 1863 to block messenger traff=
ic.
   http://support.microsoft.com/default.aspx?scid=3Dkb;EN-US;q278887

      To block Yahoo it seems that's a little bit tricker.  To block ya=
hoo
   you will have to block ports 5000-5010 for voice chat, 5100 for vide=
o.
   Yahoo messenger scans ports 5050 then 80 then any available port.  Y=
ou
   will probably most likely have to block the yahoo messenging IP.
   http://help.yahoo.com/help/us/mesg/use/use-17.html

   -----------------------------------------------------

   See also the message of "Hanz F." on the 10/01/02 (4 days ago)

   -----------------------------------------------------

Hope this will help

Swann ;-)




|---------+----------------------------------->
|         |           Alok Shukla             |
|         |           <alokshukla@yahoo.com>  |
|         |           Envoy=E9 par :            |
|         |           netfilter-admin@lists.ne|
|         |           tfilter.org             |
|         |                                   |
|         |                                   |
|         |           05/10/2002 17:59        |
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
  |       Objet :   How to block Yahoo Messenger through IP Tables     =
                                                                       =
       |
  >--------------------------------------------------------------------=
-----------------------------------------------------------------------=
-------|




Hi ,

Sorry for asking this newbie question first.

I am running a network with a Linux Server as a
gateway. I am using IPtables as to masquerade internal
IPs for Internet usage. I want to block the uses of my
intranet for using yahoo messenger. I needed help for
this. In general i wanted to know how to block a
particular port.

Thanks in Advance

Alok Shukla

__________________________________________________
Do you Yahoo!?
Faith Hill - Exclusive Performances, Videos & More
http://faith.yahoo.com



=



