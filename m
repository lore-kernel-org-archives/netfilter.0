From: "Paul Fontenot" <paul@pitbull-racing.com>
Subject: Groups in iptables
Date: Sat, 29 Nov 2003 10:28:45 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000301c3b69e$3e4122d0$6400a8c0@pfontenot>
Reply-To: <paul@pitbull-racing.com>
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
To: "Net Filter (E-mail)" <netfilter@lists.netfilter.org>

I would imagine the answer to this is yes, but I haven't found anything on
the subject. If you wanted to limit outbound traffic for a certain port to
certain group of servers is that possible?

For example, can I create a group:

MAILSERVERS = 192.168.0.25, 192.168.0.26, 192.168.0.27

and use that in a ruleset:
-A INSIDE_ACCESS_OUT -s $MAILSERVERS -p tcp -m tcp --dport 25 --tcp-flags
SYN,RST,ACK SYN -j ACCEPT

and then drop the rest:
-A INSIDE_ACCESS_OUT -p tcp -m tcp --dport 25 -j DROP


