From: =?iso-8859-1?Q?Bruno_Negr=E3o?= <vpopmail@engepel.com.br>
Subject: the impossible "iptables -C" option
Date: Fri, 23 Jul 2004 20:24:54 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <01be01c4710c$440a79e0$5100a8c0@egp>
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

Hi guys, I didn't understand the following question and answer on
netfilter's faq:

"3.18 Why isn't the 'iptables -C' (--check) option implemented?

Well, first of all, we're lazy ;). To be honest, implementing a check
option is almost impossible as soon as you start to do stateful
firewalling. Traditional stateless firewalling bases it's decision just on
information present in the packets header. But with connection tracking
(and '-m state' based rules), the outcome of the filtering decision depends
on header+payload, as well as header+payload of previous packets within
this connection."

First of all, what does they mean about "--check"? What would they check?

What is "packet payload"? How does it make the "--check" option impossible
to be implemented?

thanks in advance,
bruno negrao




