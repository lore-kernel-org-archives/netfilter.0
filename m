From: "Dharmendra T." <dharmu@nsecure.net>
Subject: Re: Bridge/VPN question.
Date: 23 Jun 2004 14:12:22 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1087980148.7626.35.camel@dharmu.nsecure.net>
References: <041201c45865$cb810cf0$c10da8c0@arvmobile>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <041201c45865$cb810cf0$c10da8c0@arvmobile>
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
To: "Anthony R. Vallario" <avallario@tecmasters.com>
Cc: netfilter@lists.netfilter.org

Hi,

Are there any other rules you have defined? If no, this may work:

iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP


iptables -A FORWARD -o eth0 -p tcp -m tcp -d <approved mail server>
--dport 25 -j ACCEPT
 iptables -A OUTPUT -o eth0 -p tcp -m tcp -d <approved mail server>
--dport 25 -j ACCEPT

Dharmendra T.
Linux Security and Admin,
www.nsecure.net

This message is intended for the addressee only. It may contain
privileged or confidential information. If you have received
 this message in error, please notify the sender and destroy the message
immediately. Unauthorised use or reproduction of 
this message is strictly prohibited.

On Tue, 2004-06-22 at 20:02, Anthony R. Vallario wrote:
> I hope you all can help. Ok, here's the setup
> 
> 
> Internet: eth0
> Lan: eth1
> Tunnel: tap0
> Bridge: br0 (tap0<->eth1)
> 
> 
> I have the firewall setup to be a gateway/router to the internet, and to the private offsite lan thru the tunnel. Everything works great, minus one thing.
> 
> I have FORWARD/OUTPUT rules for not letting certain traffic out to the internet. Mainly virus traffic and use of other mail servers. Only problem is they aren't working. Here are the rules:
> 
> 
> iptables -A FORWARD -o eth0 -p tcp -m tcp -d <approved mail server> --dport 25 -j ACCEPT
> iptables -A FORWARD -o eth0 -p tcp -m tcp --dport 25 -j DROP
> iptables -A OUTPUT -o eth0 -p tcp -m tcp -d <approved mail server> --dport 25 -j ACCEPT
> iptables -A OUTPUT -o eth0 -p tcp -m tcp --dport 25 -j DROP
> iptables- A FORWARD -o eth0 -p tcp -m tcp --dport 445 -j DROP
> iptables -A OUTPUT -o eth0 -p tcp -m tcp --dport 445 -j DROP
> iptables- A FORWARD -o eth0 -p udp -m udp --dport 445 -j DROP
> iptables -A OUTPUT -o eth0 -p udp -m udp --dport 445 -j DROP
> 
> Now if I take the tunnel and bridge are down(Only having eth1 NAT'D to eth0), everything works fine. I've read that iptables works at layer 3 and will not filter bridged interfaces. Well tap0 and eth1 are the bridged interfaces, not eth0. So why isn't the firewall stopping these packets? I can telnet to port 25 all day long on non-approved mail servers. 
> 
> 
> Anthony R. Vallario

-- 



