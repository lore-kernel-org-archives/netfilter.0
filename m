From: Emanoil Kotsev <emanuel@abc.at>
Subject: compiling iptables support for other machine
Date: Sat, 03 May 2003 13:29:01 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3EB3A7FD.22A17A1@abc.at>
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------4F005767D9AF20273C89A644"
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
To: netfilter@lists.netfilter.org


--------------4F005767D9AF20273C89A644
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hi, folks,

I might be wrong looking for help in this forum but as it is related to
the topic I hope someone can give me a usefull advice or an idea where
I can find related information to solve the following problem:
=====
I am trying to compile a new kernel on my machine (MA) for anathor
machine (MB) that I am using as firewall, where I need extended iptables
support.

MB is very slow and does not have enough diskspace, so I can not install
compilers or headers there.
Tehre is enough space for a new kernel though.

What I was trying ot do is to compile the kernel on MA and to install it
after I nfs-mount the linux-directory from MA to MB.
Unfortunately a developers environment on MB is missing and I got
following error after i do
make install

make: *** No rule to make target
`/usr/src/kernel-source-2.4.20/include/asm/param.h', needed by
`/usr/src/kernel-source-2.4.20/include/linux/sched.h'.  Stop.

Unfortunately on MA everything is compiling fine - where is the problem
what do I need for the asm/param.h

Is it enough to compile on MA and to copy the relevant stuff eg. vmlinuz
+ modules to MB

thanks a lot

--
+ Emanoil Kotsev - - - - -+
+ E-Mail: emanuel@t2u.com +



--------------4F005767D9AF20273C89A644
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: 7bit

<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<html>
Hi, folks,
<p>I&nbsp;might be wrong looking for help in this forum but as it is related
to the topic I&nbsp;hope someone can give me a usefull advice or an idea
where I&nbsp;can find related information to solve the following problem:
<br>=====
<br>I&nbsp;am trying to compile a new kernel on my machine (MA) for anathor
machine (MB) that I&nbsp;am using as firewall, where I&nbsp;need extended
iptables support.
<p>MB is very slow and does not have enough diskspace, so I&nbsp;can not
install compilers or headers there.
<br>Tehre is enough space for a new kernel though.
<p>What I&nbsp;was trying ot do is to compile the kernel on MA and to install
it after I&nbsp;nfs-mount the linux-directory from MA to MB.
<br>Unfortunately a developers environment on MB is missing and I&nbsp;got
following error after i do
<br>make install
<p>make: *** No rule to make target `/usr/src/kernel-source-2.4.20/include/asm/param.h',
needed by `/usr/src/kernel-source-2.4.20/include/linux/sched.h'.&nbsp;
Stop.
<p>Unfortunately on MA everything is compiling fine - where is the problem
what do I&nbsp;need for the asm/param.h
<p>Is it enough to compile on MA and to copy the relevant stuff eg. vmlinuz
+ modules to MB
<p>thanks a lot
<pre>--&nbsp;
+ Emanoil Kotsev - - - - -+
+ E-Mail: emanuel@t2u.com +</pre>
&nbsp;</html>

--------------4F005767D9AF20273C89A644--


