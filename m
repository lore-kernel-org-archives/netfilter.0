From: Iliya Peregoudov <iliyap@rambler.ru>
Subject: Listening for queued packets over netlink
Date: Mon, 16 Aug 2004 21:43:23 +0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <web-74047681@mail1.rambler.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

I wrote a small dumb program that listens for packet messages from=20
ip_queue module. But the program is not working as I expect it to=20
work. It receives an infinite flow of trash packets from kernel.=20
Please help! I need a clue. The program text is below.

#include <asm/types.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <linux/netlink.h>
#include <linux/netfilter.h>
#include <linux/netfilter_ipv4/ip_queue.h>
#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <time.h>
#include <signal.h>

static int done =3D 0;

void sigint(int signum)
{
    done =3D 1;
}

int main(int argc, char *argv[])
{
    int fd;
    struct sockaddr_nl a;
    size_t alen;
    struct sockaddr_nl ra;
    size_t ralen;
    struct nlmsghdr *h;
    struct ipq_mode_msg *m;
    struct ipq_packet_msg *p;
    struct ipq_verdict_msg *v;
    char dbuf[20];
    unsigned char obuf[128];
    unsigned char ibuf[128];
    size_t nsent, nrecv;
    int seq =3D 0;

    /* Create the socket */
    fd =3D socket(AF_NETLINK, SOCK_DGRAM, NETLINK_FIREWALL);
    if (fd =3D=3D -1) {
       perror("socket");
       return EXIT_FAILURE;
    }

    /* Bind local end of the socket to the pid of current process */
    memset(&a, 0, sizeof(struct sockaddr_nl));
    a.nl_family =3D AF_NETLINK;
    a.nl_pid =3D getpid();
    a.nl_groups =3D 0;
    if (bind(fd, (struct sockaddr *)&a, sizeof(struct sockaddr_nl)) =3D=3D=
=20
-1) {
       perror("bind");
       return EXIT_FAILURE;
    }

    /* Remote end of the socket is in kernel */
    memset(&a, 0, sizeof(struct sockaddr_nl));
    a.nl_family =3D AF_NETLINK;
    a.nl_pid =3D 0;
    a.nl_groups =3D 0;

    /* Send a mode message to register for packet messages */
    h =3D (struct nlmsghdr *)obuf;
    h->nlmsg_type =3D IPQM_MODE;
    h->nlmsg_len =3D NLMSG_LENGTH(sizeof(struct ipq_mode_msg));
    h->nlmsg_flags =3D 0; /* NLM_F_REQUEST; */
    h->nlmsg_pid =3D getpid();
    h->nlmsg_seq =3D seq++;

    m =3D NLMSG_DATA(h);
    m->value =3D IPQ_COPY_META;
    m->range =3D 0;

    nsent =3D sendto(fd, (void *)obuf, h->nlmsg_len, 0,
            (struct sockaddr *)&a, sizeof(struct sockaddr_nl));
    if (nsent =3D=3D -1) {
       perror("sendto(IPQM_MODE)");
       return EXIT_FAILURE;
    }

    /* we're ready to filter packets */
    signal(SIGINT, sigint);
    while (!done) {
       alen =3D sizeof(struct sockaddr_nl);
       nrecv =3D recvfrom(fd, (void *)ibuf, 128, 0,
               (struct sockaddr *)&ra, &ralen);
       if (nrecv =3D=3D -1) {
          perror("recvfrom(IPQM_PACKET)");
          done =3D 1;
          continue;
       }

       h =3D (struct nlmsghdr *)ibuf;
       p =3D NLMSG_DATA(h);

       strftime(dbuf, 20, "%Y-%m-%d %H:%M:%S",=20
localtime(&p->timestamp_sec));
       printf(
       "-----\n"
       "remote_pid: %d\n"
       "packet_id: %lu\n"
       "mark: %lu\n"
       "timestamp: %s.%06ld\n"
       "hook: %u\n"
       "indev: %s\n"
       "outdev: %s\n"
       "hw_protocol: %u\n"
       "hw_type: %u\n"
       "hw_addrlen: %u\n"
       "hw_addr: %s\n"
       "data_len: %u\n",
       ra.nl_pid,
       p->packet_id, p->mark,
       dbuf, p->timestamp_usec,
       p->hook, p->indev_name, p->outdev_name,
       p->hw_protocol, p->hw_type, p->hw_addrlen, (char *)NULL,
       p->data_len);

       /* Sent ACCEPT verdict message */
       h =3D (struct nlmsghdr *)obuf;
       h->nlmsg_type =3D IPQM_VERDICT;
       h->nlmsg_len =3D NLMSG_LENGTH(sizeof(struct ipq_verdict_msg));
       h->nlmsg_flags =3D 0; /*NLM_F_REQUEST;*/
       h->nlmsg_pid =3D getpid();
       h->nlmsg_seq =3D seq++;

       v =3D (struct ipq_verdict_msg *)NLMSG_DATA(h);
       v->value =3D NF_ACCEPT;
       v->id =3D p->packet_id;

       nsent =3D sendto(fd, (void *)obuf, h->nlmsg_len, 0,
               (struct sockaddr *)&a, sizeof(struct sockaddr_nl));
       if (nsent =3D=3D -1) {
          perror("sendto(IPQM_VERDICT)");
          done =3D 1;
          continue;
       }
    }

    /* Send a mode message to unregister from packet messages */
    h =3D (struct nlmsghdr *)obuf;
    h->nlmsg_type =3D IPQM_MODE;
    h->nlmsg_len =3D NLMSG_LENGTH(sizeof(struct ipq_mode_msg));
    h->nlmsg_flags =3D NLM_F_REQUEST;
    h->nlmsg_pid =3D getpid();
    h->nlmsg_seq =3D seq++;

    m =3D NLMSG_DATA(h);
    m->value =3D IPQ_COPY_NONE;
    m->range =3D 0;

    nsent =3D sendto(fd, (void *)obuf, h->nlmsg_len, 0,
            (struct sockaddr *)&a, sizeof(struct sockaddr_nl));
    if (nsent =3D=3D -1) {
       perror("sendto(IPQM_MODE)");
       return EXIT_FAILURE;
    }

    close(fd);

    return 0;
}

