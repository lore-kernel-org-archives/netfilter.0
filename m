From: "Noname Noname" <spphu@hotmail.com>
Subject: iptables with iplimit option
Date: Sun, 24 Aug 2003 10:02:09 +0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <BAY7-F298fdFsLowAQZ000006e9@hotmail.com>
Mime-Version: 1.0
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi all

i'm trying to use iptables with iplimit option, i'm getting the below 
problem
can any one help what is the caused problem and how can I solve it?

[root@www root]# iptables -A INPUT -p tcp --syn --dport http -m iplimit 
--iplimit-above 4 -j REJECT
iptables: No chain/target/match by that name

thanks in advanced

_________________________________________________________________
Add photos to your e-mail with MSN 8. Get 2 months FREE*. 
http://join.msn.com/?page=features/featuredemail


