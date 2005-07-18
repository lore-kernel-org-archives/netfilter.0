From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: RST packets
Date: Mon, 18 Jul 2005 20:27:25 +0200 (CEST)
Message-ID: <Pine.LNX.4.58.0507182020200.21967@blackhole.kfki.hu>
References: <Pine.LNX.4.61.0507181604210.26471@yvahk01.tjqt.qr>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0507181604210.26471@yvahk01.tjqt.qr>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@linux01.gwdg.de>
Cc: Netfilter User Mailing List <netfilter@lists.netfilter.org>

Hi,

On Mon, 18 Jul 2005, Jan Engelhardt wrote:

> a simple question, though I could not clearly read it from the TCP RFC...
> do RST packets always have ACK set?

No, see RFC793 page 64:

SEGMENT ARRIVES
...
If the state is LISTEN then

      first check for an RST

        An incoming RST should be ignored.  Return.

      second check for an ACK

        Any acknowledgment is bad if it arrives on a connection still in
        the LISTEN state.  An acceptable reset segment should be formed
        for any arriving ACK-bearing segment.  The RST should be
        formatted as follows:

          <SEQ=SEG.ACK><CTL=RST>

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

