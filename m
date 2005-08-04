From: "John T. Kamenik" <jkamenik@patton.com>
Subject: VLAN QoS
Date: Thu, 4 Aug 2005 15:16:52 -0400
Message-ID: <5271846C-DF7C-42A6-B7B2-120BF1F12B5B@patton.com>
Mime-Version: 1.0 (Apple Message framework v733)
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
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: netfilter@lists.netfilter.org

I have a linux based bridge/router.  On one side is a VLAN network,  
and on the other an Ethernet network.  The VLAN network uses the  
user_priority field in the VLAN header to perform various forms of  
QoS.  The ethernet network does a similar thing with the IP ToS  
bits.  The VLAN software is able to map user_priority to and from the  
sk_buff->priority.  Is there a way to make ToS bits to and from the  
sk_buff->priority?  Could this break linux?

John T. Kamenik (Software Eng.)
jkamenik@patton.com

