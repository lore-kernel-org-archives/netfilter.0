From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: Microsoft clients logon
Date: Thu, 17 Jul 2003 09:17:56 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF52E35AA@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Class: urn:content-classes:message
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
To: monz@danbbs.dk, Netfilter <netfilter@lists.netfilter.org>

I can't say for sure what the problem is, but the best advice I can give
is to LOG all traffic to that server that is not on those ports. You may
see a very blatant pattern about what you aren't sending through.

PS: you also need udp/tcp 53 DNS, or active directory gets fcked up.
Maybe even WINS (tcp 42) is good if you have some legacy stuff.


