From: Sudheer Divakaran <sudheer@svw.com>
Subject: 'recent' module HOWTO
Date: Wed, 11 Aug 2004 11:08:34 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4119B0DA.6030903@svw.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi,
    Where can I find detailed documentation of 'recent' module?.


To test the recent module, I've given the following commands and pinged 
to my machine from another one.  But I got the reply 'Destination port 
Unreachable'.  What is wrong in it?

iptables -F

iptables -P INPUT ACCEPT

iptables -P OUTPUT ACCEPT

iptables -A INPUT -m recent -p icmp --icmp-type echo-request --update 
--seconds 10 -j REJECT

iptables -A INPUT -m recent -p icmp --icmp-type echo-request --set -j ACCEPT


Kind Regards,
Sudheer



