From: "Jan Kaastrup" <jka@protego.dk>
Subject: RE: Problems with kernel 2.6.1 and iptables
Date: Mon, 16 Feb 2004 15:05:23 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <009101c3f495$eb553440$2d64a8c0@pcjka>
References: <1458943229.20040216101803@attla.net.ar>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1458943229.20040216101803@attla.net.ar>
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
To: 'Alexis' <alexis@attla.net.ar>
Cc: 'netfilter' <netfilter@lists.netfilter.org>

Hi 
Thanks so much for the answer.
That did the trick.
Now the iptables modules can be loaded automaticly!

I found out that it could not load the module iptable_filter.
So doing:
#modprobe iptable_filter - made it work.


 



-----Original Message-----
From: Alexis [mailto:alexis@attla.net.ar] 
Sent: 16. februar 2004 14:18
To: Jan Kaastrup
Cc: netfilter
Subject: Re: Problems with kernel 2.6.1 and iptables


you need to change some things in /etc/rc.sysinit in order to modules
work again.

check for /proc/ksyms in that file and change it to /proc/kallsyms.
then do a depmod -a

maybe these changes could help you

http://thomer.com/linux/migrate-to-2.6.html


hope it helps



Hello Jan,

Monday, February 16, 2004, 7:13:48 AM, you wrote:

JK> Hi list
JK> I have search google for this error most of my weekend, and I cannot
get
JK> the answer :(
JK> I have upgraded my kernel to 2.6.1 and made all the iptables stuff
as
JK> modules.
JK> I can load all modules by hand perfectly, but still i get this
error:
JK> #Iptables -L
JK> iptables v1.2.9: can't initialize iptables table `filter': Table
does
JK> not exist (do you need to insmod?)
JK> Perhaps iptables or your kernel needs to be upgraded.

JK> I have reinstalled iptables and done depmod -a
JK> I have installed module-init-tools-2.0-pre10

JK> It seems like it cannot mount modules automaticly, any ideas?
JK> Which modules should absolutly be loaded, to make iptables work?
JK> Could it be, that i am missing a
JK>
iptables-need-to-be-installed-to-make-iptables-work-for-kernel-2.6.x-pac
JK> ket?

JK> Thanks a lot





