From: "Rio Martin." <rio@martin.mu>
Subject: SNAT
Date: Thu, 3 Apr 2003 17:29:16 +0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <003701c2f9cb$e109d330$6401a8c0@server>
References: <20030403102302.5858.91445.Mailman@kashyyyk>
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

Dear folks,
I need help to modify the source ip for every irc connection coming from my
clients.

Eg:

eth0    = 64.1.1.1
eth0:1 = 64.1.1.2
eth0:2 = 192.168.1.1


My clients is in 192.168.1.0/24. Right now all connection to irc server is
using ip 64.1.1.1
I want to modify, so all irc connection is using 64.1.1.2

Thanks for helping me ...

Regards,
Rio Martin.



