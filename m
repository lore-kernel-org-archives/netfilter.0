From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: Question about MARK target
Date: Wed, 18 Aug 2004 14:32:04 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC90512A4@asimail2.alphanumeric.com>
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

> In the PREROUTING table in mangle, is the MARK target a final target, =
or
> will a packet keep traversing the PREROUTING chain after getting =
marked?
>
> Thank you.

MARK is not a final target--it just sets the mark on the packet.  you =
can then use these marks as a match in later rules within =
mangle:PREROUTING or other chains in other tables.

-j


