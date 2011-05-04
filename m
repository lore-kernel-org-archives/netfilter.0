From: nowhere <nowhere@hakkenden.ath.cx>
Subject: libnetfilter_queue question
Date: Wed, 04 May 2011 10:14:18 +0400
Message-ID: <1304489658.32272.19.camel@compot-mob>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-3KXy0mI730kzZBuCpmwf"
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org


--=-3KXy0mI730kzZBuCpmwf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hello, dear list,

I'm now experimenting with subj, and have a problem which I can not
solve.

There is a simple application, which do the following:

1. Register a queue (or several queues)
2. Reads metadata from nfqueue in a cycle
3. Spreads it into multiple software queues, one queue per nfqueue
4. Worker threads apply some delay according to distribution law
5. Worker threads accept packets, which (if I understand correctly)
still reside in kernel netfilter queue

I have done all the steps to allow for larger kernel queues:
  - sysctl net.core.{r,w}mem{_max,}=16M
  - tc qdisc add dev eth0 root pfifo limit 20000

So I with all these I see no drops on interfaces, interface queue or
netfilter queue (in /proc/net/netfilter/nfnetlink_queue)

Then I do the following to test the setup:
iptables -t mangle -A POSTROUTING -p icmp -d 10.77.130.72 -j NFQUEUE
--queue-num 1

and then start ping. If i do normal ping, everything works like expected

$ping 10.77.130.72
PING 10.77.130.72 (10.77.130.72) 56(84) bytes of data.
64 bytes from 10.77.130.72: icmp_req=1 ttl=64 time=97.0 ms
64 bytes from 10.77.130.72: icmp_req=2 ttl=64 time=97.1 ms
64 bytes from 10.77.130.72: icmp_req=3 ttl=64 time=97.6 ms
64 bytes from 10.77.130.72: icmp_req=4 ttl=64 time=93.6 ms
64 bytes from 10.77.130.72: icmp_req=5 ttl=64 time=101 ms
64 bytes from 10.77.130.72: icmp_req=6 ttl=64 time=94.8 ms

Packets are passed to the target host, delay is applied. Stats from
application and fro iptables counters show consistent figures.

But when I issue flood ping I see this:
$ sudo ping 10.77.130.72 -i0
PING 10.77.130.72 (10.77.130.72) 56(84) bytes of data.
64 bytes from 10.77.130.72: icmp_req=1 ttl=64 time=111 ms
64 bytes from 10.77.130.72: icmp_req=8 ttl=64 time=118 ms
64 bytes from 10.77.130.72: icmp_req=9 ttl=64 time=114 ms
64 bytes from 10.77.130.72: icmp_req=10 ttl=64 time=104 ms
64 bytes from 10.77.130.72: icmp_req=11 ttl=64 time=93.5 ms
64 bytes from 10.77.130.72: icmp_req=12 ttl=64 time=93.9 ms
64 bytes from 10.77.130.72: icmp_req=13 ttl=64 time=94.3 ms
64 bytes from 10.77.130.72: icmp_req=14 ttl=64 time=101 ms
64 bytes from 10.77.130.72: icmp_req=15 ttl=64 time=96.8 ms

There are 7 packets dropped at the beginning. I see same results when
testing with iperf. Several packets at the beginning get lost.
iptables counters show, that NFQUEUE rule has processed all the packets
(15 in this example), app debug output shows 15 processed packets,
nfqueue stat show no drops, tc -s -d qdisc show dev eth0 shows no drops
in the interface queue. But tcpdump has caught only 9 packets on remote
and on local hosts.

There is app's source code here. Maybe, I'm doing something wrong in it?

Thanks

--=-3KXy0mI730kzZBuCpmwf
Content-Disposition: attachment; filename="main.c"
Content-Type: text/x-csrc; name="main.c"; charset="UTF-8"
Content-Transfer-Encoding: 7bit

#include <libnetfilter_queue/libnetfilter_queue.h>

#include <netinet/in.h>
#include <linux/netfilter.h>

#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <string.h>

#include <sys/socket.h>
#include <arpa/inet.h>

#include <sys/time.h>
#include <time.h>

#include <math.h>

#include <pthread.h>
#include <sys/queue.h>

#define QUEUE_NUM	2

#define BL 		65536

struct queued_pkt {
  char *qp_payload;
  int qp_pktlen;
  int qp_id;
  struct timeval qp_recv;
  STAILQ_ENTRY(queued_pkt) entries;
};

struct queue_data {
  struct nfq_q_handle* q_handle;
  int q_id;
  pthread_t q_thread;
  pthread_mutex_t q_mutex;
  pthread_cond_t q_condvar;
  int q_delay;
  int q_jitter;
  double q_mu;
  double q_sigma;
  double q_xsi;
  STAILQ_HEAD(,queued_pkt) q_head;
};

void* worker_thread (void*);

int callback (struct nfq_q_handle*,
              struct nfgenmsg*,
	      struct nfq_data*, void*);

int main() {
  int rv, fd, i;
  struct nfq_handle *h;

  struct queue_data *queues, *q;
  char *buf;

  queues = (struct queue_data*) calloc (QUEUE_NUM, sizeof (struct queue_data));
  buf = (char*) malloc (BL);

  
  if (!(h = nfq_open())) {
    perror ("open handle");
    exit (1);
  }

  if (nfq_unbind_pf (h, AF_INET) < 0) {
    perror ("unbind NFQUEUE");
    nfq_close (h);
    exit (1);
  }

  if (nfq_bind_pf (h, AF_INET) < 0) {
    perror ("bind nfnetlink");
    nfq_close (h);
    exit (1);
  }

  for (i=0; i<QUEUE_NUM; i++) {

    q = queues + i;
    STAILQ_INIT (&(q->q_head));

    q->q_id = i;
    pthread_mutex_init (&(q->q_mutex), NULL);
    pthread_cond_init (&(q->q_condvar), NULL);

    q->q_xsi = .25;
    q->q_delay = 100;
    q->q_jitter = 10;
    q->q_sigma = ((double) q->q_jitter / 1000.) * (1. - q->q_xsi) * sqrt (1. - 2. * q->q_xsi);
    q->q_mu = ((double) q->q_delay / 1000.) - q->q_sigma / (1. - q->q_xsi);

    fprintf (stderr, "Queue %d: xsi %.3f, sigma %.3f, mu %.3f\n", i, q->q_xsi, q->q_sigma, q->q_mu);

    if (!(q->q_handle = nfq_create_queue (h, i, &callback, q))) {
      perror ("create queue");
      nfq_close (h);
      exit (1);
    }

    if (nfq_set_mode (q->q_handle, NFQNL_COPY_META, 0) < 0) {
      perror ("set mode");
      nfq_destroy_queue (q->q_handle);
      nfq_close (h);
      exit (1);
    }

    nfq_set_queue_maxlen (q->q_handle, 20240);
    pthread_create (&(q->q_thread), NULL, &worker_thread, (void*) q);

  }
  
  fd = nfq_fd (h);
  
  while (1) {
    
    rv = recv (fd, buf, BL, MSG_TRUNC);
    if (rv < 0 && errno == EINTR) continue;
    if (rv > BL) {
      fprintf (stderr, "No space\n");
      continue;
    }

    nfq_handle_packet (h, buf, rv);

  }

  //nfq_destroy_queue (qh);
  //nfq_unbind_pf (h, AF_INET);
  nfq_close (h);
  free (buf);
  return 0;
}

int callback (struct nfq_q_handle *qh,
	      struct nfgenmsg *nfmsg,
	      struct nfq_data *nfad, void *data) {
   
   struct queue_data *queue = (struct queue_data*) data;
   struct queued_pkt *pkt;
   char *pl;
   struct nfqnl_msg_packet_hdr *ph;
   
   pkt = (struct queued_pkt*) calloc (1, sizeof (struct queued_pkt));

   if (!(ph = nfq_get_msg_packet_hdr (nfad))) {
       perror ("get hdr");
       return 0;
   }

   pkt->qp_id = htonl (ph->packet_id);
   
   gettimeofday (&pkt->qp_recv, NULL);
/*   if ((pkt->qp_pktlen = nfq_get_payload (nfad, &pl)) > 0) {
     pkt->qp_payload = (char*) malloc (pkt->qp_pktlen);
     memcpy (pkt->qp_payload, pl, pkt->qp_pktlen);
   }*/

   pthread_mutex_lock (&(queue->q_mutex));
   STAILQ_INSERT_TAIL (&(queue->q_head), pkt, entries);
   pthread_cond_signal (&(queue->q_condvar));
   pthread_mutex_unlock (&(queue->q_mutex));
   return 0;
}


void* worker_thread (void *data) {
   struct queue_data *queue = (struct queue_data*) data;
   struct queued_pkt *pkt;

   struct timeval cur_time;
   struct timespec deq_time;
   double real_delay;

   double cur_ts, deq_ts, recv_ts;

   char *buf;

   while (1) {
     pthread_mutex_lock (&(queue->q_mutex));

     while (STAILQ_EMPTY (&(queue->q_head)))
       pthread_cond_wait (&(queue->q_condvar), &(queue->q_mutex));

     /* Dequeue packet */
     pkt = STAILQ_FIRST (&(queue->q_head));

     STAILQ_REMOVE_HEAD (&(queue->q_head), entries);
     pthread_mutex_unlock (&(queue->q_mutex));

     real_delay = queue->q_mu + queue->q_sigma * (pow ((double) (random()) / (double) RAND_MAX, -1. * queue->q_xsi) - 1.) / 
     					queue->q_xsi;

     //real_delay = 100e-3;

     recv_ts = (double) pkt->qp_recv.tv_sec + (double) pkt->qp_recv.tv_usec / 1000000.;
     deq_ts = recv_ts + real_delay;

     gettimeofday (&cur_time, NULL);
     cur_ts = (double) cur_time.tv_sec + (double) cur_time.tv_usec / 1000000.;

     real_delay = deq_ts - cur_ts;
       printf ("Queue %d Packet ID %d, REC (%d, %d) delay %.3fus\n", queue->q_id, pkt->qp_id, 
                 pkt->qp_recv.tv_sec, pkt->qp_recv.tv_usec, real_delay * 1000000.);
     if (real_delay > 0) {
       deq_time.tv_sec = real_delay;
       deq_time.tv_nsec = (real_delay - deq_time.tv_sec) * 1000000000; 

       nanosleep (&deq_time, NULL);
     }

     if (pkt->qp_pktlen) {
       nfq_set_verdict (queue->q_handle, pkt->qp_id, NF_ACCEPT, pkt->qp_pktlen, pkt->qp_payload);
       free (pkt->qp_payload);
     } else
       nfq_set_verdict (queue->q_handle, pkt->qp_id, NF_ACCEPT, 0, NULL);

     free (pkt);
   }

   return 0;
}

--=-3KXy0mI730kzZBuCpmwf--

