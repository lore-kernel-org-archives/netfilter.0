From: saint <nagajuna@optushome.com.au>
Subject: iptables grep problems
Date: 04 Feb 2003 00:14:11 +1100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1044278051.9027.50.camel@juna.cypherworld.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

Hi all,

It seems I'm in a bit of a bother.  Here's my problem:
I have a semi-permanent IP address provided by my ISP
and I can't do one of two things:
1. use eth0, and
2. use a combination of grep, awk, & ifconfig.

Normally, if I issue this from the bash shell:

$ifconfig eth0 | grep 'inet addr' | awk '{print $2}'

I get the intended result i.e the external interface's IP address.
So why can't I get anything when I put this in the firewall script?
Actually, I do get something: ERRORS!

If someone would kindly help me with this problem
and relieve my suffering it'll be very much appreciated.

Thanks.

Santos.
Still learning.


