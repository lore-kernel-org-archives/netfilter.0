From: "Sanjoy Dey" <sdpmops@gmail.com>
Subject: SIP conntrack question
Date: Mon, 30 Apr 2007 14:48:09 -0700
Message-ID: <3931e0d50704301448u354ae3afo81e155e6ecfff09d@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
	b=lztuRnDYgOeb/8R86UwtQlenktJxIMS3wD7rG8Fie0DTKMrd5NQiiWs57WWaqgU5zRQfE3PGgyqo9Cc25/x+JktUozBOQ0yidoCVfvhapZGJxfBgd0thLY/sG0CWQcDjAKGg/JU4VIkwlac3bK5euac5qHG8MQv2CuhLHPHZEnw=
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

Hi:

I am trying to find out whether the SIP connection tracking module
that was introduced in 2.6.18 works even if SIP runs on ports OTHER
THAN 5060. Would the helper module listen on all ports for a SIP/SDP
header to find out which ports to open up for RTP or RTCP?

Any help will be appreciated.

Regards,
- Sanjoy

