From: knash@cs.tcd.ie
Subject: promiscuous mode
Date: Wed, 1 Jun 2005 23:58:42 +0100 (IST)
Message-ID: <33000.62.231.54.154.1117666722.squirrel@webmail.cs.tcd.ie>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
To: netfilter@lists.netfilter.org

Hello,
I set up my wireless card in promiscuous mode. I want to capture all
unicast packets using the hook NF_IP_PRE_ROUTING but packets other the
ones destined for my machine are been dropped.
I found this link, but its dated 2001

http://www.scaramanga.co.uk/code-fu/netfilter-promisc.diff

It refers to modifying netfilter/userspace/libiptc/libip4tc.c which my
version of netfilter doesn't seem to have.
I'm running Fedora Core 2 (2.6.5-1.358)
and iptables v1.2.9

I was wondering does the current version of netfilter support promiscuous
mode or is there a patch available??

Thanks very much for your help,

Kevin


