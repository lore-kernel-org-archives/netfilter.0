From: lst_hoe01@kwsoft.de
Subject: State RELATED and more then one conntrack helper
Date: Tue, 21 Dec 2004 09:02:32 +0100
Message-ID: <1103616152.41c7d898dbee0@webmail.kwsoft.de>
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

Hello

we have the following rule fpr ftp in our iptables rule
iptables -A INPUT -p tcp --dport 1023: -m state --state RELATED -j ACCEPT

As far as i can tell from the docu this matches for every module with REL=
ATED
states ip_conntrack_ftp, ip_conntrack_irc and maybe others...

Is there a possibility to limit this matching to only a special module??

Thanxs

Regards

Andreas




