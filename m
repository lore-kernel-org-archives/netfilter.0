From: yann Conan <yahn_ick@yahoo.fr>
Subject: Problem with LOG in /var/log/messages
Date: Sat, 18 Sep 2004 19:37:31 +0200 (CEST)
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20040918173731.14655.qmail@web20923.mail.yahoo.com>
References: <1095365796.2489.88.camel@wolfpack.ljm.dom>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1095365796.2489.88.camel@wolfpack.ljm.dom>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="windows-1252"
To: netfilter@lists.netfilter.org

Hi all,

I done this configuration test with iptables :
iptables -P INPUT DROP
iptables -A INPUT -j LOG
iptables -P OUTPUT DROP
iptables -A OUTPUT -j LOG

I done this with iptables on a mandrake and on a
REDHAT.
I try to ping in 127.0.0.1 and after
On Mandrake if I do a tail -f /var/log/messages I see
the DROP
On RedHat it doesn't work.

the syslog.conf on RedHat and Mandrake are:
*.info;mail.none;;news.none;authpriv.none
-/var/log/messages

What is the problem or what is the difference about
default configuration between Mandrake and redHat?

Best Regards,

Yann Conan
Bordeaux,France






=09

=09
	=09
Vous manquez d=92espace pour stocker vos mails ?=20
Yahoo! Mail vous offre GRATUITEMENT 100 Mo !
Cr=E9ez votre Yahoo! Mail sur http://fr.benefits.yahoo.com/

Le nouveau Yahoo! Messenger est arriv=E9 ! D=E9couvrez toutes les nouveaut=
=E9s pour dialoguer instantan=E9ment avec vos amis. A t=E9l=E9charger gratu=
itement sur http://fr.messenger.yahoo.com

