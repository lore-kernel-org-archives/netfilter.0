From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: question about conntrack
Date: Mon, 2 Aug 2004 20:19:16 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC9051225@asimail2.alphanumeric.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-class: urn:content-classes:message
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

> Just a quick question. Is there a tutorial/how-to/example for =
conntrack
> module??

http://netfilter.org/documentation/HOWTO//netfilter-extensions-HOWTO-3.ht=
ml#ss3.3

should give you the basic idea.

> I've been using -m state ESTABLISHED, RELATED, NEW, and INVALID =
without
> doubts , but reading ponng I found conntrack module and I couldn
> undersant its usage..

essentially--it allows you to be much more granular in what you require =
to match a state entry.

with most of the POM stuff--if you can't figure out the point of it--you =
probably don't need it.

-j

