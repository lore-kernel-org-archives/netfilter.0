From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: iptables 'make' killed my box
Date: Mon, 25 Aug 2003 13:27:06 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF52E3651@alderaan.smgtec.com>
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
To: jamie@nucdc.org, netfilter@lists.netfilter.org


>Can anyone verify if indeed the 'make' command for netfilter "probes"=20
>running modules?? (I would tend to think not, but...)

Considering that I usually build iptables against a kernel that isn't
even loaded yet, I seriously doubt that the compile probes the running
system.

Have you reproduced the make and found it reproducible?

