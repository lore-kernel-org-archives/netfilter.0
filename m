From: SBlaze <dagent.geo@yahoo.com>
Subject: P-O-M and string matching
Date: Fri, 4 Apr 2003 10:03:35 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030404180335.38470.qmail@web40204.mail.yahoo.com>
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
To: nml <netfilter@lists.netfilter.org>

Could someone give me the proper way to have string matching added into a newly
downloaded kernel.org source? I seem to be having major problems with the
effort.

I downloaded the newest patch o matic and iptables source bzips and the newest
stable 2.4.20 kernel.org source. The box is a Debian woody installation...using
apt to pull from the testing tree... I don't think any of that would cause
interference but its added information for those of you out there whom are
wiling to help a desperate soul out!

I unpacked the kernel source and moved the dir to /usr/src. Sym linking
/usr/src/linux to it as normal. I then did a make old config to just have a
basic config to go by. I did not do any other compilation steps for the kernel.


Then using patch o matic I applied a very few changes (quote time and string).
Now the quote and time patches are selectable from a make menuconfig from the
/usr/src/linux directory. However the string matching options are NO WHERE to
be found. I don't understand why and thats why I need help.

Can anyone tell me what I am doing wrong? Is it a bug somewhere? Thanks in
advance for anyones and everyones time!




=====
"No touchy NO TOUCHY! Emperor Kuzko -=Emperor's New Groove=-"

__________________________________________________
Do you Yahoo!?
Yahoo! Tax Center - File online, calculators, forms, and more
http://tax.yahoo.com

