From: kernel_learner <kernel_learner@yahoo.com>
Subject: Netfilter as an application.
Date: Fri, 16 Jan 2004 08:39:06 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040116163906.40844.qmail@web40307.mail.yahoo.com>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org



Dear All,

 How's it going! I am looking for something that I am
not sure currently exists. Basically I want to make a
version of netfilter that's free from all the
kernel-level and networking stack hooks. I am looking
for a plain simpler version of netfilter which does
not interact with the kernel or the networking stack
in any way. It would be a standard user program which
a person with normal privelges could compile and run.
What would it do? It could do the same things that
netfilter does...i.e. filter packets/NAT etc. However
the input could be driven from a "main" function which
"fakes" packets arriving on the network (this could be
driven from a trace).

Does such a thing exist?

How easy/difficult would it be to hack into the
current netfilter code to remove all the
networking/kernel hooks it has?

Could someone guide me as to how exactly to go about
doing this? i.e. where the hooks are..in the code?

I was also looking for documentation on the code...I
mean is there a documentation that explains the
software architecture?

Sorry for too many questions! :|

Cheers!
KeRNEL_LeaRNER

"Metallica- The mother of all ye metal bands."






__________________________________
Do you Yahoo!?
Yahoo! Hotjobs: Enter the "Signing Bonus" Sweepstakes
http://hotjobs.sweepstakes.yahoo.com/signingbonus

