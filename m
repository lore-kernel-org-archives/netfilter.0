From: Sven Burgener <sburgener@objeng.ch>
Subject: iptables abilities
Date: Thu, 22 Jan 2004 13:21:27 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <400FC047.4010208@objeng.ch>
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

Hello

I'm looking for a way to connect two parties (computers) that both have 
a private IP address.

          (Internet)       (Internet)
      A <------------> X <------------> B

A: 192.168.1.13
B: 192.168.1.99
X: public IP address

In other words, can iptables act as a "relay" between two computers 
which both have a private IP address?

Cheers
Sven


