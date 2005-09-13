From: venkata subramanian <venkatasubramanian@gmail.com>
Subject: Understanding rate limiting
Date: Tue, 13 Sep 2005 11:54:59 +0530
Message-ID: <acf1defa0509122324c411c82@mail.gmail.com>
Reply-To: venkatasubramanian@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

I am new to iptables and I find it hard to understand rate limiting. (-m li=
mit)

Just a few questions:
1) It is used for logging as well as not allowing a stream to exceed
its packets/time quota?
2) will all the packets that execeed the given rate be dropped?
(assuming a DROP jump is given)
3) is this a form of bandwidth management ... can i do this to limit
the bandwidth used by members in my organization?
4) how is dstlimit different? (and... quit naive... why is there no srclimi=
t?)

I searched hard... but i have failed to find proper answers for the
above questions....

