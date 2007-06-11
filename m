From: olivierk@club-internet.fr
Subject: --match recent
Date: Mon, 11 Jun 2007 11:23:36 +0200
Message-ID: <mnet1.1181553816.24811.olivierk@club-internet.fr>
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

Hello, List=21

I am trying to use the 'recent' module on an otherwise working
installation.

(trying to prevent lots of logs from brute force ssh attancks)

I am doing this:

=24IPT --table filter --append FORWARD =5C
    --destination =24DMZ =5C
    --in-interface =24EXT=5FPPP=5FIF =5C
    --out-interface =24DMZ=5FIF =5C
    --protocol tcp =5C
    --destination-port =24SSH=5FPORT =5C
    --match recent =5C
      --name sbfa =5C
      --rcheck =5C
      --hitcount 5 =5C
      --seconds 60 =5C
    --jump ld && echo OK

=24IPT --table filter --append FORWARD =5C
    --destination =24DMZ =5C
    --in-interface =24EXT=5FPPP=5FIF =5C
    --out-interface =24DMZ=5FIF =5C
    --protocol tcp =5C
    --destination-port =24SSH=5FPORT =5C
    --match state =5C
      --state NEW =5C
    --match recent =5C
      --name sbfa =5C
      --set =5C
    --jump la && echo OK

So syntax seems to be... OK ;-), but I can't log in from the
outside.

Is there something obvious I am missing ? (I guess there is ;-)



