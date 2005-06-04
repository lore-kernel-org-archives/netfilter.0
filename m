From: Oran G <jihad@redwhitearmy.com>
Subject: port forwaring from localhost to inet
Date: Sat, 04 Jun 2005 18:59:23 +0200
Message-ID: <42A1DDEB.9040207@redwhitearmy.com>
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

hello,

I want to forward local requests to a mashine on the network.

I have a few hundred cgi scripts running on the webserver and using a 
mysql-server on the same host. now i have set up a separate 
mysql-linux-box and since it would be to much work to rewrite all the 
scripts, im trying to redirect all trafic from localhost:3306 to 
somepublicip:3306.

i used:
iptables -t nat -A PREROUTING -p tcp --dport 3306 -j DNAT --to 195.x.x.x

which works well form inet to inet but if I put '-o lo' to the line it 
doesnt.

i understand that this could be becouse the source of the packets would 
also require some rewriting, but i dont know how to do this. is there a 
way to solve this with iptables or shoud i try it with ssh-tunels?

thax, oran g

