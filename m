From: "Scott Knake" <sknake@Apexsoftware.com>
Subject: ipt_TCMSS.c -- A slight problem i'm having
Date: Mon, 1 Nov 2004 11:50:37 -0500
Message-ID: <424BCB4EA242A1429A8AF0548E8CFF0E123959@apexexchange.ApexSoftware.Com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

         /* Since it passed flags test in tcp match, we know it is is

            not a fragment, and has data >=3D tcp header length.  SYN

            packets should not contain data: if they did, then we risk

            running over MTU, sending Frag Needed and breaking things

            badly. --RR */

         if (tcplen !=3D tcph->doff*4) {

                 if (net_ratelimit())

                         printk(KERN_ERR

                                "ipt_tcpmss_target: bad length (%d
bytes)\n",

                                (*pskb)->len);

                 return NF_DROP;

         }

=20

Feb 20 09:47:02 klogd: ipt_tcpmss_target: bad length (60 bytes)=20

Feb 20 09:47:07 klogd: ipt_tcpmss_target: bad length (60 bytes)=20

Feb 20 09:47:11 klogd: ipt_tcpmss_target: bad length (60 bytes)=20

(router date is wrong)

=20

That is a little excerpt from ipt_TCMSS.c. The problem is that somebody
DoS'd me with syn Packets that contained data len(header) <!=3D
len(packet). I have a little ServGate SG100 router that handles my T1
connection. The router physically seized for the 5 minutes or so while
he packeted because of the amount of logging I'm guessing. How can I
block this with just an iptables ruleset? I'm trying not to limit the
incoming number of syn packets and I cant recompile netfilter since it
is running on a flavored kernel custom for the router. How am I going to
prevent this in the future?

