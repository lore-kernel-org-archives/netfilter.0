From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: accessing windows resources through firewall
Date: Mon, 26 Apr 2004 10:55:03 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5122F48@alderaan.smgtec.com>
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
To: ste@smxy.org, netfilter@lists.netfilter.org

It worked before the iptables system was inserted into the
> path. All other traffic is being passed successfully - just windows
> stuff isn't (though they *can* print to printers on the other side of
> the firewall). Nothing is logged when the attempt are made.

From watching this, it doesn't seem to be a netfilter problem at all.
Are you sure the routes from/to each network are configured properly?

Have you confirmed that you're getting WINS resolution? Is there a
reason you're using WINS over W2K DNS resolution? Still have w9x/NT4?

