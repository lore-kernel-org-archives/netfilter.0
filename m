From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: RFC 3514 support?
Date: Tue, 1 Apr 2003 12:08:24 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5122DA9@alderaan.smgtec.com>
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
To: Scott MacKay <scottmackay@yahoo.com>, netfilter@lists.netfilter.org

Toggled bit randomness? Are you sure that is secure. I see a big pile of
trouble resulting from this e-bit. What about timing attacks using ebit
detection! Ack, I just got hacked by the evil bit of my own sinister
personality. Crud puppies!


-----Original Message-----
From: Scott MacKay [mailto:scottmackay@yahoo.com]=20
Sent: Tuesday, April 01, 2003 10:36 AM
To: netfilter@lists.netfilter.org
Subject: Re: RFC 3514 support?

I plan to add it into my userspace mangler, but only
for suspicious source IP addresses (like ones which
resolve with dangerous works like 'sinister')   :)

I also intend to shortcut some of the design for item
(4) by simply having a toggled bit to determine if it
should be on or off (thus achieving true, pure, even
randomness)...

-Scott

--- Bob Keyes <bob@sinister.com> wrote:
> I am wondering if there are any plans to support RFC
> 3514 in netfilter?
> ftp://ftp.rfc-editor.org/in-notes/rfc3514.txt
>=20
> Specifically, I'd like to tag all kazaa packets.


__________________________________________________
Do you Yahoo!?
Yahoo! Tax Center - File online, calculators, forms, and more
http://platinum.yahoo.com


