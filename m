From: "Didier Hung Wan Luk" <DidierH@frci.net>
Subject: Iptables --owner-uid
Date: Sat, 14 Sep 2002 14:36:24 +0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <39778BFB9C25BA429794B15B50AEC781045422@server-dcms>
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
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

Hello All,

I have a question about iptables with the --owner-uid option..

Is it possible to create rules with iptables based on users?

i.e can I say that user marry(uid=3D513) can telnet out but user =
John(uid=3D601) cannot?

In the iptables man it is said that --owner-? (owner module) can match =
characteristics of locally-generated packets only.. if this is the case =
then I cannot use it in an environment where all my clients are windows =
clients and the server is a Samba PDC with iptables. Am I right? Or is =
there another way to do this?

Thanks,

Didier Hung Wan Luk
FRCI, Sibotie House
L'Anse Courtois
Pailles
Tel: 230-2869636
Fax: 230-2869629



