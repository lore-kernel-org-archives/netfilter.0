From: Asghar <asghar@innomedia.soft.net>
Subject: Inserting NATing rules through C programmes...
Date: Tue, 04 Jan 2005 11:02:30 +0530
Message-ID: <41DA2A6E.3050306@innomedia.soft.net>
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

Hi, all

Can any body tell me how to insert IP table NATing rules through C 
programmes with out using system () call.
I am getting some problem with system( ).

I have read somewhere that

"We are well aware that there is a fundamental lack for such an API, and 
we are working on improving that situation. Until then, it is 
recommended to either use system() or *open a pipe into stdin of 
iptables-restore*. The latter will give you a way better performance."


Can any body tell me from where i can get the details about the second 
option..

Regards
Asghar


