From: aksingh@hss.hns.com
Subject: ipq_read timeout
Date: Wed, 19 May 2004 16:49:22 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OF0887896F.AC63B2A0-ON65256E99.003DE252@hss.hns.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; 
	Boundary="0__=EABBE40ADFAE64C28f9e8a93df938690918cEABBE40ADFAE64C2"
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
Cc: "Jee J.Z." <jz105@york.ac.uk>, netfilter@lists.netfilter.org

--0__=EABBE40ADFAE64C28f9e8a93df938690918cEABBE40ADFAE64C2
Content-type: text/plain; charset=US-ASCII





Hi Sven,

   Which version of iptables/libipq do you use. As u said we can define a
negative timeout value for ipq_read so that it returns immediately. I have
iptables-1.2.1a-1.on a system. A man ipq_read there shows me that the
timeout parameter for ipq_read has not yet been implemented.

thanks
Amit




Sven Schuster <schuster.sven@gmx.de>@lists.netfilter.org on 04/20/2004
02:16:26 PM

Sent by:    netfilter-admin@lists.netfilter.org


To:    "Jee J.Z." <jz105@york.ac.uk>
cc:    netfilter@lists.netfilter.org

Subject:    Re: whether there are any packets in the ip_queue


On Tue, Apr 20, 2004 at 01:16:17AM +0100, Jee J.Z. told us:
> Hi all,
>
> I am using libipq for userspace programming on netfilter. I am having
> problems to determine whether there are any packets in the ip_queue
before I
> call the function ipq_read(). I just don't wish to call ipq_read() when
> there is no packet in the ip_queue, because I need my program to do other
> things rather than waiting for a packet arriving (after calling
ipq_read(),
> the program will stop and wait for some time or until a packet coming
from
> the kernel). Are there anybody on the list who has any idea about this?

Why don't you just call ipq_read with a negative timeout value?? When
there's no packet available it will return immediately with a return
code of 0. (see "man ipq_read")


HTH

Sven

>
> BTW, may I ask whether this is the proper list to ask about
netfilter/libipq
> programming, since it seems few people on the list talking about this
kind
> of questions?
>

--
Linux zion 2.6.6-rc1 #1 Sat Apr 17 11:50:12 CEST 2004 i686 athlon i386
GNU/Linux
  10:44:31  up 2 days, 17:42,  1 user,  load average: 0.00, 0.01, 0.00

--0__=EABBE40ADFAE64C28f9e8a93df938690918cEABBE40ADFAE64C2
Content-type: application/octet-stream; 
	name="C.DTF"
Content-Disposition: attachment; filename="C.DTF"
Content-transfer-encoding: base64

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0NClZlcnNpb246IEdudVBHIHYxLjIuMSAoR05V
L0xpbnV4KQ0KDQppRDhEQlFGQWhPTmlvNEZBZEIyUG5lUVJBdHlPQUo0N1VCaFVOUjRldk05T0l2
dzBrQ3NOOUxYNldBQ2VOSEZiDQplNHZIZHFuRTFkUHBCZ0laRGtPUEhLTT0NCj1LVEVJDQotLS0t
LUVORCBQR1AgU0lHTkFUVVJFLS0tLS0NCg0K

--0__=EABBE40ADFAE64C28f9e8a93df938690918cEABBE40ADFAE64C2--


