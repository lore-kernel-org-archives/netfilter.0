From: <Derek_Chen@trend.com.tw>
Subject: packet filtering in virtual NIC
Date: Tue, 11 Jan 2005 18:47:21 +0800
Message-ID: <05D4351F36F7844CAE6F3C6499156745086969C7@twexmail01.tw.trendnet.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
content-class: urn:content-classes:message
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


Hi, All
=0D
I create a virtual netowrk card by supplementing a network driver. To=
 simulate the activity of receving packets I customize packet data and call=
 ioctl to feed them to netif_rx. My registered hook is like this
static struct nf_hook_ops ns_hook =3D { {NULL,NULL},scan_hook,
                                                             =
 //PF_INET,NF_IP_PRE_ROUTING,                           //I have tried this
                                                             =
 PF_BRIDGE,NF_BR_PRE_ROUTING,                     // and this
                                                              1};
Both hooks point does not work for my crafted data but work for real=
 packets (through real NIC).
Does anyone know what I'm doing wrong? Thanks for help.
=0D
Derek
                =0D


TREND MICRO EMAIL NOTICE
The information contained in this email and any attachments is confidential=
 and may be subject to copyright or other intellectual property protection.=
 If you are not the intended recipient, you are not authorized to use or=
 disclose this information, and we request that you notify us by reply mail=
 or telephone and delete the original message from your mail system.
