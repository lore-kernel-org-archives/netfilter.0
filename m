From: "Udo van den Heuvel" <udovdh@xs4all.nl>
Subject: Limit on a per host basis?
Date: Sat, 13 Nov 2004 19:30:44 +0100
Message-ID: <000501c4c9ae$e37848e0$450aa8c0@hierzo>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

How can I limit traffic (packets coming in) at a per host rate?
It looks like the normal limit target is more general and cannot take
account of different hosts in a `selection`.

E.g.: I would like to filter ntp traffic (udp, port 123) to xx packets per
minute at most.
How could I accomplish this?

Your ideas are very welcome!

Kind regards,
Udo



