From: "Gary W. Smith" <gary@primeexalia.com>
Subject: RE: PPTP conntrack with RHEL 4 (2.6.9)
Date: Fri, 25 Feb 2005 14:24:48 -0800
Message-ID: <27594E8BA9D5CA458F5EF87D88B6B48F1C96@pxtvjoexd01.pxt.primeexalia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-class: urn:content-classes:message
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Pierre Scholtes <p.scholtes@amster.com>, netfilter@lists.netfilter.org

Pierre,=20
=20
I have submitted an entry in bugzilla for this.  Hopefully they can find =
a resolution soon.  I have been fighting with this problem for nearly 6 =
months now under a variety of different builds with limited or no =
success.
=20
I don't think there are many people using the pptp conntrack modules in =
the capacity that I (or yourself probably) need to use them in.
=20
Here is the bugtrack information: =
https://bugzilla.netfilter.org/bugzilla/show_bug.cgi?id=3D302
=20
Hope this helps both of us in the long run.
=20
Gary

________________________________

From: netfilter-bounces@lists.netfilter.org on behalf of Pierre Scholtes
Sent: Fri 2/25/2005 12:30 AM
To: netfilter@lists.netfilter.org
Subject: PPTP conntrack with RHEL 4 (2.6.9)




Hi Gary, hi list

I have similar problems with a fedora core 3 (2.6.10) and in general
2.6.9 and 2.6.10 kernels.
As soon as the ip_conntrack_pptp, ip_conntrack_proto_gre, ip_nat_pptp
and ip_nat_proto_gre modules are loaded
on my firewall I am unable to establish vpn connections going through
the firewall. I tried several different patch-o-matic versions and
iptables 1.2.11 and iptables 1.3.0: always the same result.
Seems the conntrack-pptp patch doesn't work very well (or to be exact
not at all with kernels 2.6.9 and 2.6.10)
My question here: Did anyone get the conntack_pptp patch working with
any other version of the 2.6 kernel?

Any help would be appreciated because I still hope to get this working
without having to go back to the 2.4 kernel.

Thanks

Pierre


>Little more experimenting and some different/odd results...
>
>With the all for modules loaded I successfully made an outbound
connection from the firewall
>to remote POPTOP server.  At the same time I had a remote PPTPClient
(on RH 9)
>establish an inbound PPTP connection to the same firewall.  It also
worked.=20
>I dropped that connection multiple times and restablished it.=20
>At one point in time I had two connections inbound to the firewall.
>
>Now, with the modules loaded no incoming PPTP connections can be made
>with either a Windows XP or 2003 server.  If I unload the modules then
>I can make the same connection just fine.
>
>I have yet to test an outbound connection originating from behind
>the firewall (as I don't have any Linux/PPTPClient test boxes left).
>
>I have played with with the MTU (1450, 1400, 1200) on the XP
>workstation but it doesn't seem to do much.  Packet fragmentation
>shouldn't be a problem as it's on the same physical network.
>
>I was snooping around with ethereal and it seems that when the
> modules are loaded and I connect with XP (or 2003) that they are
>not responding.  When I turn the modules off they work fine and
>the packet gets answered by XP.  The irony is that both packets
>prior to XP's answer (or failure to answer) are identical with
>the exception of packet sequence.=20
>
>It's boggling the mind that these things would be the same yet
>XP/2003 decides not to answer it because the modules are loaded.
>
>Gary Smith





Pierre Scholtes
IT Consultant
Alunys/AMSter - rue Bara 135 - 1070 Bruxelles
Tel: +32 2 5562811 Fax: +32 2 5562810




------
This message (including any attachments) is confidential and may be =
privileged. If you have received it by mistake please notify the sender =
by return e-mail and delete this message from your system. Any =
unauthorised use or dissemination of this message in whole or in part is =
strictly prohibited. Please note that e-mails are susceptible to change. =
We shall not be responsible nor liable for the proper and complete =
transmission of the information contained in this communication nor for =
any delay in its receipt or damage to your system. We do not guarantee =
that the integrity of this communication has been maintained nor that =
this communication is free of viruses, interceptions or interference."

This message has been scanned for viruses and dangerous content by =
MailScanner, and is believed to be clean.
www.amster.com




