From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: A simple question
Date: Thu, 19 Aug 2004 10:47:07 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF591E359@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: Nick Drage <nickd@metastasis.org.uk>, netfilter@lists.netfilter.org


> If you're using IPTables as a seperate firewall then wouldn't you just
> want SSHD listening on the internal interface?

>=20
> You're presuming that IPTables isn't protecting a single host.  If
> you're using it on a desktop or a server filtering on the OUTPUT chain
> gives you a huge gain in security.

Very true on both points. You should only bind SSH to your secured
channels. Even then you'll have to be careful of internal staff/wormed
PC's trying to exploit the service. Good audit logging and IDS traps for
SSH exploits would be a good start.

In the other case of a desktop Linux, you are very true that OUTPUT
filtering will become more and more prevailent as desktop Linux matures.
I was strictly speaking about gateway/firewalls, not end-user
protection. I wouldn't doubt that someone will develop a netfilter
module along the lines of zonealarm and other 'personal' firewalls.

