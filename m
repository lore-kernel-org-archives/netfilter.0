From: Krystian <optimusprime@o2.pl>
Subject: connection limit for UDP
Date: Tue, 02 Nov 2004 20:54:07 +0100
Message-ID: <4187E5DF.6040509@o2.pl>
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
To: Netfilter ML <netfilter@lists.netfilter.org>

Hi

I there a way to limit connections one host can make to another host 
("dstlimit" like), but for UDP?

I know UDP doesnt have FIN... but I thought since do connection can be 
assumed closed after some time of innactivity i ...

is there a way? :)

