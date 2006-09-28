From: Noman Jamil <zil_pk@yahoo.com>
Subject: ip_nat_h323/h323 module nat problem!
Date: Wed, 27 Sep 2006 21:21:27 -0700 (PDT)
Message-ID: <20060928042127.62690.qmail@web50402.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello,


I have been able to compile the kernel 2.6.18 with
h323 support and iptables version 1.3.5, however, I am
still not able to conduct (h323) calls between the
outside  and NAT endpoint.

First, after rebuild of kernel and reboot, i have 
loaded  ip_nat_h323 and ip_nat_h343 module. When
placing a call from the NAT endpoint  to a remote
endpoint. The same symptoms occur as before I applied
the patch/module. The  remote user is unable to hear
(recieve voice) from the inside NAT endpoint.  The
remote use can accept the call and recieve everything
fine.

Do you have any answer to this riddle. I hope it is
simple and that I  am missing a "step" somewhere, or
there is something wrong with the connection tracking,
which is not replacing/writing the header when send
information to the NATed endpoint, below is the detail
description of  a call.

My linux machine (h323-nat-machine) is configured with
h323 support and connected with 2 networks (LAN &
WAN), LAN ip is 10.x.x.x and WAN IP is  80.x.x.x, one
of the endpoint is behind the nat or at 10.x.x.x.
network and 2nd endpoint is on the public network (IP
202.x.x.x).

When a call is established from the public end point
it send the setup msg to h323-nat-machine with media
connection ip 202.x.x.x, now h323-nat-machine forward
that same setup msg to internal end point without
changing the media connection IP. With h323 NATing
point of view media connection ip has to be replaced
with h323-nat-machine internal/LAN IP which is not in
this case, coz of that RTP/voice couldn't initiate
between the endpoints.

Same is the case with sip module support in kernel.

I have applied following iptables rules for h323
module:

iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
ptables -t nat -A PREROUTING -i eth0 -p tcp --dport
1720 -j DNAT --to-destination 10.x.x.x

Prompt response will be appreciated.

Regards,
Nouman



__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 

