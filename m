From: "Olexandr O. Galay" <root@e-mail.te.ua>
Subject: Re: Need urgent help on NAT/load sharing
Date: Fri, 6 Feb 2004 09:51:31 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <111148915000.20040206095131@e-mail.te.ua>
References: <003701c3ec0c$f8cc09f0$6329d9d5@Zamani>
Reply-To: "Olexandr O. Galay" <root@e-mail.te.ua>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <003701c3ec0c$f8cc09f0$6329d9d5@Zamani>
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

Hello, Saeed!

Replying to your letter:

S> Hi all,
S>    I am new to list and have a basic nat question on Redhat Linux 9. I
S> have to translate my local IP ( 192.168.1.0/24 ) to two different public
S> IP given by two different ISP ( IPE1 & IPE2 ) at a specified rate. For
S> example for every 4 received packet, one have to translate to IPE1 and
S> other three to IPE2. I need this for load balacing the internet traffic
S> between two isp. At the end, it is excellent if there is an option that
S> If one the ISP gateway is dead, all packets have to translate to other
S> public IP. Please help me. 
S> Thanks, 
S> Saeed Zamani, 
S> Technical Manager, 
S> Concept FZ LLC. 
I think, you can balance when you are connecting to another ports
So, if you are connecting to port 80, you can NAT packets to IPE1, and
another packets to IPE2

iptables -t nat -A POSTROUTING -p tcp --dport 80 -j SNAT
--to-destination ipe1.ip.address
iptables -t nat -A POSTROUTING -j SNAT --to-destination
ipe2.ip.address



-- 
Best Regards, Saeed!

Friday, February 6, 2004, 9:49

Olexandr O. Galay
mailto:root@e-mail.te.ua
http://www.macros.org.ua
ICQ: 29292281


