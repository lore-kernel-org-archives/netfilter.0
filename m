From: Anders Fugmann <afu@fugmann.dhs.org>
Subject: mangle tables.
Date: Tue, 10 Sep 2002 08:49:56 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3D7D9614.1040205@fugmann.dhs.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.samba.org

Hi all

I'm lookin at the new mangles tables as of 2.4.18, and fail to
understand excatly packets traverse these chains.

the manpage says:
      Since kernel 2.4.18, three other built-in chains are  also
      supported  :  INPUT  (for  packets  coming  into the box itself),
      FORWARD (for altering packets being routed through the box), and
      POSTROUTING (for altering packets as they are about to go out).

Am I correct in the following:
Packets going through the firewall (forwarded):
PREROUTING,....,FORWARD,....,POSTROUTING.

Packets originating from the firewall itself:
	OUTPUT,...,POSTROUTING.

Packets destined for the firewall itself:
	PREROUTING,...,INPUT.

Next, is the above is correct, when does packets hit the chains,
e.g. what chains are traversed between PREROUTING and FORWARD and 
POSTROUTING, in the forwarding example?

Thanks in advance
Anders Fugmann

-- 
Author of FIAIF
FIAIF Is An Intelligent/Iptables Firewall
http://fiaif.fugmann.dhs.org


