From: "Eliot, GLI wireless tech support" <support8@greatlakes.net>
Subject: Classifying W32/MyDoom.A
Date: Thu, 29 Jan 2004 13:06:50 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3383379105910242B6F8878D41FA834201A7B5@glsql.greatlakes.net>
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
To: netfilter@lists.netfilter.org

Has anyone come up with a ruleset for classifying a random TCP or
specific SMTP connection as being the W32/MyDoom.A virus?

For instance, it spreads two ways:

1) Through email
2) Through Kazaa

I want to be able to take a TCP stream (like a Kazaa download) and match
it against a rule that would flag the packets with a specific MARK value
if it is the MyDoom.A virus being transferred. I would also like a
ruleset that would match if it is being transferred through SMTP.=20

Anyone have any ideas how to do this without too many false positives?
(IE a document on the web that describes the characteristics of
MyDoom.A).=20

Eliot Gable
iSWAT Leader
Internet Service Without Any Telephones
Great Lakes Internet, Inc.
112 N Howard Ave
Croswell, MI 48422
(810) 679-3395


