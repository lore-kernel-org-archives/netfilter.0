From: Scott MacKay <scottmackay@yahoo.com>
Subject: Re: libipq and threads, problems, very annoying problem
Date: Tue, 14 Oct 2003 09:47:34 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031014164734.41953.qmail@web13906.mail.yahoo.com>
References: <3F8C1E89.3040008@kom.auc.dk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F8C1E89.3040008@kom.auc.dk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Is there a particular reason why you need to generate
a thread per packet?  Threads can have a moderate
overhead, expecially if you are creating them in the
hundreds (depending on your traffic levels).
If you are just looking to delay, I would suggest
this:

Create a fifo, linked list, or such with 2 structure
elements: a packet buffer (for the ipq_read data) and
a timestamp.  Optional: I believe the packet has a
timestamp marked on it but I have never used that.
in a loop do something like:
while (some loop condition)  {
   get the current time
   if there are 1+ packets queued
       get the timestamp of the 1st packet 
       set 'timeout':subtract first packet time from
now
   else
       'timeout' = 0
   call ipq_read with the timeout
   if we got a packet
       set its time += 100ms
       add it to the end of the queue
   get the current time
   if first packet time - now <= 0
      release packet
} 
Basically, the first packet will always have the
shortest delay.  By setting a timeout, you can exit
the ipq_read and handle a packet due for release
without the need for threads.
Hope it helps!

--- Oumer Teyeb <oumer@kom.auc.dk> wrote:
> I am sorry, but I forgot to mention that I am aware
> that libipq is not 
> thread safe (I read it in one of the message boards,
> don't remember 
> where). Can this problem be attributed to that ? And
> if so is there a 
> way around it? I am kind of stuck with my project
> unless I do this 
> properly, so help is really really appreciated.
> 
> Thanks again
> 
> Oumer Teyeb wrote:
> 
> > Hi,
> >
> > Here is a sample code where I try to delay every
> packet by some time 
> > (in the code I posted here it is fixed to 100
> msec.). Inorder to do 
> > so, I start a pthread for every packet that is
> received by libipq . I 
> > have iptables rules that queues tcp packets that
> are coming and going 
> > to some other machine. I then ftp to that machine.
> The program works, 
> > the problem is with the dumping. I have two files,
> one is supposed to 
> > capture the files when they reach the queue
> (new_file_2) and the other 
> > just before the set verdict is called
> (new_file_3). The new_file_2 
> > works properly. The problem is with new_file_3. I
> couldn't get how, 
> > but somehow, at some location, some erroneous
> entries are put into the 
> > file, the end effect being tcpdump not able to
> recognize the file at 
> > some point. To check, I commented out the only
> line which makes the 
> > two files differ, i.e the one that changes the
> time stamp of the 
> > packet header (as indicated by *********), and the
> two files are not 
> > the same. First I thought maybe one thread was
> writing to the file, 
> > and then another thread becomes active and writes
> also. So I 
> > introduced a mutex_variable that will avoid such
> > problem. But it doesn't help at all. Could you
> please tell me what I 
> > am doing wrong? I have to save the files myself as
> tcpdump get the 
> > packets before the firewall for incoming packets 
> > Thanks in advance,
> > Oumer
> >
> > #include <sys/time.h>
> > #include <linux/netfilter.h>
> > #include <netinet/in.h>
> > #include <libipq.h>
> > #include <pthread.h>
> > #include <unistd.h>
> > #include <signal.h>
> > #include <string.h>
> > #include <stdio.h>
> > #include <stdlib.h>
> > #include "errors.h"
> > #include <mcheck.h>
> >
> > #define BUFSIZE 2048
> >
> > struct ipq_handle *h;
> > ipq_packet_msg_t *m;
> >
> > FILE* new_file_2;
> > FILE* new_file_3;
> >
> > pthread_mutex_t mutex_write;
> >
> > /* char src_mac[6] = {0,0,0xb4,0x4b,0x2c, 0xe1};
> */
> > /* char dst_mac[6] = {0,0xb,0x46, 0x10, 0x57,
> 0x80}; */
> > /* char ether_type[2] = {8,0}; */
> >
> > char src_dst_ether [14] = {0,0,0xb4,0x4b,0x2c,
> 0xe1,0,0xb,0x46, 0x10, 
> > 0x57, 0x80,8,0};
> >
> > //stolen from pcap
> > struct PCAP_file_header {
> >    unsigned int magic;
> >    short major;
> >    short minor;
> >    int thiszone;    /* gmt to local correction */
> >    unsigned int sigfigs;    /* accuracy of
> timestamps */
> >    unsigned int snaplen;    /* max length saved
> portion of each pkt */
> >    unsigned int linktype;    /* data link type
> (LINKTYPE_*) */
> > };
> >
> > struct PCAP_packet_header {
> >    struct timeval ts;    /* time stamp */
> >    int caplen;    /* length of portion present */
> >    int len;    /* length this packet (off wire) */
> > };
> >
> > typedef struct {
> >  int         sleep_time;
> >  ipq_packet_msg_t *packet;
> > //  unsigned char *data;
> >  struct PCAP_packet_header pkt_header;
> >  int thread_id;
> > } params;
> >
> > static void die(struct ipq_handle *h)
> > {
> >        ipq_perror("ipq_error::");
> >        ipq_destroy_handle(h);
> >        exit(1);
> > }
> >
> > void *delay_packet (void *param_packet)
> > {
> >    int status;
> >    params *myparams= (params*) param_packet;
> >    status = pthread_detach (pthread_self ());
> >    if (status != 0)
> >        err_abort (status, "Detach thread");
> >
> >   usleep(100000);
> >   pthread_mutex_lock (&mutex_write);
> >   //  gettimeofday(&(myparams->pkt_header.ts),
> NULL);   
> > ************************
> >   fwrite(&(myparams->pkt_header), sizeof(struct
> PCAP_packet_header),1, 
> > new_file_3);
> >   fwrite(src_dst_ether,1, 14, new_file_3);
> >   fwrite((unsigned int*)(myparams->packet+1), 1, 
> > myparams->packet->data_len, new_file_3);
> >   //free(myparams->packet);
> >   pthread_mutex_unlock (&mutex_write);
> >   status = ipq_set_verdict(h,
> myparams->packet->packet_id,NF_ACCEPT, 
> > 0, NULL);
> >   if (status < 0)
> >      die(h);
> >   free(myparams);
> >   return NULL;
> > }
> >
> > void signal_handler(int sig)
> > {
> >  if (h)
> >    ipq_destroy_handle(h);
> >  fclose(new_file_2);
> >  fclose(new_file_3);
> >  exit(0);
> > }
> >
> > int main(int argc, char **argv)
> > {
> >   mtrace();
> >   int status;
> >   unsigned char buf[BUFSIZE];
> >   int thread_id=0;
> >     new_file_2= fopen("dump_tcp_data.txt", "w+b");
> >   new_file_3 = fopen("dump_tcp_data_after.txt",
> "w+b");
> >     pthread_mutex_init(&mutex_write, NULL);
> >   struct PCAP_file_header *file_header =   (struct
> 
> > PCAP_file_header*)(malloc(sizeof(struct
> PCAP_file_header)));
> >     file_header->magic=0xa1b2c3d4;
> >   file_header->major=2;
> >   file_header->minor=4;
> >   file_header->thiszone=0;
> >   file_header->sigfigs=0;
> >   file_header->snaplen=65535;
> >   file_header->linktype=1;
> >     fwrite(file_header, sizeof(struct
> PCAP_file_header),1, new_file_2);
> >   fwrite(file_header, sizeof(struct
> PCAP_file_header),1, new_file_3);
> >     free(file_header);
> >   pthread_t thread;
> >      h = ipq_create_handle(0, PF_INET);
> >    sigset(SIGINT, signal_handler);
> >    if (!h)
> >                die(h);
> >    status = ipq_set_mode(h, IPQ_COPY_PACKET,
> BUFSIZE);
> >    if (status < 0)
> >      die(h);
> >    printf("PACKET_ID\t\tDATA_LENGTH\tSTATUS\n");
> >    printf("=========\t\t============\t=======\n");
> 
=== message truncated ===


__________________________________
Do you Yahoo!?
The New Yahoo! Shopping - with improved product search
http://shopping.yahoo.com

