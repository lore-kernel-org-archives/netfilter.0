From: un_brice <98111@free.fr>
Subject: LAN pass, but not loopback
Date: Sat, 21 May 2005 00:26:47 +0200
Message-ID: <200505210026.47727.98111@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi,
I'm currently trying to discover iptables. In that aim I created a little=20
script to "protect" my lan (4 computers).
It became pretty complex with the time, but remain clean... and should work=
,=20
at least I think.
The problem is it doesn't : it contain, among other things
#Loopback interface
iptables -A INPUT -o lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT
[..]
#Apache
iptables -A INPUT -p tcp --dport http -m connlimit ! --connlimit-above 40 \
=2Dj ACCEPT

=46rom the inside, wget http://my_server works as it should, from outside a=
lso,=20
but not from the computer himself !
=46or the same reason (i think) Samba cannot connect to CUPS... and I've ma=
ny=20
other problems.
I've tried as I could to understand this problem but failed. On the other=20
hand, each time I suspected a bug in a complex software (iptables here), I=
=20
was wrong.
So, if one would have time to tell me were... mummy would be very happy as =
she=20
could print again -_^.

Sorry for my bad english. You can read the whole script at=20
http://98111.free.fr/serv/served/iptables.en.sh , I tried to traduce commen=
ts=20
in english but I'm not sure of the result.

By the way, what do you think of the way I tried to reduce the overload due=
 to=20
TARPIT ? Would it work ?

Thanks !
Brice

=2D-=20
"Emacs is my operating system, and Linux its device driver."
 -- Bake Timmons

