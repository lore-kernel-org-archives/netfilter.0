From: "Miguel Laborde" <Miguel.Laborde@qlogitek.com>
Subject: RE: -j SNAT question
Date: Thu, 30 Oct 2003 09:54:50 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D5A9EB3555F2D04AB1EE3DD6C748C47554F43D@qlmail.qlogitek.com>
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
To: Jim Carter <jimc@math.ucla.edu>
Cc: netfilter@lists.netfilter.org

Thanks Jim,

	you hit on everything that I was unsure of. I understand how it works =
now - thanks!

-----Original Message-----
From: Jim Carter [mailto:jimc@math.ucla.edu]
Sent: Thursday, October 30, 2003 12:42 AM
To: Miguel Laborde
Cc: netfilter@lists.netfilter.org
Subject: Re: -j SNAT question


On Wed, 29 Oct 2003, Miguel Laborde wrote:

> the DMZ such as web/ftp/etc. What I currently do is DNAT in the
> PREROUTING chain to my DMZ addresses for these machines, and then in =
the
> POSTROUTING chain i -J SNAT to my main firewall IP. This is where the
> question arises.
--snip--

> So everything that goes out through my firewall is source nat'd to the
> firewall's IP. This is where I'm confused.. mostly by the fact that =
this
> kind of setup appears to work while I think it shouldn't. If a client
> sends a SYN packet with the destination IP of EXT_IP_WEB and then gets =
a
> ACK packet back with the source IP set to EXT_IP_FW won't it wonder =
what
> the heck is going on and just ignore it?!

No, because the internal webserver acks to the external (?) firewall, =
which
de-SNATs it (so the ack's destination is now the client) and then =
de-DNATs
it (so the ack's source is the external web address), so the client =
thinks
there is a real machine at the external web address which is talking to =
it.

If the objective is to ensure that the internal webserver sends =
responses
to the firewall and not some strange alternative route that doesn't know =
to
undo the DNAT transformation, I think it would be safer to SNAT to the
firewall's internal (DMZ) address, which is what the webserver is =
supposed
to send the packet to anyway, as a gateway to the external firewall
address.  But if the only way to the Internet (at least, the only way =
known
to the webserver) is through that one firewall, I think most people =
don't
bother with the SNAT step.

On the other hand, traffic *originating* on the internal net, which
presumably is not routeable, needs SNAT as it goes out the external
firewall interface, so replies from the wide world will return to the
firewall.

Or is this actually what you're doing -- did I misunderstand your rules?
When an outside client originates the connection, subsequent packets =
will
not get SNAT treatment in the outgoing direction -- only originating =
(SYN
and not RST) packets lead to creation of a SNAT conntrack, in this
scenario.

James F. Carter          Voice 310 825 2897    FAX 310 206 6673
UCLA-Mathnet;  6115 MSA; 405 Hilgard Ave.; Los Angeles, CA, USA =
90095-1555
Email: jimc@math.ucla.edu  http://www.math.ucla.edu/~jimc (q.v. for PGP =
key)

