From: ro0ot <ro0ot@phreaker.net>
Subject: two transparent (bridging) firewall
Date: Fri, 31 Dec 2004 10:46:10 +0800
Message-ID: <41D4BD72.7030108@phreaker.net>
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

Hi,

I am planning to implement the following setup as below: -

                                                     ------- Bridging 
FW-1 -------
Internet ---- Router ---- Hub ---- 
|                                              | ---- Switch ---- 
Servers (VoIP)
                                                     ------- Bridging 
FW-2 -------

I would like to understand how does the Servers (VoIP) behind the two 
Bridging Firewalls will know which path will it choose to route the 
traffic out and which path will it use often.

Hope my question is not off topic.

Thank you,
ro0ot




