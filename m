From: "Michael J. Kidd" <linuxkidd@linuxkidd.com>
Subject: Traffic relaying Q?
Date: Sat, 31 May 2003 12:46:35 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000901c32794$328c89a0$6200a8c0@gossamer>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi all,
  I'll explain the reason, then ask the question.. =20

My wife uses a program online that only allows one connection per IP... =
She
wants to have one session running on one system to host a 'Room' 24x7, =
but
still be able to connect from another PC to actually 'talk'.  Now, I =
have at
my disposal several different Linux boxes that I own around the =
internet.
My Question is this:  How can I relay only a specific ports traffic from =
one
internal box ( Nat'd ) out to the internet, to another Linux box that I
have, and make it seem that the second box is the originator...=20

---------------------------------------------------------------------

Internal Box 1[]--+                                     Internet
                  +--[] Natting Firewall Linux box [] ----------- [X]
Internal Box 2[]--+



[X] --+
      +-[] Second Linux box
      |
      +- Relayed traffic from Internal Box 1 back to the internet


Does the drawing help?  I can explain more specifics if necessary, but I
think this will get the point across... I need all traffic to appear to
originate from this second Linux box, but still get relayed to and from
Internal Box 1... If that makes sense.

I think I could do it with a VPN, but I don't want to forward all =
traffic
from that box, just specific ports...

Thanks for any help,
Michael J. Kidd
http://www.linuxkidd.com


