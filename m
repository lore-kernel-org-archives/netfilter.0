From: Swapnil Nagle <swaps@protonic.com>
Subject: iptables -L shows target field empty
Date: Fri, 1 Nov 2002 08:00:21 +0000 (UTC)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <07530415656916@MAIL.leftcoast.net>
Reply-To: Swapnil Nagle <swaps@protonic.com>
Content-Transfer-Encoding: 8bit
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi all,

On a server, the iptables -L output (snipped) is something like this:

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination
xyz 	    all  --  anywhere             anywhere

Chain xyz (2 references)
target     prot opt source               destination
           tcp  --  myserver             anywhere           tcp dpt:http

Here, the target field is empty. Does that mean that
default policy will be enforced ? 

Regards,
Swapnil.






