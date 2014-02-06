From: =?UTF-8?B?0K7RgNC40Lkg0J/Rg9GF0LDQu9GM0YHQutC40Lk=?= 
	<aikipooh@gmail.com>
Subject: NFQUEUE performance
Date: Thu, 6 Feb 2014 15:56:37 +0400
Message-ID: <CAKws=GTf+cuCBMTcD7ys5-2wHc6_2=pP7S48-gC+MCLC_QDbAA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=MmedsQgd8L4aZ4p+pA81tmCh72/mTIWxYLlyE0GTLxI=;
        b=vclAolon/TxHWgg4IOFin9d1J6GSU95U4JN53wJJXWzE7JyQbhEa1/oXM0iDxaqzLQ
         sBMUTk+UeNKL3jN6x4CSsSXEzf3adqN1RFcdQ8dbNybjf7bIOVbF+HGUraMzQckXFeyq
         KfDiAxy0QfvXjxXIGMTo59hu1Hi2rVkYo+dlGMBJVpKjGZRh0WRXgaI/7vCVmQfr6vWu
         7yJtdARdMKdRxeuF+yT7jfHaZnrZZpNasDQeGO5OGWewKY/9DKp+o4ki0xLhj7uCHAGY
         FpN9chM6YgBPFOI90Sf4sdPhO76LnYXHxIwp1x3NAWS541unvIhgIx7E4jhOSAGVWBOR
         2x7w==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: netfilter@vger.kernel.org

I don't know if it is the right list to post to, as my previous
message got no answers. But well=E2=80=A6

I use libnetfilter_queue in the program to filter traffic, I've
started with nfq_test example. But the throughput has degraded by more
than half comparing to the same box's performance when acting as a
simple router. The CPU is loaded by 50%. So I've read about
multithreaded approach.
Here's what I've ended with.

---------nfq_test.c-----------------------------------
#include <stdio.h>
#include <netinet/in.h>
#include <linux/netfilter.h>            /* for NF_ACCEPT */
#include <stdlib.h>
#include <libnetfilter_queue/libnetfilter_queue.h>

//#define printf

static int
cb(struct nfq_q_handle *qh, struct nfgenmsg *nfmsg, struct nfq_data *tb=
,
   void *data)
{
  struct nfqnl_msg_packet_hdr *ph =3D nfq_get_msg_packet_hdr(tb);
  u_int32_t id =3D ph ? ntohl(ph->packet_id) : 0;
  unsigned char *payload;
  int ret;

  ret =3D nfq_get_payload(tb, &payload);
  if(ret<0) {
    printf("failed to get payload\n");
  }
  return nfq_set_verdict(qh, id, NF_ACCEPT, ret, payload);
}

void *worker( void *arg )
{
  struct nfq_handle *h =3D (struct nfq_handle*)arg;
  int fd =3D nfq_fd(h);
  int count=3D0;

  while(1) {
    unsigned char buf[4096] __attribute__ ((aligned));
    ssize_t len=3Drecv( fd, buf, sizeof(buf), 0 );

    if(len>=3D0)
      nfq_handle_packet(h, (char*)buf, len);
    else
      printf("Thread with fd=3D%d: error\n", fd);

    count++;
    if(count=3D=3D1000) {
      printf("Thread with fd=3D%d got %d packets\n", fd, count);
      count=3D0;
    }
  }
}

#define NUM_THREADS 10

int main(int argc, char **argv)
{
  struct nfq_handle *h[NUM_THREADS];
  struct nfq_q_handle *qh[NUM_THREADS];
  int i;
  int num_thr=3D1;

  if(argc>1) num_thr=3Datoi(argv[1]);

  for(i=3D0;i<num_thr;i++) {
    pthread_t thr;

    if(!(h[i]=3Dnfq_open())) {
      fprintf(stderr, "error during nfq_open()\n");
      exit(1);
    }

    if(nfq_unbind_pf(h[i], AF_INET) < 0) {
      fprintf(stderr, "error during nfq_unbind_pf()\n");
      exit(1);
    }
    if(nfq_bind_pf(h[i], AF_INET) < 0) {
      fprintf(stderr, "error during nfq_bind_pf()\n");
      exit(1);
    }

    printf("binding to queue '%d'\n", i);

    if(!(qh[i]=3Dnfq_create_queue(h[i], i, &cb, NULL))) {
      fprintf(stderr, "error during nfq_create_queue()\n");
      exit(1);
    }

    if(nfq_set_mode(qh[i], NFQNL_COPY_PACKET, 0xffff) < 0) {
      fprintf(stderr, "can't set packet_copy mode\n");
      exit(1);
    }
    if(pthread_create( &thr, NULL, worker, h[i] )) {
      fprintf(stderr, "pthread_create() failed\n");
      exit(1);
    }
  }
  sleep(10000);

  exit(0);
}
----------------------------------------
The iptables setup is:

Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination
ACCEPT     tcp  --  192.168.3.1          0.0.0.0/0            tcp dpt:2=
2
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0            tcp spt:2=
2
NFQUEUE    tcp  --  0.0.0.0/0            0.0.0.0/0            NFQUEUE
balance 0:2

Chain INPUT (policy ACCEPT)
target     prot opt source               destination

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination
ACCEPT     tcp  --  0.0.0.0/0            0.0.0.0/0            tcp spt:2=
2
NFQUEUE    tcp  --  0.0.0.0/0            0.0.0.0/0            NFQUEUE
balance 0:2

-------------------------------------------
I start "nfq_test 3" to get three threads serving queues 0,1 and 2,
but As I see from the output, only one thread gets all the packets.
I test by downloading the 60M file with wget, from local machine (the
one nfq_test is working on) or from another (windows), but it's always
one queue working. Sometimes I saw other threads popping up (because
windows had some underground activity, downloading updates or
whatever), but I couldn't reproduce that. I've tried two wgets in
parallel to get different source ports, and tried to connect to
different servers, it was always one queue working.

Is the program wrong? Or is there some problem with fanout? I use
3.13-rc4 whatever that means, that's custom branch for the
olinuxino-a13 I use.

--=20
Point of presence: http://aikipooh.ipernity.com
