From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: How make virtual interfaces ( subinterfaces ) on linux machine
Date: Wed, 06 Dec 2006 02:09:01 -0600
Message-ID: <45767A9D.8030301@riverviewtech.net>
References: <428559.74702.qm@web56206.mail.re3.yahoo.com>	<4575D2D9.4020308@riverviewtech.net>
	<457677FF.1010605@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <457677FF.1010605@gmx.de>
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
To: Mail List - Netfilter <netfilter@lists.netfilter.org>

On 12/06/06 01:57, Clemens wrote:
> but now my question: what are you using the is there any advantage
> in using iptables to filter bridged traffic as you noted in my quote
> above? i use ebtables to do all the filtering in the linuxbridge,
> and it works pretty well..

EBTables is a very good basic layer 2 filtering mechanism.  However, I
don't think you can do statefull matching with EBTables like you can
with IPTables.  By using IPTables to filter traffic for bridges, you can
take advantage of all of the advanced match extensions that you can not
do with EBTables.



Grant. . . .


