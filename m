From: Hudson Delbert J Contr 61 CS/SCBN <Delbert.Hudson@LOSANGELES.AF.MIL>
Subject: RE: OS Fingerprint
Date: Mon, 29 Nov 2004 14:27:00 -0800
Message-ID: <29F6FAF7F2C0D41190980002A513591E0E93BAB2@FSNSAB30>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="----_=_NextPart_000_01C4D661.DE08213F"
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: 'Daniel Chemko' <dchemko@smgtec.com>, Vlado Had <vlado_had@yahoo.com>, netfilter@lists.netfilter.org

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_000_01C4D661.DE08213F
Content-Type: text/plain;
	charset="iso-8859-1"


daniel,

wow....the actual laundry list of activities and techniques required to
harden
any specific system from telling the world what os and apps are running is
REALLY
beyond the scope of the list.

or look at dsniff@monkey.org (that dug song's a pretty smart guy)

Vlad,

	you have a LOT of reading and research to do....

~piranha



-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org]On Behalf Of Daniel Chemko
Sent: Monday, November 29, 2004 2:12 PM
To: Vlado Had; netfilter@lists.netfilter.org
Subject: RE: OS Fingerprint


Vlado Had wrote:
> hi, could somebody help me, how can i change
> osfingerprint in packets?
> thanks

Do some homework. Basically a scanner uses inherent flaws in a packet
response to determine the destination machine, but it could also use the
fingerprint of the services running on the PC. Ex. if I implement 100%
faking on the networking part of my stealthing, but leave apache open,
the apache could say Redhat Linux blahblahblah and give it all away to
the hacker. It isn't just 'change TOS to random', or MSS to y, or block
all n packets to port q. Those are some OS fingerprint examples, but the
technique is a lot more detailed. If in doubt, tear open the nmap code!

------_=_NextPart_000_01C4D661.DE08213F--

