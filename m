From: "Maarten Wijnants" <maarten.wijnants@pandora.be>
Subject: Re: injecting packets from QUEUE handler
Date: Fri, 7 Jan 2005 09:48:18 +0100
Message-ID: <006101c4f495$a2727110$642813ac@in.edm.luc.ac.be>
References: <f663f6360501062139f283c00@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: Mike Carlton <mikecarlton@gmail.com>, netfilter@lists.netfilter.org

Hello Mike,

This is an interesting question. I am doing a similar thing in my libipq 
userspace application. My approach to the described situation is to issue 
NF_DROP for the packets and subsequently send them out in the userspace 
application with a UDP socket (because I am only doing this for UDP 
traffic). This works fine, but the drawback is that this way the source IP 
and port are set to the IP and port of the machine running the userspace 
application. What I do to fix this, is to QUEUE the packets on the OUTPUT 
hook and there I replace the source IP and port of the sent out packets with 
their original values.

As said, this approach works fine for me, but I am interested to know if 
there are other possibilities (e.g. using the NAT table to set the source IP 
and port back to their original values).

Kind regards,
Maarten

----- Original Message ----- 
From: "Mike Carlton" <mikecarlton@gmail.com>
To: <netfilter@lists.netfilter.org>
Sent: Friday, January 07, 2005 6:39 AM
Subject: injecting packets from QUEUE handler


> I've got an application where I need to inspect up to the first 2 data
> packets of a new HTTP connection before deciding whether to pass or
> alter the connection data (in particular, I need to see the initial
> HTML data and some servers will send HTTP headers in one packet and
> data in the next).
>
> I've setup a QUEUE target so that I can do this all in user space.  It
> is easy enough to cache the contents of the first packet (if we need
> to inspect the second for this particular connection) and return
> NF_DROP.
>
> The question is how to best handle the case when we inspect the second
> packet and decide everything is fine so it is time to send the saved
> first packet and the current second.
>
> I'm planning on just NF_ACCEPTing the second packet, then using a
> PF_PACKET socket to re-inject the contents of the first packet.
>
> Is there a cleaner way to do this?  I'll have to take care of various
> corner cases (ie. the packets get dropped or duplicated before
> reaching us).  I'll let the clients deal with the out of order packet
> arrivals that we cause.
>
> thanks,
> --mike
>
>
> 


