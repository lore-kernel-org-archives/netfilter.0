From: "Jorge I. Davila L." <davila@cablenet.com.ni>
Subject: iprange match
Date: Tue, 11 Oct 2005 09:14:28 -0600
Message-ID: <1129043668.2415.12.camel@vyatka-39.cablenet.com.ni>
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

Hello list!:

I'm trying to use the iprange match, but every time when I want apply a
rule I receives:

iptables: No chain/target/match by that name

I'm using a 2.4.30 kernel in a xen domainU

The iptables that I'm using is 1.3.3

The rule that I'm testing is:

iptables -A OUTPUT -p tcp -m iprange --src-range
192.168.223.1-192.168.223.2

Someone can tell me where is the problem?

Best regards,
-- 
Jorge Isaac Davila Lopez


