From: Adam Sayler <asayler@qorvus.net>
Subject: ip forwarding setup help
Date: Sun, 4 Jul 2004 02:19:28 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40323773-CD9B-11D8-A537-0003938146D0@qorvus.net>
Mime-Version: 1.0 (Apple Message framework v618)
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

I'm trying to forward traffic from my linux gateway to my web server 
and having trouble getting it setup properly.

eth0 address:82 ---> 192.168.1.10:81

I've was reading the HOWTO about the port forwarding setup and tried 
using this:
iptables -A PREROUTING -t nat -p tcp -d "eth0_IP address" --dport 82 -j 
DNAT --to 192.168.1.10:81
iptables -A PREROUTING -t nat -p udp -d "eth0_IP address" --dport 82 -j 
DNAT --to 192.168.1.10:81

the setup is unclear to me and I'm not quite sure for my specific 
situation if I want MASQUERADING, DNAT or something else.  All I want 
to do is forwarding all incoming and outgoing traffic on eth0:82 to my 
internal IP address of the server.

do i need to add anything on my gateway like a routing table entry for 
this or does iptables do the routing for me when I use the DNAT 
function?

Thanks,
Adam


