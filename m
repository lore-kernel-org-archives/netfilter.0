From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: OS Fingerprint
Date: Mon, 29 Nov 2004 14:12:20 -0800
Message-ID: <7C9884991ADAE0479C14F10C858BCDF56795F1@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Class: urn:content-classes:message
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
To: Vlado Had <vlado_had@yahoo.com>, netfilter@lists.netfilter.org

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

