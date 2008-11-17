From: John Haxby <john.haxby@oracle.com>
Subject: Problem compiling
Date: Mon, 17 Nov 2008 20:05:49 +0000
Message-ID: <4921CE9D.8060908@oracle.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

[resend -- sent to wrong list originally, sorry]

Hello All,

I'm having problems compiling this:
http://marek.terminus.sk/prog/ipt_sysrq.shtml

This is on Fedora 9 and RHEL5 and in both cases I get this error:

/usr/include/iptables.h:5:29: error: libiptc/libiptc.h: No such file or
directory

Now, the easiest way to "fix" this is it to make sure that
libiptc/libiptc.h is installed into /usr/include but I'm wary of this as
libiptc.a has a comment in the Makefile that says "libiptc is not a
public interface and therefore not installed."

What is the right thing to do here?   Install the missing header file(s)
or fix the normally installed header files to not refer to those that
aren't?

jch

