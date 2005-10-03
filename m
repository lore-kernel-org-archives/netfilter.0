From: Pawel Oleksik <oleksik@awa.mat.agh.edu.pl>
Subject: Logging SNAT
Date: Mon, 3 Oct 2005 08:01:03 +0200
Message-ID: <20051003060103.GA26729@awa.mat.agh.edu.pl>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi,

I wonder if it is possible to log a SNAT activity in case when a translation
is done from a network  into a range of addresses. I'd like to get a log with
fields:


 <timestamp> <localnet address> uses external connection as <external IP>
 ....
 <timestamp> <localnet address> releases <external IP>


Especially, I have no idea how to get the <external IP> (except parsing
/proc/net/ip_conntrack).

p.o.


