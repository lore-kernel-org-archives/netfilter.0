From: afshin lamei <afshinlamei@gmail.com>
Subject: problem with psd match
Date: Wed, 31 Aug 2005 16:34:03 +0430
Message-ID: <3115d56e05083105045e130614@mail.gmail.com>
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

Hi all,
I'm using the psd (port scan detector) , dropping all packets that
match with psd and it works well with default values. but when I use
the retina port scanner, it says that ports 25 (smtp) and 110 (pop3)
are open. I have not any mail application and my box is not listening
on these ports (netstat -an --inet proves this). all default policies
(iptables -P ) are set to DROP.
what's the problem?
regards
afshin lamei

