From: Peteris Krumins <newsgroups@lf.lv>
Subject: Re[2]: REJECT target
Date: Thu, 10 Apr 2003 22:33:54 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <119615248079.20030410223354@lf.lv>
References: <43614623471.20030410222329@lf.lv>
 <008701c2ff97$9d98b310$3201a8c0@ESTACAO>
Reply-To: Peteris Krumins <newsgroups@lf.lv>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <008701c2ff97$9d98b310$3201a8c0@ESTACAO>
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

Hello Leonardo,

Thursday, April 10, 2003, 10:30:07 PM, you wrote:


LRM>     Use DROP instead of REJECT ....  you can only REJECT in filter tables.
LRM> nat and mangle tables can only DROP packets ....

There are certain cases i want to REJECT --reject-with tcp-reset, or
--reject-with icmp-port-unreachable.

So from what you are saying, REJECT is impossible in not filter table?
(or is it just not implemented?)


P.Krumins


