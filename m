From: Alexis <alexis@attla.net.ar>
Subject: Re: Routing through Debian
Date: Mon, 16 Feb 2004 22:16:06 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <583988670.20040216221606@attla.net.ar>
References: <021A59AE3C21D649BCEA0B7802EC408A443142@quadnet_fs1.quadnet.co.uk>
Reply-To: Alexis <alexis@attla.net.ar>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <021A59AE3C21D649BCEA0B7802EC408A443142@quadnet_fs1.quadnet.co.uk>
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
To: Carlos Robles <carlos.r@quadnet.co.uk>
Cc: netfilter <netfilter@lists.netfilter.org>

you need the following rules


iptables -t nat -A PREROUTING -i WAN_IF -p tcp --dport 3389 -j DNAT --to
192.168.0.4:3389

and if FORWARD policy is set to drop

iptables -A FORWARD -i WAN_IF -d 192.168.0.4 -p tcp --dport 3389 -m
state --state NEW -j ACCEPT
iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT

(in case you want to use conntrack)

if you dont

just only

iptables -A FORWARD -i WAN_IF -d 192.168.0.4 -p tcp --dport 3389 -j ACCEPT


in the FORWARD chain



Hello Carlos,

Monday, February 16, 2004, 11:40:49 AM, you wrote:

CR> Hello my name is Carlos
CR> This is the first time I'm emailing here and I don't know really how this
CR> works, I'm just going nuts with the next issue:
CR> I'm trying to connect from my XP office computer to my Home (XP prof)
CR> computer (192.168.0.4).
CR> In my home I have a small network made out of 5 computers, they all  connect
CR> to internet through a Debian 2.4 box(private 192.168.0.5, public:
CR> 80.1.122.39) that I've configured to work as a router-firewall.
CR> I modified ip-tables so to let any connection coming to the router to port
CR> 3389 to redirect it to 192.168.0.4:
CR> iptables -t nat -I POSTROUTING -p tcp --sport 3389 -s 192.168.0.4 -j SNAT
CR> --to 80.1.122.39:3389
CR> iptables -t nat -I PREROUTING -p tcp --dport 3389 -d 80.1.122.39 -j DNAT
CR> --to 192.168.0.4:3389
CR> Commands go well, no problems.
CR> But still I can't connect, is there something that I'm missing?

CR> Thanks very much

CR> Carlos Robles 
CR> mailto txarli11@hotmail.com



-- 
Best regards,
 Alexis                            mailto:alexis@attla.net.ar



