From: "Sebastian Seemann" <MisterSeaman@gmx.de>
Subject: (unknown)
Date: Sat, 04 Oct 2008 13:20:00 +0200
Message-ID: <20081004112000.258830@gmx.net>
References: <S1752389AbYJDKwq/20081004105246Z+121@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <S1752389AbYJDKwq/20081004105246Z+121@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hi,

I would like to DROP all connections from IPs originating in a specifie=
d country. Of course, the geoip extension is a perfect fit for that. My=
 question is what happens if I do this:

iptables -P INPUT DROP
iptables -A INPUT -m geoip ! --src-cc [country] -j ACCEPT

What happens if an IP is not found in the geoip-database, so it has no =
country-code at all? Is it accepted or not?
I would suppose it is accepted and, since I wanna be sure, would be tha=
nkful for a workaround simpler than adding every country in the world b=
ut the forbidden one.

Best Regards,
Sebastian
--=20
Psssst! Schon vom neuen GMX MultiMessenger geh=F6rt? Der kann`s mit all=
en: http://www.gmx.net/de/go/multimessenger
