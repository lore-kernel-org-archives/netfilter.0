From: DarKRaveR <DarKRaveR@habitat-b.de>
Subject: Re[2]: Port forwarding problem...
Date: Tue, 11 Feb 2003 23:31:02 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <14335293519.20030211233102@habitat-b.de>
References: <001601c2d1fa$669894e0$990da8c0@..153.service>
 <10123299412.20030211201108@habitat-b.de>
Reply-To: DarKRaveR <DarKRaveR@habitat-b.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <10123299412.20030211201108@habitat-b.de>
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
Cc: Danila Octavian <pisic@service.agress.ro>

Hello Danila,

there's some -p tcp missing cuz we only want that, refer to the mail
from Robert (I think) he gave all 3 rules, that should fix your
problem ...

Tuesday, February 11, 2003, 8:11:08 PM, you wrote:

D> Hello Danila,

D> Shouldn't be a problem, since netfilter takes care before the paket
D> hits anything else, as long as you put your rule in the prerouting
D> chain.
D> All you wanna do is add something like:

D> iptables -t nat -A PREROUTING -d realip --dport 33333 -i eth0 -j DNAT
D> --to 192.168.13.147.80

D> This rewrites the destination address. if you ip is from a dialup
D> connection you might want to use MASQUERADE ...
D> And make sure you have connection tracking, so the answer packages get
D> rewritten properly.

D> I think that should do ....
D> Check out the FAQs there's some nice examples there ...

D> Tuesday, February 11, 2003, 7:21:30 PM, you wrote:

DO>> Hello,

DO>> I want to ask you something regarding something that i am stuck in... :-)
DO>> I need to allow acces to a Web server which runs on a machine inside my LAN.
DO>> my topology is  :

DO>> internet <------>(eth0)[web,smtp,pop3,ftp](eth1)<------>LAN(192.168.13.0/24)

DO>> i have only one "real" IP on eth0.
 
DO>> can you tell me how can i use something like :

DO>> http://www.myserver.xxx:33333 to redirect to .. let's say 192.168.13.147:80 ??

DO>> the main problem that i see here is that on port 33333 i have no services running.

DO>> Thanxx in advance,
DO>>                                          Danila Octavian(pisic@service.agress.ro)






-- 
Best regards,
 DarKRaveR                            mailto:DarKRaveR@habitat-b.de


