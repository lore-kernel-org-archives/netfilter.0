From: "Jeffrey D. Brower" <jeff@pointhere.net>
Subject: Re: real-time monitor question
Date: Tue, 5 Aug 2003 14:10:41 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <042401c35b7c$e22a4840$0b02a8c0@pointhere.net>
References: <09B04A55822EFF4DA48D2E0BB2941D4A0192DB@wardrive.citadelcomputer.com.au>
Reply-To: "Jeffrey D. Brower" <jeff@pointhere.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: George Vieira <georgev@citadelcomputer.com.au>
Cc: netfilter@lists.netfilter.org

> Why not put all DROP rules into a -N DROPFILTER chain and then all DROP
rules
> created jump to this table.

This is kind of what I had in mind when I was saying the ACCEPT1 - ACCEPTn
table names (chains) for each interface so I could keep track of the ACCEPT
and DENY on an interface.

> Then what you'd have to do is write a simple program which talks to your
parallel port

No problem there.

> and lists the DROPFILTER chain and compares it's values to the previous
set
> of values gathered and do something when it sees a change.

Ah!  There's the rub!  I have no idea how to do that.

> C++ code is best for this as it's smaller and faster than say running a
PHP script

Agreed.

I also see your idea of using the byte count reather than the packet count.
Obviously, if the bytes denied are greater than zero, at least one packet
has been DENYed.  If I use that to drive the LEDs it looks like real time
and when I look in the actual log I can have it smaller and more usefull (as
in not every packet logged).


