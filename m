From: Marcus Graf <m.graf@shoplogistics.de>
Subject: possibility to multiply packets?
Date: Sat, 19 Aug 2006 09:36:48 +0200
Message-ID: <44E6BF90.5050607@shoplogistics.de>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hello everyone,

a friend of mine is working for some weeks in a foreign country. Now we
have the problem that at the company there he's got a lot of bandwidth
but we have a very bad connection. At some times we have a packet loss
over 20%. It looks like the packets are dropped randomly at an
overloaded or misconfigured router somwhere in between.

As a quick temporary solution we've thought of sending every packet
twice. Is there any possibility to intentionally (mis)configure
netfilter to duplicate packets?

Thanks
Marcus

-- 
Hail Eris! Hail Discordia!

