From: "Patrick Ahler" <patrick@vikus.com>
Subject: --sport
Date: Wed, 5 Mar 2003 11:21:19 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <ABEKJILKOKKGGDJKHKDFGEALCAAA.patrick@vikus.com>
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
To: netfilter@lists.netfilter.org

1. Is there a way to specify a range of source ports when setting a rule. My
ftp server uses ports 5000-5020 for passive but I don't want to have to
write a rule for each port. (For a network firewall). The ftp server is
behind the firewall.


iptables -A FORWARD -p tcp --sport 5000 -m state --state
NEW,ESTABLISHED,RELATED -j ACCEPT


