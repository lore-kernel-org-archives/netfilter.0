From: "Deepak Seshadri" <dseshadri@broadbandmaritime.com>
Subject: RE: iptables script file
Date: Thu, 28 Oct 2004 09:56:36 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <200410281351.i9SDpdoL058208@jkcpub.iserver.net>
References: <B069AFB1CBDE6F6A01A304D9@[10.169.6.246]>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <B069AFB1CBDE6F6A01A304D9@[10.169.6.246]>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: 'Kenneth Porter' <shiva@sewingwitch.com>, 'Netfilter Group' <netfilter@lists.netfilter.org>

Hello everybody,

Kenneth: Thank you very much for the reply. I'll look into this option.

Does anybody have any other suggestion? How does everyone load their
rule-set?

My original mail:
"So far I have been writing all the iptables commands in a file & ran it in
a terminal (bash filename). Then I do the "service iptables save" to save &
load the configuration during boot-up. Pretty soon the configuration file is
going to have around 800 commands & this file is modified quite often. So
for the changes to reflect in run-time I do a "bash <script-file>".
Somewhere I read that loading that many commands using "bash <script-file>"
is not recommended (Is this true?). So I started searching in Google for
other alternatives. I came across the following:

- Use rc.firewall (I don't know if its in /etc or /etc/init.d or what)
- Use /etc/firewall.conf
- Use /etc/init.d/firewall

Could someone tell me which file to use? In Fedora core 2 I found only
/etc/rc.d/init.d/iptables.
Which way would be easy to load a huge script that would be modified quite
often?

OS specs:
Fedora Core 2
Kernel 2.6.8.1
Iptables 1.2.11"

Any help will be greatly appreciated.
Thank you,

Deepak Seshadri

> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org [mailto:netfilter-
> bounces@lists.netfilter.org] On Behalf Of Kenneth Porter
> Sent: Monday, October 25, 2004 5:29 PM
> To: 'Netfilter Group'
> Subject: Re: iptables script file
> 
> > Which way would be easy to load a huge script that would be modified
> quite
> > often?
> 
> iptables-restore
> 
> The save format is a little weird at first but it's not too hard to see
> how
> it matches your iptables commands. I now modify /etc/sysconfig/iptables
> directly. (This is the save file used on Red Hat systems to reload the
> firewall at boot time.)
> 
> If I understand things correctly, iptables-restore makes a single kernel
> call with only one lock, so it's very efficient at loading the tables into
> the kernel.
> 
> Change your script to write your rules into the save format and then
> invoke
> iptables-restore to load it. This is actually pretty simple, as most of
> your iptables commands will be replaced with "echo ${RULEBODY} >
> ${SAVEFILE}" (where RULEBODY is the parameters to your old iptables
> command).
> 
> 



