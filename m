From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: SSL Question
Date: 01 Aug 2003 16:51:00 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1059749459.4007.6.camel@elendil.intranet.cartel-securite.net>
References: <20030729224958.57764.qmail@web41303.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030729224958.57764.qmail@web41303.mail.yahoo.com>
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
To: nakisawame <nakisawame@yahoo.com>
Cc: netfilter@lists.netfilter.org

Le mer 30/07/2003 =E0 00:49, nakisawame a =E9crit :
> I am wondering if this will work... We are using NAT,
> and I currently have 2 different webservers that we
> need to put SSL on.
> Each webserver has a different external DNS entry (I
> am using 55.55.55.56 and 55.55.55.57 as examples).
> Each actual webserver is on its own internal IP
> address (192.158.0.14 and 192.168.0.15, respectively).
> Can I do something like this:
> iptables -t nat -A PREROUTING -p tcp -d 55.55.55.56
> --dport https -j DNAT --to 192.168.0.14:443
> iptables -t nat -A PREROUTING -p tcp -d 55.55.55.57
> --dport https -j DNAT --to 192.168.0.15:443
> Does this work? If it doesn't, how do I do this? This
> is driving me nuts!

Yes it will work, as long as your webservers are correctly configure to
handle external DNS name and according certificate.

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE

