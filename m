From: Carl-Daniel Hailfinger <c-d.hailfinger.devel.2006@gmx.net>
Subject: Re: MSAQ and SHAPING: A million dollar question
Date: Thu, 01 Jun 2006 01:28:53 +0200
Message-ID: <447E26B5.1020308@gmx.net>
References: <e2ddd1bc0605311609m48b261adp2b87542e59576860@mail.gmail.com>
	<e2ddd1bc0605311625t7d1bf0eco4c915c069af2cacd@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <e2ddd1bc0605311625t7d1bf0eco4c915c069af2cacd@mail.gmail.com>
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
To: Enigma Psi <enigmapsi@gmail.com>
Cc: netfilter@lists.netfilter.org

Enigma Psi wrote:
> Now, if someone understood all this...can he, or she, tell me where on
> the Earh does the MASQ (SNAT-POSTROUTING) code sit inside the kernel
> in relation with EGRESS shaping code?

qdisc is the first thing a packets hits after coming from the nic.
Then, packet filtering/mangling/routing happens.
qdisc is the latest thing a packet hits before entering the nic.

In the iptables world, POSTROUTING is indeed the last point at which
a packet is seen by iptables.


Regards,
Carl-Daniel
-- 
http://www.hailfinger.org/

