From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: Need example of ip rate limiting
Date: Mon, 28 Jul 2003 10:36:41 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5122E0F@alderaan.smgtec.com>
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
To: Robert La Ferla <robertlaferla@comcast.net>, netfilter@lists.netfilter.org

How about
iptables -A INPUT --destination <blah> -p tcp --dport 80 -m state NEW -m
limit --limit 3/s -j ACCEPT
iptables -A INPUT --destination <blah> -p tcp --dport 80 -m state NEW -j
DROP

Adjust the 3/s number higher or lower depending on how much traffic your
site gets per second on average and then put it a little bit higher.

-----Original Message-----
From: Robert La Ferla [mailto:robertlaferla@comcast.net]=20
Sent: Monday, July 28, 2003 10:29 AM
To: netfilter@lists.netfilter.org
Subject: Re: Need example of ip rate limiting

Anyone have examples of iplimit to limit http DoS attacks?






