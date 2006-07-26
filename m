From: Vincent Regnard <devel@regnard.org>
Subject: multiport tolerance changes
Date: Wed, 26 Jul 2006 11:32:01 +0200
Message-ID: <44C73691.1080302@regnard.org>
Reply-To: devel@regnard.org
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

Hi all,

I recently upgraded my firewall setup. Mainly upgrading kernel from 
2.6.8 to 2.6.16 and iptables from 1.2.7 to 1.3.5. And I had to modify my 
  firewall rules due to what I think is a syntax tolerance change 
regarding multiport.

With iptables 1.2.7 I had some rules where I could write some multiport 
(port lists or ranges) both for source and destination ports, like this:

/sbin/iptables -A fw2net_eth3 -p tcp -m multiport -s 82.67.103.87 
--sport 1024:65535 -d 0.0.0.0/0 --dports 80,8080,81,8000,1755 -j ACCEPT

iptables was coping well with this and expanded the port matrix into 
appropriate single rules (ipchains was also able to do this well in its 
good time). But  iptables 1.3.5 refuses to have multiport for both 
source and destination ports and objects:

iptables v1.3.5: multiport can only have one option

So I have to re-write my firewall rules.

What is the reason why this practical feature (expanding the port 
matrix) disapeared ? Is it related to the merge of extended multiport 
into multiport (including ranges in lists) ?
Is there any plan to re-introcduce such a functionality in the future 
releases of iptables ?

Thanks for your comments on this.

Vincent

