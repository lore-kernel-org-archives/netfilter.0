From: Luca Bedogni <bedogniluca-linux@yahoo.it>
Subject: Re: Routing packets via a C program
Date: Thu, 1 Feb 2007 18:12:55 +0100
Message-ID: <200702011812.55498.bedogniluca-linux@yahoo.it>
References: <200701220958.51794.bedogniluca-linux@yahoo.it>
	<Pine.LNX.4.61.0701271553330.22295@yvahk01.tjqt.qr>
	<200701301714.10868.bedogniluca-linux@yahoo.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200701301714.10868.bedogniluca-linux@yahoo.it>
Content-Disposition: inline
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

On Tuesday 30 January 2007 17:14, Luca Bedogni wrote:
> On Saturday 27 January 2007 15:55, Jan Engelhardt wrote:
> > On Jan 22 2007 09:58, Luca Bedogni wrote:
> > >Hi all
> > >	i'm writing down a simple program for routing the packets manually. The
> > >idea is: if a packet comes from a specific IP (192.168.0.2) I set
> > > ip->saddr to my ip and then accept it. And, if a packets comes from the
> > > outside, i set ip->daddr to 192.168.0.2 and then accept it. I
> > > recalculate the checksum and it's correct (i can see that by printing
> > > out it).
> >
> > What for - are you trying some nifty SNAT/DNAT trick?
>
> Yes, i want to monitor performances and such via normal routing and via
> userspace routing.
>
> > >The basic problem is that, sniffing packets with wireshark, i can see
> > > the packet from 192.168.0.2 to outside, but not mine to outside.
> > >
> > >I also tried with NF_REPEAT and NF_ACCEPT and NF_QUEUE when calling
> > >ipq_set_verdict, but nothing changed..
> >
> > You should be fine by QUEUEing packets in PREROUTING (or at least
> > somewhere before the <Routing Decision> in [PacketFlow]), modify them in
> > your userspace program, reinject them, and have the <Routing Decision> do
> > the right then.
>
> Yes i basically do this, but the packets aren't reinjected. I change the IP
> and recalculate the checksum, but when calling ipq_set_verdict I can't see
> any packets on the wire :(

ATM i've wrote this piece of code that would be sufficient:
/*
 * This code is GPL.
 */
#include <linux/netfilter.h>
#include <netinet/ip.h>
#include <netinet/tcp.h>
#include <netinet/udp.h>
#include <netinet/in.h>
#include <net/if.h>
#include <linux/icmp.h>
#include <libipq/libipq.h>
#include <sys/ioctl.h>
#include <sys/socket.h>
#include <getopt.h>
#include <stdio.h>
#include <stdlib.h>
#include <ifaddrs.h>
#include <netdb.h>
#include <string.h>
#include <unistd.h>

#define BUFSIZE 8194

int main (int argc, char **argv) {
    int status;
    int n_interfaces;
    unsigned char buf[BUFSIZE];
    struct ipq_handle *h;
    h = malloc(sizeof(struct ipq_handle));

    /* Creating an handle */
    h = ipq_create_handle (0, PF_INET);
    if (!h)
        iptables_die (h);

    /* Copying all the packet and not only metadata */
    status = ipq_set_mode (h, IPQ_COPY_PACKET, BUFSIZE);
    if (status < 0)
        iptables_die (h);

    do {
        if ((status = ipq_read (h, buf, BUFSIZE, 0)) < 0)
            iptables_die (h);

        switch (ipq_message_type (buf)) {
            case NLMSG_ERROR: 
                fprintf (stderr, "Received error message %d\n",ipq_get_msgerr 
(buf));
                break;

            case IPQM_PACKET: 
                fprintf(stderr,"");
                ipq_packet_msg_t *m = ipq_get_packet (buf);
                struct iphdr *ip = (struct iphdr *) m->payload;
                if (ip->saddr == inet_addr("192.168.0.2")) {
                    ip->saddr = inet_addr("192.168.1.5");
                } else {
                    ip->daddr = inet_addr("192.168.0.2");
                }
                
                ip->check = ip_checksum(ip);
                status = ipq_set_verdict (h, m->packet_id, NF_ACCEPT, 0, 
NULL);
                if (status < 0)
                    iptables_die (h);

                break;

            default: 
                fprintf (stderr, "Unknown message type!\n");
                break;

        }
    } while (1);

    ipq_destroy_handle (h);
    return 0;
}

This is a very ugly "routing", i now, but would be enough for me. I can see 
the packets entering on my machine but nothing can exit my pc.

I think the code is ok, but maybe's wrong -_-

Regards
-- 
Debian Powered GNU/Linux User #373118
Bedogni Luca - 	Blog | http://blog.lucabedogni.it
		        Site | http://www.lucabedogni.it
Debianizzati - www.debianizzati.org | Founder Member
--
Programming is like sex: 
One mistake and you have to support it your lifetime.

