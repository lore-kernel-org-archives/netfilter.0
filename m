From: DarKRaveR <DarKRaveR@habitat-b.de>
Subject: Re: Port forwarding problem...
Date: Tue, 11 Feb 2003 20:11:08 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <10123299412.20030211201108@habitat-b.de>
References: <001601c2d1fa$669894e0$990da8c0@..153.service>
Reply-To: DarKRaveR <DarKRaveR@habitat-b.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001601c2d1fa$669894e0$990da8c0@..153.service>
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
To: Danila Octavian <pisic@service.agress.ro>
Cc: netfilter@lists.netfilter.org

Hello Danila,

Shouldn't be a problem, since netfilter takes care before the paket
hits anything else, as long as you put your rule in the prerouting
chain.
All you wanna do is add something like:

iptables -t nat -A PREROUTING -d realip --dport 33333 -i eth0 -j DNAT
--to 192.168.13.147.80

This rewrites the destination address. if you ip is from a dialup
connection you might want to use MASQUERADE ...
And make sure you have connection tracking, so the answer packages get
rewritten properly.

I think that should do ....
Check out the FAQs there's some nice examples there ...

Tuesday, February 11, 2003, 7:21:30 PM, you wrote:

DO> Hello,

DO> I want to ask you something regarding something that i am stuck in... :-)
DO> I need to allow acces to a Web server which runs on a machine inside my LAN.
DO> my topology is  :

DO> internet <------>(eth0)[web,smtp,pop3,ftp](eth1)<------>LAN(192.168.13.0/24)

DO> i have only one "real" IP on eth0.
 
DO> can you tell me how can i use something like :

DO> http://www.myserver.xxx:33333 to redirect to .. let's say 192.168.13.147:80 ??

DO> the main problem that i see here is that on port 33333 i have no services running.

DO> Thanxx in advance,
DO>                                          Danila Octavian(pisic@service.agress.ro)



-- 
Best regards,
 DarKRaveR                            mailto:DarKRaveR@habitat-b.de


