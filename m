From: "Bassam A. Al-Khaffaf" <bassam@palettemm.com>
Subject: Problem with POM
Date: Mon, 30 Aug 2004 18:01:30 +0800
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <E1C1j0g-0007UK-00@deer.gmane.org>
Reply-To: bassam@palettemm.com
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="windows-1252"
To: netfilter@lists.netfilter.org

Hi All,
   I am trying to install the patch =93pptp-conntrack-net=94 from the =
pom. When
I lunch the pom I don't get the request of installing the
pptp-conntrack-nat, while I am getting the others. In order to make the
image more clear please follow my steps as stated down (please correct =
for
me in I am mistaken):

# KERNEL_DIR=3D/usr/src/linux-2.4.20-8/ ./runme pending
Where is your iptables source code? [/usr/src/iptables]
/usr/src/iptables-1.2.11

I got the following report

The "init_conntrack-optimize" patch ---> cannot apply (1 missing files)
The "linuxdoc" patch			---> cannot apply (6 missing files)
The "nf-log" patch			---> can apply

Then I went through extra by writing the following=20

# KERNEL_DIR=3D/usr/src/linux-2.4.20-8/ ./runme extra
Where is your iptables source code? [/usr/src/iptables]
/usr/src/iptables-1.2.11

Here I got a list of patches, but I have never seen "pptp-conntrack-nat" =
in
between.

May I have you support regarding this matter so I can be able to install =
the
patch "pptp-conntrack-nat"

Thanks for the help in advance

Regards
Bassam

---
Outgoing mail is certified Virus Free.
Checked by AVG anti-virus system (http://www.grisoft.com).
Version: 6.0.744 / Virus Database: 496 - Release Date: 8/24/2004
=20


