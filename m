From: "Fulvio Ricciardi" <fulvio.ricciardi@zeroshell.net>
Subject: ipt_time doesn't work with new kernels
Date: Thu, 30 Nov 2006 22:02:05 +0100
Message-ID: <456f46cd.22d.7be.836848743@webmailh3.aruba.it>
Reply-To: fulvio.ricciardi@zeroshell.net
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi,
I noticed ipt_time doesn't work with the kernels 2.6.18.2
and 2.6.19.
The error messages is the following:

iptables -A INPUT -mtime
iptables: Unknown error 4294967295

Is it possible to solve the problem? will time extention be
broken for ever?

Thanks you in advance for  your replies.
Best Regards
    Fulvio Ricciardi

--------------------------------------------------------------------
Fulvio Ricciardi
web: http://www.zeroshell.net/eng/
skype: zeroshellnet
Phone: +3908321835630

