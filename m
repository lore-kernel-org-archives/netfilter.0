From: nawawi <mohd.nawawi@gmail.com>
Subject: iptables: Invalid argument Using mac match
Date: Wed, 15 Nov 2006 19:54:37 +0800
Message-ID: <562d10500611150354x4a22b681r62d9f08fe1106d1f@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi all,

Im trying to block this mac address by using this rules, however
iptables claim this as a invalid argument.

fw:/config> iptables -N auth
fw:/config> iptables -A INPUT -j auth
fw:/config> iptables -A FORWARD -j auth
fw:/config> iptables -A OUTPUT -j auth
fw:/config> iptables -I auth -m mac --mac-source 00:11:09:5D:D9:13 -j DROP
iptables: Invalid argument

Thanks.

