From: "Real Oneone" <realoneone@gmail.com>
Subject: How to re-send out the packets captured by my hook function at
	NF_IP_PRE_ROUTING
Date: Wed, 26 Apr 2006 20:37:03 +0800
Message-ID: <84d7d9cf0604260537v54db80fdoadbd3cc6785f3122@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi, I tried to captured all the packets at NF_IP_PRE_ROUTING, made
some changes to some of them, and invoked skb->dev->hard_start_xmit to
send them out directly. However, the kernel crashed before I could get
any printked information.

If you have any idea of how to send the received packets out, please tell m=
e.

Thank you in advance.

Best regards,
Gu, Xinxing

