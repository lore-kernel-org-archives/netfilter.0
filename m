From: ubberalles@yahoo.de
Subject: segmentation fault
Date: Mon, 20 Dec 2004 12:56:14 +0700
Message-ID: <200412201256140136.011B2F06@smtp.mail.yahoo.de>
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

I am using Slackware 10 distro, with 2.4.26 kernel and 1.2.10 iptables,=
 when i try to use something like this:

iptables -A FORWARD -p tcp -s 192.168.0.0/24 -d yahoo.com -j REJECT

a segmentation fault happen.

can somebody help...

cheers
JW


