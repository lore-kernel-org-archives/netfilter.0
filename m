From: aksingh@hss.hns.com
Subject: Re: loop problem
Date: Wed, 21 Apr 2004 18:31:51 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OFD59B8072.78305988-ON65256E7D.0046DABC@hss.hns.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; 
	Boundary="0__=EABBE4EEDFD55C2C8f9e8a93df938690918cEABBE4EEDFD55C2C"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Sven Schuster <schuster.sven@gmx.de>
Cc: netfilter@lists.netfilter.org

--0__=EABBE4EEDFD55C2C8f9e8a93df938690918cEABBE4EEDFD55C2C
Content-type: text/plain; charset=US-ASCII





Hi Sven

  I think you got my question wrong but thank anyways yr answer helped
anyways ....
first, i believe a packet that hits IP_PRE_ROUTING can never hit
IP_LOCAL_OUT, even if it is reinjected ... am i right ?

now to your answer , u mean to say i can tag a packet when it passes thru
one hook so that another hook if it catches it can look at it and handle it
differently .. i just saw struct sk_buff  ... it has an element unsigned
lonf nfmark ... so you mean to say i can set it to a paricular value, so
that when someother hook picks it up can identify that someone has already
looked at it, right ? ... yes surely this can help when we have
IP_PRE_ROUTING/POST_ROUTING combination or someother possible combination
like IP_LOCAL_OUT and IP_POST_ROUTING .

thanks sven ... btw whats HTH ? :)
Amit




Sven Schuster <schuster.sven@gmx.de>@lists.netfilter.org on 04/21/2004
01:34:30 PM

Sent by:    netfilter-admin@lists.netfilter.org


To:    Amit Kumar Singh/HSS@HSS
cc:    netfilter@lists.netfilter.org

Subject:    Re: loop problem



Hi Amit,

On Wed, Apr 21, 2004 at 12:08:33PM +0530, aksingh@hss.hns.com told us:
>
> Hi All
>
>   capture packets using the netfilter PRE_ROUTING(all packets coming from
> outside this machine wld be captured here) and  and the NF_IP_LOCAL_OUT
> loop(all packets that are going out of my machine would be captured
here).
> Then I do a bit of packet mangling in the user space by returning
NF_QUEUE
> from these two hook functions , my user space process which gets the
> packets can do two things, it can either reinject the same into the
kernel
> ... by setting the verdict in ip_set_verdict  as NF_ACCEPT .... or it can
> generate(absolutely new packets) its own packets which it wants to send
to
> the kernel. I use libnet to inject these new packets, my context in
libnet
> is RAW. Now when these newly injected packets reach the ip( the ones that
> were reinjected .. using the ip_set_verdict call are handled fine ... no
> problems there) , they are caught by my NF_IP_LOCAL_OUT hook and handed
> back to my user space appliaction, i dont want this to happen. what can i
> do here to prevent this loop.

Maybe you could mark the packets in PREROUTING hook and in LOCAL OUT
just hand those packets to userspace without the mark??


HTH

Sven

>
> thanks
> Amit
>

--
Linux zion 2.6.6-rc1 #1 Sat Apr 17 11:50:12 CEST 2004 i686 athlon i386
GNU/Linux
  10:02:33  up 14:51,  1 user,  load average: 0.02, 0.05, 0.01

--0__=EABBE4EEDFD55C2C8f9e8a93df938690918cEABBE4EEDFD55C2C
Content-type: application/octet-stream; 
	name="C.DTF"
Content-Disposition: attachment; filename="C.DTF"
Content-transfer-encoding: base64

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0NClZlcnNpb246IEdudVBHIHYxLjIuMSAoR05V
L0xpbnV4KQ0KDQppRDhEQlFGQWhpc09vNEZBZEIyUG5lUVJBckVHQUo0cGJWLzlUNUZHNEpHOGZ4
eU14ZnVFWll3eDl3Q2ZYSEhrDQpobnRQWGVIbVIrazJDVVBTMW8yd3VrRT0NCj1GNFVWDQotLS0t
LUVORCBQR1AgU0lHTkFUVVJFLS0tLS0NCg0K

--0__=EABBE4EEDFD55C2C8f9e8a93df938690918cEABBE4EEDFD55C2C--


