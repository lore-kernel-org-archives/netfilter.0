From: fd4 <fd4@itsec4u.de>
Subject: Re: multiple match string don't work
Date: Tue, 31 Jul 2007 20:41:55 +0200
Message-ID: <20070731204155.4c677dad@alice.thum.ath.cx>
References: <E1IEKIB-0001Io-00.bond_a_v-inbox-ru@f102.mail.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <E1IEKIB-0001Io-00.bond_a_v-inbox-ru@f102.mail.ru>
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
Cc: Alexander Bondarenko <bond_a_v@inbox.ru>

looks for me like my conntrack_delete problem - no nice example within the man page.
order, arrangement is important

> iptables -A INPUT -d 192.168.52.10 -m string --string  "GET" --algo bm -m string --string "passwd" -algo bm -j DROP
> 

try this:
iptables -A INPUT -i eth0 -p tcp -d 192.168.52.10 -m string --string "PROPFIND" --algo bm -m string --string "passwd" --algo bm -j DROP

