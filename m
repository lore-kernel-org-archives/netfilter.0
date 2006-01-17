From: Graham Murray <graham@gmurray.org.uk>
Subject: ipv6 state matching
Date: Tue, 17 Jan 2006 14:39:00 +0000
Message-ID: <87wtgyc41n.fsf@newton.gmurray.org.uk>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/simple; d=gmurray.org.uk; s=in200507;
	t=1137508741; h=Received:X-Authentication-Warning:From:To:Subject:
	X-Hashcash:Date:Message-ID:User-Agent:MIME-Version:Content-Type; b=P
	hyO/Vs7D4RDVgBJr1OZxfnIKoFsWAciS80DtH6O0n8r7XLehqCcR+HA7owvQTsGADWU
	OoU3ir/0jk9HSjJJ5Q==
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

Now that Linux kernel 2.6.15 includes conntrack for IPv6, what is the
ip6tables (v1.3.4) command which does the equivalent of 

'iptables -A INPUT -p tcp -m state --state ESTABLISHED,RELATED -j ACCEPT'

The obvious replacement of iptables by ip6tables complains that
libip6t_state.so cannot be found.

