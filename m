From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: VPN?
Date: Fri, 13 Aug 2004 13:59:13 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC9051280@asimail2.alphanumeric.com>
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

> On Fri, Aug 13, 2004 at 12:30:28PM -0400, Jason Opperisano wrote:
> >         # modprobe ip_conntrack_pptp
>
> FATAL: Module ip_conntrack_pptp not found.
>
> >         # modprobe ip_nat_pptp
>
> FATAL: Module ip_nat_pptp not found.
>
> > heh heh--well the pptp-conntrack-nat patch doesn't actually =
officially suppo
rt the 2.6 kernel:
>
> Now what do you suggest? Do I have to download anything?

i suggest you decide how much you're willing to do to get PPTP =
connections to work.  options as i see them:

- downgrade to a 2.4 kernel and apply pptp-conntrack-nat patch from POM

- try using the 2.6.8.0.rc1.2 kernel from the mandrake cooker repository =
that has the pptp modules pre-compiled in

- stick with the setup you have and accept that PPTP won't work through =
your firewall

i'm not recommending any one of the above over another--the choice is up =
to you.  i'm just trying to help you understand your options.

if anyone else is aware of some other avenue of getting the pptp modules =
to patch/compile against 2.6, please chime in.  it at least appears to =
be possible, as the mandrake cooker guys pulled it off.

-j

