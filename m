From: "Jim Robinson" <jim@linux-sp.com>
Subject: Deny all but certain Websites
Date: Tue, 25 Feb 2003 21:55:13 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <CAEGIDAMMMOCIHNIEGCJAEBBEGAA.jim@linux-sp.com>
Reply-To: <jim@linux-sp.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi,

I am trying to write a rule to allow certain IP addresses on
the inside of my firewall (NAT) to only connect to 1 or 2 IP
ranges on the internet.  I have tried without success to
find some examples online and have played with some rules
but without much success.

Does anyone have any ideas on this?  Your help very much
appreciated.


Allowed Website Only
|
|
|
(Internet)
|
|
ETH0: Public IP
----
FIREWALL (NAT)
----
ETH1: 192.168.1.1
|
|
Client IP: 192.168.1.100




Jim


