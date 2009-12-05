From: Ahmed Tarek Megerisi <tarek.megerisi@googlemail.com>
Subject: Libnetfilter_queue: Queue sets up seemingly fine but it doesn't 
	receive packets
Date: Sat, 5 Dec 2009 21:09:33 +0000
Message-ID: <631211bd0912051309i1048947bsa01149cfa47c49b0@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type;
        bh=n7gn39Cu5MqRGMpJdjt5qn5oY+IF6UAXTmmULKDKN3U=;
        b=DG5yHVyBB2BovMtJ8DfsdfnewW3fFuK6iBccMPfu5sWuvEDslboygJzpbHW1DCkcHO
         JMHyApKsXnt+vrnJVGwyB+Yk+26gg4oKS41O5G9i0xPW1mTzeGvRU0N4cchfUjiRbdBe
         4dW5aezvOBrZFM8IfE+/VHHmsLWrdVsCEFJzo=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I'm trying to write a test for libnetfilter_queue, similar to:
nfqnl_test.c, intended to run on an FC11 machine.

Everything seemingly works without error up to the while loop used to
receive packets (line 132). The problem here is that even though I've
fired TCP & UDP packets at the box running the test (some intending to
be dropped, forwarded, accepted in order to make sure I wasn't just
copying from the wrong chain), the callback never seems to get called.

I've tried using your test aswell and I get the same results.
Therefore I'm thinking that this might be an error in understanding on
my part in how the libnetfilter_queue system connects. Do I need to
direct sent packets to a specific port, or use a specific
protocol/include a specific field in the header. Is it possible to see
an example of the type of script used to see if it's working?

Any advice on how libnetfilter_queue connects and how I can connect to
it would be much appreciated,

Kind Regards,

Tarek

P.S: I'm a newcomer in this mailing list so if I overlook any common
etiquettes used here or have phrased my question inappropriately
apologies in advance.

Code:


#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <limits.h>
#include <string.h>
#include <time.h>
#include <netinet/in.h>
#include <netinet/ip.h>
#include <netinet/tcp.h>
#include <netinet/udp.h>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <linux/netfilter_ipv4.h>
#include <linux/netfilter.h>

#include </usr/include/libnfnetlink/libnfnetlink.h>
#include </usr/include/libnetfilter_queue/libnetfilter_queue.h>
#include </usr/include/libnetfilter_queue/libipq.h>

#define BUFFSIZE 2048

time_t time_now;
struct tm* local_time;

struct nfq_handle *h;     /* nfq connection */
struct nfq_q_handle *qh;  /* nfq queue */
struct nfnl_handle *nh;   /* nf netlink connection (ipc) */
struct sockaddr_in address; /*Custom socket for receiving */
/* Each nfq connection has a netlink connection that it uses to get
 * queued packets. */

//Initialise Libnetfilter_queue library
int init()
{
  //Get NFQ Handler IF unsuccessful, result = NULL
  fprintf(stderr, "-- Opening NFQ Handler...\n");

  h = nfq_open();

  if(!h)
  {
	  fprintf(stderr, "-- Error Opening NFQ Handler!");
	  return 1;
  }

  //Un-bind handler from any protocol family that's currently attached
  //IF unsuccessful, result < 0
  fprintf(stderr, "-- Unbinding Handler from existing family...\n");
  if (nfq_unbind_pf(h, AF_INET) < 0)
  {
	fprintf(stderr, "-- Error during NFQ un-binding()\n");
	return 1;
  }

  //Bind handler to IPv4 protocol family
  fprintf(stderr, "-- Binding Handler to IPv4...\n");
  if(nfq_bind_pf(h, AF_INET) < 0)
  {
	  fprintf(stderr, "-- Error during NFQ binding\n");
	  return 1;
  }

  fprintf(stderr, "-- |=========================| --\n");
  fprintf(stderr, "-- | INITIALISATION COMPLETE | --\n");
  fprintf(stderr, "-- |=========================| --\n");
  return 0;
}

int callback(struct nfq_q_handle *qh, struct nfgenmsg *nfmsg, struct
nfq_data *nfad, void *data)
{
  fprintf(stderr, "-- |=========================| --\n");
  fprintf(stderr, "-- |     PACKET RECEIVED     | --\n");
  fprintf(stderr, "-- |=========================| --\n");

  fprintf(stderr, "\n-- Opening Packet Header");
  struct nfqnl_msg_packet_hdr *ph = nfq_get_msg_packet_hdr(nfad);

  fprintf(stderr, "\n-- Packet Header --\n");
  fprintf(stderr, "Packet ID: %d\n", ph->packet_id);
  fprintf(stderr, "Hardware Protocol: %d\n", ph->hw_protocol);
  fprintf(stderr, "Netfilter Hook: %d\n",  ph->hook);
  fprintf(stderr, "------------------------\n");

  int isDropped;
  if ((isDropped = nfq_set_verdict(qh, ph->packet_id, NF_DROP, 0, NULL)) < 0)
  {
    fprintf(stderr, "-- ERR: PACKET NOT DROPPED!!!!!!\n");
  }

  local_time = localtime(&time_now);
  fprintf(stderr, "-- Packet with ID: %d Dropped at %d:%d:%d",
          ph->packet_id,
          local_time->tm_hour,
          local_time->tm_min,
          local_time->tm_sec);
   return 0;
}

int main(int argc, char** argv)
{
 fprintf(stderr, "foo\n");
  int init_lib, fd, rv;
  char buf[BUFFSIZE];

  //initialise library
  fprintf(stderr, "- Initialising Library:, buffsize = %d\n", BUFFSIZE);
  init_lib = init();
  if(init_lib == 1)
  {
	  fprintf(stderr, "Error during initialisation aborting...\n");
	  exit(init_lib);
  }

  qh = nfq_create_queue(h,  0, &callback, NULL);
  if (!qh)
  {
    fprintf(stderr, "-- error creating the queue\n");
    exit(1);
  }

  fprintf(stderr, "- Setting copy packet mode:\n");
  if (nfq_set_mode(qh, NFQNL_COPY_PACKET, BUFFSIZE) < 0)
  {
    fprintf(stderr, "-- can't set packet copy mode\n");
    exit(1);
  }

  //Receive messages
  fprintf(stderr, "- Receiving Messages\n:");
  fd = nfq_fd(h);
  fprintf(stderr, "-- fd = %d\n", fd);
  while ((rv = recv(fd, buf, sizeof(buf), 0)))
  {
    fprintf(stderr, "-- packet received\n");
    nfq_handle_packet(h, buf, rv);
  }

  fprintf(stderr, "-- Unbinding Queue 0 \n");
  nfq_destroy_queue(qh);
  nfq_close(h);
}
