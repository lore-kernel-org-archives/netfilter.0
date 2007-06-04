From: "Elvir Kuric" <omasnjak@gmail.com>
Subject: Restricting applications/protocols to use specific ports using
	iptables, is this possible
Date: Mon, 4 Jun 2007 13:37:07 +0200
Message-ID: <1814bfe70706040437i34b282d8ocf15b698160e05b5@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
	b=XnGMyyypnUTRhEQdE7vfNV9qh9KcLZzj8L85NtaRuHuyYx+QxW65A1E84g35GTltflA3IKJXTekqibs33QIXwRZ8eSuWyeowVALT5TwH25cxS+KU6sjzIYyrIE564QIckh/XetYfgvh5SrOJvR0/yN0bZ3E/Q+P/3MU0soM/EbI=
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi all,

I am interested in one thing, is possible using iptables software
limit particular application/protocol to use/bind to particular ports.
For example I want to send all reqestes from my machine using ports I
specify, not random ones, or accept ping echo-replay on specific
ports.

Any idea or hint is welcome

Best wishes,

Elvir Kuric

