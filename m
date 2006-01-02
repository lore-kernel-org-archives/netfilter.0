From: foo <janhouse00@gmail.com>
Subject: Forward requests to another network
Date: Mon, 2 Jan 2006 14:37:05 +0800
Message-ID: <978441da0601012237h4fb08379vb5c92f6104dd3043@mail.gmail.com>
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

Hi, say I have two external IP addresses:
220.x.x.9
220.x.x.173
Is it possible for me to forward all the requests on an ethernet card
(220.x.x.9) to another ethernet card (220.x.x.173) on different
network? I am not sure if I can do it with PREROUTING - DNAT in NAT
table. In my confusion, I thought it only supports external ip -> LAN
ip/internal ip translation. Plus I don't have the proper hardware to
test this out at home.

Has anyone experienced this before? Any clues would be greatly
appreciated. Thank you.

Regards,
Foo

