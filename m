From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: iptables 'make' killed my box
Date: Mon, 25 Aug 2003 22:51:28 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030825225128.006e9bc6.arnt@c2i.net>
References: <812338CA-D728-11D7-B488-000393DB0944@caffeinemediainc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <812338CA-D728-11D7-B488-000393DB0944@caffeinemediainc.com>
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

On Mon, 25 Aug 2003 14:18:19 -0400, 
Scott Gaertner <scott@caffeinemediainc.com> wrote in message 
<812338CA-D728-11D7-B488-000393DB0944@caffeinemediainc.com>:

> Hello,
> 
> I tried to build iptables 1.2.8 today, and failed miserably.  My
> system is Debian Linux - 2.4.18-c3 kernel, i686.

..I would think you want 2.4.21 and possibly pom, to go with 1.2.8.

..and your transcript smells like a kernel panic or a power surge or 
somesuch, I don't see anything bad in what you have posted here.

..kernel panic hint;  toss in an "append="panic 20" or somesuch, to 
your boot loader and cli and (which file?) in /proc, to avoid further 
such embarrasment, "panic 20" reboots the box in 20 secs on a panic.

> 
> I downloaded the package, entered the directory, typed "make 
> KERNEL_DIR=/usr/src/kernel-source-2.4.18/", and after a listing of 
> found extensions, I lost connection to the box.  (Complete transcript 
> at end of message).  I can no longer even ping any address on that 
> network. (The machine was acting as a router as well).
> 
> I am trying to get physical access to the machine, and when (if) I get
> it, my time there will be extremely limited.  I would *greatly* 
> appreciate any suggestions along the following lines --
> 
> - Could the 'make' command alone have killed my box, or must it have 
> been a coincidence?
> 
> - If it was iptables, can anyone give me a hint as to how to reverse 
> the effects as efficiently and quickly as possible?
> 
> - Alternatively, is this normal behavior, and do I just need to 
> complete the install and open up traffic?
> 
> Any help would be appreciated -- I was acting quickly to block an 
> influx of spam, and my actions have affected a lot of people.
> 
> Thank you in advance,
> 
> -Scott Gaertner
>   scott@caffeinemediainc.com
>   917-495-4276
> 

-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.


