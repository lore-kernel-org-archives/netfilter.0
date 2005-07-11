From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Icons Freeze on debian, connected online.
Date: Mon, 11 Jul 2005 13:54:32 -0500
Message-ID: <42D2C068.1000404@gmx.co.uk>
References: <7833b03c050711104546009611@mail.gmail.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <7833b03c050711104546009611@mail.gmail.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org
Cc: Sachin <gopalsachin@gmail.com>

Sachin wrote:
> I am new to IPTABLES and recently put my debian sarge online with
> firestarter as the firewall. As soon as i connect the desktop icons
> are inaccesible and freeze as if SLEEP mode is activated. 

"Firestarter" tells me nothing. Is there a firestarter help forum? Try 
asking there.

There's probably something dreadfully wrong in your iptables rules. I 
would have to see them (hint: iptables-save(8)) to know what it is, 
although I do have a theory.

>   If i am logging to virtual terminal lot of output starts on the
> screen and it seems somebody is scanning me.

Why do you think that somebody is scanning you?

> As i am a newbie i am not able to decrypt whats
> goin on the background.

And this is precisely why you should not jump to conclusions about being 
scanned or attacked. Newbie paranoia is not good. When you see something 
you don't understand, think, "Here is something I don't understand," not 
"Oh no! Something terrible is happening!!" Then look it up and find out 
what it is.

> I am posting the output of the dmesg which also flows
> down on the virtual terminal when i login. Is there a way to stop it.

My theory: rampant LOG rules. Delete all LOG rules. Only use LOG for 
specific purposes, and generally in conjunction with -m limit.

> I assume the icons freeze because of this and so i cannot browse the
> local file system once online.

It is quite reasonable to think that LOG rules could bring a system to a 
crawl.

> Snip --
> 
> IN=ppp0 OUT= MAC= SRC=83.88.20.210 DST=220.226.22.163 LEN=168 TOS=0x00
> PREC=0x00 TTL=242 ID=30185 PROTO=ICMP TYPE=11 CODE=0

Now, let's work on understanding these. IN= gives the name of the 
incoming interface, if appropriate. OUT=, outgoing. SRC=, the source IP, 
DST=, destination. After that you'll usually be most interested in PROTO 
and in this case being ICMP, it's a type 11.

http://www.faqs.org/docs/iptables/icmptypes.html

> [SRC=220.226.22.163 DST=158.36.2.10 LEN=40 TOS=0x00 PREC=0x00 TTL=5
> ID=36362 PROTO=UDP SPT=36179 DPT=33617 LEN=20 ]

Here's the UDP packet that generated the ICMP one. SPT=, source port, 
DPT=, destination port. (Those also apply to PROTO=TCP.) I'd have to 
look it up to be sure, but I think that might be a traceroute.

You are getting a lot of ICMP 11's. Here's a type 3:

> IN=ppp0 OUT= MAC= SRC=163.13.240.201 DST=220.226.22.163 LEN=56
> TOS=0x00 PREC=0x00 TTL=54 ID=15028 PROTO=ICMP TYPE=3 CODE=3
> [SRC=220.226.22.163 DST=163.13.240.201 LEN=40 TOS=0x00 PREC=0x00 TTL=1
> ID=36391 PROTO=UDP SPT=36179 DPT=33646 LEN=20 ]

And here's a TCP SYN packet:

> IN=ppp0 OUT= MAC= SRC=220.226.36.161 DST=220.226.22.163 LEN=48
> TOS=0x00 PREC=0x00 TTL=123 ID=7263 DF PROTO=TCP SPT=2260 DPT=1433
> WINDOW=16384 RES=0x00 SYN URGP=0

I bet if you delete your LOG rules all will be well. Why would you want 
to have logs you cannot interpret?

Again, and I've said this on this list before, I rarely use LOG. When I 
am looking for something in particular I turn them on. I don't care 
about logging what I've dropped, in most cases. Why bother?

(Yes, yes, I know that there might be cases in which it's worth the 
bother. In those cases you'd have some kind of monitoring software, though.)
-- 
     mail to this address is discarded unless "/dev/rob0"
     or "not-spam" is in Subject: header

