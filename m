From: Askar <askarali@gmail.com>
Subject: howto stop who has xxx.xxx.xxx tell xxx.xxx.xxx.x
Date: Fri, 11 Mar 2005 16:39:26 +0500
Message-ID: <a0f69e505031103393d70419@mail.gmail.com>
Reply-To: Askar <askarali@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

hi list,


when i check #tcpdump -n -i eth0, even though im not browsing in can
see none stopping lines for ...

arp who-has xxx.xxx.xxx.xxx tell xxx.xxx.xxx.x
.
.
.
.
howto stop this with iptables, yep I know tcpdump shows packets before
"iptables" do, and also like to undertand why so many arp is
generating on our network ?

regards

-- 
I love deadlines. I like the whooshing sound they make as they fly by.
Douglas Adams

