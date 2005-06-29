From: varun_saa@vsnl.net
Subject: MAC filtering
Date: Wed, 29 Jun 2005 16:56:02 +0500
Message-ID: <3f96f433f945f0.3f945f03f96f43@vsnl.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-language: en
Content-disposition: inline
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

Hello,
      To allow a particular MAC, I plan use the rule 
as sugested in my previous post :

iptables -A FORWARD -m mac --mac-source ff:ff:ff:ff:ff:ff -j ACCEPT.

Now how do you block all other MAC addresses in the first place.
How to write a rule for that ?

Thanks

Varun


