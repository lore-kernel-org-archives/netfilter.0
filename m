From: Julian Gomez <kluivert@tm.net.my>
Subject: Re: iptables 'make' killed my box
Date: Tue, 26 Aug 2003 13:17:47 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030826051747.GB2558@propaganda.localdomain>
References: <812338CA-D728-11D7-B488-000393DB0944@caffeinemediainc.com> <20030825225128.006e9bc6.arnt@c2i.net>
Reply-To: kluivert@tm.net.my
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20030825225128.006e9bc6.arnt@c2i.net>
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

On Mon, Aug 25, 2003 at 10:51:28PM +0200, Arnt Karlsen spoke thusly:
>On Mon, 25 Aug 2003 14:18:19 -0400, 
>Scott Gaertner <scott@caffeinemediainc.com> wrote in message 
><812338CA-D728-11D7-B488-000393DB0944@caffeinemediainc.com>:
>
>.kernel panic hint;  toss in an "append="panic 20" or somesuch, to 
>your boot loader and cli and (which file?) in /proc, to avoid further 
>such embarrasment, "panic 20" reboots the box in 20 secs on a panic.

/proc/sys/kernel/panic btw.

>> I downloaded the package, entered the directory, typed "make
>> KERNEL_DIR=/usr/src/kernel-source-2.4.18/", and after a listing of found
>> extensions, I lost connection to the box.  (Complete transcript 
>> at end of message).  I can no longer even ping any address on that 
>> network. (The machine was acting as a router as well).

I've found an odd way to Oops my desktop, by copying Maildir files from a
flash disk (vfat) to an ext3 fs. Copied, copied, copied - and *wham* kernel
oops.

