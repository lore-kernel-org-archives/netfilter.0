From: Xemul <epv_xemul@mail.ru>
Subject: Traffic limitation with iptables
Date: Tue, 22 Jul 2003 20:08:58 +0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030722200858.74374455.epv_xemul@mail.ru>
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

Hi.
I wanna solve such a problem:
When I see that byte counter on some chain reaches or exceedes any fixed
value - then IMMEDIATELY insert into that cahin new first rule (e.g. -j
DROP) or delete some rules from any other chain. Or more abstract - how
can can discover that byte counter is higher than smth without
"polling" chains?

Sorry for sending such a mail into announce, developers and user
maillists but I need help as soon as possible. :)

