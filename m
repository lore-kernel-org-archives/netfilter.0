From: "Mario Ohnewald" <mario.Ohnewald@gmx.de>
Subject: Total traffic
Date: Sun, 5 Oct 2003 14:24:20 +0200 (MEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <693.1065356660@www48.gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
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
To: netfilter@lists.netfilter.org

Hello!
I am running the SuSI Firewall2, and i want to find out my total traffic,
which i need for my traffic script.
I have 2 questions about it:
Will: iptables  -L -vnx | grep "state NEW,RELATED,ESTABLISHED" | grep
"ACCEPT     all"

Give me the toal traffic? If yes, why does iptraf log about twice as much
traffic than my iptables??

Should it not be the same, or am i looking at the wrong iptables line?


Cheers, Mario

--=20
NEU F=DCR ALLE - GMX MediaCenter - f=FCr Fotos, Musik, Dateien...
Fotoalbum, File Sharing, MMS, Multimedia-Gru=DF, GMX FotoService

Jetzt kostenlos anmelden unter http://www.gmx.net

+++ GMX - die erste Adresse f=FCr Mail, Message, More! +++


