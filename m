From: Raphael Jacquot <raphael.jacquot@imag.fr>
Subject: nat and dns
Date: Thu, 23 Sep 2004 11:00:33 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <415290B1.5030401@imag.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

hi,
I have a setup that looks like :
  _____                                ____
[     ] 192.168.0.100                [    ]
[ DNS ]------------------------------[ FW ]----
[_____]                192.168.0.254 [____] (isp)

and I want the DNS to answer to queries from the outside
what's the proper way of doing this ?

Sincerely

Raphael

