From: Richard Plana <rplana@zicorp.com>
Subject: Adding listening ports
Date: Tue, 29 Jul 2003 13:06:59 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F26C5D3.7080002@zicorp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
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

Because of (overly?) strict security policies at our company, one can 
only make TCP connections to ports 80 and 443. I was wondering if 
netfilter could be used to redirect packets destined for port 443 to the 
listening sshd daemon on port 22 on an external machine.

I tried "iptables -I RH-Lokkit-0-50-INPUT 5 -p tcp -m tcp --dport 443  
--syn -j ACCEPT" (I'm using RedHat's default config) and "iptables -t 
nat -A PREROUTING -p tcp --dport 443 -j DNAT --to-destination 
127.0.0.1:22" to do the actual routing, but that didn't seem to work:

$ ssh -p 443 localhost
ssh: connect to host localhost port 443: Connection refused

Suggestions would be appreciated.
-- 


*Richard Neal Plana, B.Sc., CCNA*
Lead Software Engineer
Zi Corp.


