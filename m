From: O-Zone <liste@zerozone.it>
Subject: Multiple output routes
Date: Wed, 15 Dec 2004 10:44:46 +0100
Message-ID: <200412151044.46362@X-Blurb>
Reply-To: o-zone@zerozone.it
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: netfilter@lists.netfilter.org

Hi all,
i want to route traffico for a specific subnet to routeA while default route 
for my linuxbox is routeB. Here's the diagram:

(internet)--[Router A]---+
                                    |
                                [Linux BOX]----(Subnet 10.0.0.x)
                                    |
(internet)--[Router B]---+

RouterA and RouterB have the same subnet (i.e. RouterA lan is 192.168.0.1 and 
RouterB has 192.168.0.2) and LinuxBox have ONLY ONE externat iface like 
192.168.0.3. While i use LinuxBOX i wanna go "out" trought 192.168.0.1 but 
PC's MASQ'ed in Subnet 10.0.0.x must go out throug 192.168.0.2. 

Can someone point me in the right direction ?

Thanks ! Oz

-- 
------
O-Zone ! www.zerozone.it

