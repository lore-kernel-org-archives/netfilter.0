From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: Question about REJECT in FORWARD rule
Date: Wed, 11 Aug 2004 16:24:20 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC9051272@asimail2.alphanumeric.com>
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

> On Wed, Aug 11, 2004 at 12:30:50PM -0400, Jason Opperisano wrote:
> > is not narrowing down the interface/source, and is hit before any =
connection tracking occurs.  i've never used "-j REJECT --reject-with =
tcp-reset" without also specifying "--syn" as it could have very odd =
results (and also doesn't make sense from a TCP perspective)...
>
> Really? I thought "-j REJECT --reject-with tcp-reset" would always do
> the right thing, even without specifying --syn (of course, it wouldn't
> be a bad idea to specify it anyway). I have several systems running =
fine
> without the --syn option explicitly mentioned. Could any of the "core"
> guys say if my assumption is wrong?
>
> Carlos

i should probably clarify my statement.  i suggested "--syn" to the OP =
because the desired outcome he had was for the client to receive a =
"Connection Refused" instead of a timeout--like you would get with no =
firewall in place and a host not listening on the requested destination =
port.  that is:

Client	Server
 SYN ->
		<- RST

in the generic case, either side of an established TCP session can =
choose to reset the connection at any time; so "--syn" in that sense is =
not required.

i am surely no coder--and would be interested in hearing the answer to =
this from the gurus myself as well.  perusing =
/usr/src/linux/net/ipv4/netfilter/ipt_REJECT.c leads me to believe the =
only TCP-flag-related sanity check is to not send a RST to a RST (~ line =
98 on the version i have).

i guess i got gunshy back in my IPF days, when if you didn't use "flags =
S/SA" with a "return-rst" you would end up blowing away connections all =
over the place...old habits die hard.

-j

