From: Steven Zhang <zhangseven@gmail.com>
Subject: match for connection lasting time
Date: Thu, 14 Jul 2005 18:38:24 +0800
Message-ID: <fd5438520507140338694a14dd@mail.gmail.com>
Reply-To: Steven Zhang <zhangseven@gmail.com>
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

Hi, all:
 I got an idea to distinguish the different connections by its lasting time=
=20
(mostly for TCP),=20
eg. which connections have lasted for more than one minute, or even more=20
than one hour?

I think this maybe useful in some cases.
Is there a existing match for this? or is it possible to do this with=20
netfilter?

Thanks in advance.

Best regards,
Steven Zhang
