From: "allug4me allug4me" <allug4me@gmail.com>
Subject: SIP ALG TOS Marking
Date: Wed, 11 Apr 2007 12:03:58 +0530
Message-ID: <ceaf8eaa0704102333j5f855ef0j4f6bececf4266a86@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
	b=DA9R1Pa3uxMnCAb0awPykeKYvoqJGEMzBo/WC0ilJVfNf3SzxlsBL+Zl2ukROxXUeUi9F8JEPb14c1FS3auKRWrhwtIyXtow6b/hQFPj1429Gu3CVsaLOgUI/dhTOKyYgHt78+7dpoMoYK+0+eRD5k9EhmETgi9feKfHup6A3wE=
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

Hi,

I am developing a module for a linux router. All the packets from LAN
to WAN are natted. I am using linux 2.6.18.2 kernel. Hence for SIP/RTP
packets from LAN to pass through I am using SIP Protocol Support of
Netfilter by enabling CONFIG_IP_NF_SIP as module.

The module I am developing needs to  mark the SIP, RTP and RTCP
packets with TOS/DSCP in IP Header and COS in the VLAN header.

Can anyone please help me to achieve this task?

Any pointers like documentation/suggestions to achieve this are
greatly appreciated.

Thank you very much for your help.

Best Regards,
marc

