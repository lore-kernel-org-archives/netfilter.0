From: bernard <bernard@gers.net>
Subject: hostname forwarding
Date: Wed, 11 Dec 2002 15:05:49 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <p04330105ba1cf39a28eb@[80.9.157.3]>
References: <FD8F124A387AD6119F7900A0D218B32154A614@hslex01.hslbz.local>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <FD8F124A387AD6119F7900A0D218B32154A614@hslex01.hslbz.local>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I'm using iptables to redirect external requests depending on their 
port/protocol like this :

	hostname A:80 -> public ip -> iptables -> 192.168.1.1:80
	hostname B:80 -> public ip -> iptables -> 192.168.1.1:80

It works pretty well, thanks to iptables :-)

Now I want to redirect on a hostname basis on different private ip's 
like this :

	hostname A:80 -> public ip -> iptables -> 192.168.1.1:80
	hostname B:80 -> public ip -> iptables -> 192.168.1.2:80

Does anyone know a solution ?

Thanks for your help.

Bernard

