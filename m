From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: Is Linux IPTABLES firewall comparable with license Firewall
Date: Sun, 19 Oct 2003 15:22:45 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5122E6B@alderaan.smgtec.com>
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
To: ads nat <adsnat@yahoo.com>, netfilter@lists.netfilter.org

I am making the assumptions that you have someone on staff to take care =
of the firewall as much as it needs to be. Also, you should have =
internal security checking with IDS's and systems integrity checking =
with something like tripwire. The two systems should be more or less =
equalent in these terms.

Where you do see the difference is checkpoints more exotic firewall =
functions like authentication services and more importantly, they have a =
much more entrenched application layer support suite. We have to look =
externally to handle app protocols. For them, much of it is built in.

That is on the purely security standpoint. There are other advantages =
here and there between Comercial and netfilter firewalls. Personally, I =
find the difference in PRICE to be the most distinctive difference.


