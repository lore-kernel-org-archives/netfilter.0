From: Christian Andretzky <Christian.Andretzky@MB.TU-Chemnitz.DE>
Subject: Newbe problem with rpc filtering
Date: Mon, 18 Jul 2005 12:55:50 +0200
Message-ID: <42DB8AB6.9080008@MB.TU-Chemnitz.DE>
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

Hi,
I'm more or less new with packet filtering an have a problem to get my
iptables running with the extensions for rpc filtering under SuSE 9.3

As far as I could see they have installed iptables 1.3.1 and the patch-o-matic
extensions for rpc too (the newer one, which supports the syntax

'-m rpc --rpcs [list, of, services]')

But unfortunately I cannot get it running.

If I use '-m rpc --rpcs list, of, services' then I get the response

'Bad argument xxx' for the second parameter in the list of services

If I use '-m rpc --rpcs xxx' (wich only one parameter) or "-m rpc' with no
'--rpcs' parameter (fallback to old record_rpc style) I get the message

'iptables: No chain/target/match by that name'

Is there anybody who can help me to fix that problem

TIA, Christian

P.S. Please answer to my personal address because I'm not subscribed to the list.

