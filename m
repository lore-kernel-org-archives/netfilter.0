From: "Daniel Williams" <danielw@staff.iinet.net.au>
Subject: RE: Unknown error.
Date: Fri, 11 Aug 2006 07:04:52 +0800
Message-ID: <5B0731A8753509478386ED3D6513B2D101D5CFD6@isp-per-exch01.win2k.iinet.net.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: Justin Schoeman <justin@expertron.co.za>, netfilter@lists.netfilter.org


The bug is an error message mapping.=20

So in other words the command is failing for a legitimate reason,
iptables is just not giving you the useful error message. Try 1.3.4 and
see what the error message is, I don't believe you will find much
different.

Daniel=20

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Justin
Schoeman
Sent: Friday, 11 August 2006 1:35 AM
To: netfilter@lists.netfilter.org
Subject: Unknown error.

Hi again.

I was wondering if anybody could help me.  I am using kernel 2.6.17.8=20
with iptables 1.3.5, and I get the following error:

iptables: Unknown error 4294967295

for this command:

/usr/local/sbin/iptables -A INPUT -j CONNMARK --save-mark

I see a large number of hits for the error message on google, mainly=20
related to iptables 1.3.5, but I have not seen one thread with a=20
conclusive solution.

Could anybody please give me some pointers on where to start looking? Is

this an iptables bug, if so, what is the last good version.  If not,=20
what else can I look for?

Thanks,

Justin


