From: Kamen TOMOV <kamen@cybuild.com>
Subject: connlimit against flashget
Date: 30 Jan 2005 11:20:19 +0200
Message-ID: <87vf9fz31o.fsf@c3po.zlatenlist.net>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi,

I am running a small LAN and my Internet provider has limited the
number of my outgoing web connections. My clients use programs like
Flashget that spawn multiple connections to the server when
downloading big files from web sites and it is very likely that the
limit will be reached.

That is why I would like to ask you if it is a good idea to use the
connlimit match with iptables to restrict the number of parallel TCP
connections to a server per client IP address.

I plan to do something like that:

iptables -p tcp --syn --dport 80 --dst www.warez.net -m connlimit \
         --connlimit-above 2 -j REJECT

If you think that it is not a good idea could you please recommend a
solution? Changing the provider is not an option :-)

Thanks in advance,
-- 
Kamen TOMOV


