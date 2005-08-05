From: "Ming-Ching Tiew" <mingching.tiew@redtone.com>
Subject: 2.4 kernel stale connections
Date: Fri, 5 Aug 2005 14:59:20 +0800
Message-ID: <043e01c5998b$3474f070$0100a8c0@newlife>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org


On my Linux 2.4.29 system, under certain condition, the system
will have a lot of stale connections left behind, which I have
checked it using cat ip_conntrack, where 192.168.1.168 is the
client machine, 202.x.y.z is the destination public site, and
a.b.c.d is my firewall public IP :-

tcp      6 20589 ESTABLISHED src=192.168.1.168 dst=202.x.y.z sport=4660 dport=80 src=202.x.y.z dst=a.b.c.d sport=80 dport=4660
[ASSURED] use=1 mark=5
tcp      6 21184 ESTABLISHED src=192.168.1.168 dst=202.x.y.z sport=4698 dport=80 src=202.x.y.z dst=a.b.c.d sport=80 dport=4698
[ASSURED] use=1 mark=5

[ many of them ]

But I have checked the src ( 192.168.1.168 ) and dst ( 202.x.y.z )
there have not been any traffic in between them for a long while already.
I even inserted rules to drop connection between them but the rules
did not pick up any traffic.

My questions are :-

1. Why is this happening ? Is it because the client program did not close
    the socket properly ? But the client program has been terminated
    for hours already !

2. Why is it that the connections are not expired since there have not been
     any traffic for hours ?

3. Is there a way for me to hand drop certain connections ?

4. I was hoping that the tcp-window-tracking patch will help, but I was not
    able to apply the patch. Before I try to solve the problem of patching, my
    question here is will the tcp-window-tracking patch help ?






