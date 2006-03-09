From: "Andreja Babic" <babic@nodau.net>
Subject: post-prerouting
Date: Thu, 9 Mar 2006 17:39:58 +0100 (CET)
Message-ID: <3550.195.140.184.10.1141922398.squirrel@mail.nodau.net>
Reply-To: babic@nodau.net
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
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi all,

can somebody tell me if it is possible to make NAT with iptables like:

(src IP, dst IP, dst port A) =3D> (natted_src_IP, original dst IP, dst po=
rt B)

for example:

(10.10.0.5,192.168.120.40,10080) =3D> (192.168.1.100,192.168.120.40,80)

If it is possible, can somebody explain me how do I do this?

Thanks in advance,

Andreja

