From: "Udo Rader" <spamtrash2@vibe.ac>
Subject: -m string not working
Date: Wed, 30 Oct 2002 10:33:23 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <apo913$jef$1@hermes.vibe.ac>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

hi all,

I've got a problem with the iptables 1.2.7a string-module. 

No matter what I try I always get the following:

----CUT----
% iptables -A INPUT -m string --string 'the bad string' -j DROP
iptables: No chain/target/match by that name
----CUT----

any ideas or is this a bug?

thanks

udo

