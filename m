From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: multiple routing tables for internal router programs
Date: Mon, 11 Jun 2007 10:58:28 -0500
Message-ID: <466D7124.9090107@riverviewtech.net>
References: <466D5F4E.3010605@gmail.com>
Reply-To: gtaylor+reply@riverviewtech.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <466D5F4E.3010605@gmail.com>
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

On 06/11/07 09:42, Andrea wrote:
> But how can I reach the same result for programs that are working 
> INTO the linux box? All I want is that a program (ping, for examples, 
> or a VOIP server, better) uses a secondary routing table in the same 
> machine. In this mode, I can manipulate route settings for different 
> classes of program in my router.

Just like you are using IPTables to mark packets now and then based 
routing decisions based on the IPTables mark, mark packets inbound as 
you want to.

There is no limit on the number of ways that you can mark packets, 
inbound, outbound, source port, destination port, what ever.

(That is if I have understood you correctly.)



Grant. . . .

