From: =?iso-8859-1?q?james=20jacob?= <jamesjacob2003@yahoo.co.in>
Subject: my firewall is not working
Date: Fri, 15 Nov 2002 14:10:33 +0000 (GMT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021115141033.48015.qmail@web8202.mail.in.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="0-989538100-1037369433=:47562"
Content-Transfer-Encoding: 8bit
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
To: netfilter@lists.netfilter.org

--0-989538100-1037369433=:47562
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit


I have problem with firewall built using netfilter.can any one please help me detect the problem.

In libipq ipq_read is not working

I have the following files firewall.c, libipq.c , nf_queue.c

I complied and ran on Red hat linux 2.4.2

I compiled as root user

I did the following

gcc firewall.c libipq.c

insmod ip_queue.o

insmod nf_queue.o

./a.out

The ipq  handle is created  but never packets are recieved in userspaceand they are never stripped ,no stripped information and no tatistics.I ping from a different host and they are dropped but no stripped information.while setting rules i set icmpto discard and the host ip address in black list.

so i enclose the the following files.any plese help me to detect the problem

 

 

 

// firewall.c

#include <stdio.h>

#include <stdlib.h>

#include "libipq.h"

#include <linux/netfilter.h>

#include <sys/socket.h>

#include <sys/un.h>

#include <signal.h>

#include <linux/ip.h>

#include <linux/tcp.h>

#include <linux/icmp.h>

 

#define VALID 1

#define INVALID 0

#define ERROR 0

#define DROP 0

#define TEST 1

#define ACCEPT 1

#define IPQ_BUF_SIZE 65536

#define INTERNAL -1

#define EXTERNAL 1

#define IN 0

#define OUT 1

#define MATCH 1

#define NOMATCH -1

#define TIMEOUT 10

#define CheckProtocol(P) (PList[(P)])

/*************************************************/

/*Structure Declarations*/

/*************************************************/

/*struct bNode is a node in the black list */

typedef struct bNode

{

int ipAdd[4];

struct bNode *Next;

}bNodetype;

/*struct bHead is the head of the black list */

typedef struct bHead

{

int num;

struct bNode *Next;

} bHeadtype;

static struct ipq_handle *qh;

/*struct cNode is a node in the communication list */

typedef struct cNode

{

int ipSour[4];

int ipDest[4];

int time;

struct cNode *Next;

}cNodetype;

/*struct cHead is the head of the communication list */

typedef struct cHead

{

int num;

cNodetype *Next;

}cHeadtype;

bHeadtype bList;

cHeadtype cList;

int packetnum;

int quit;

int PList[256];

int portlist[256];

int sour[4];

int dest[4];

int oneway = 1;/*Flag for one way communication*/

int time_out = 10;

struct iphdr *ip;

struct tcphdr *tcp;

double accep=0;

double drop=0;

/*************************************************/

/*Function Prototype */

/*************************************************/

int strip_packet(unsigned char *packet);

int verify_packet(int interface,int Source[],int Dest[],int time,int ptype);

int check_proto(int type);

int check_port();

int check_bList(int ip);

int check_cList(int ipIn[],int ipEx[],int time);

int add_cList(int ipIn[],int ipEx[],int time);

int init_PList();

static void sig_handler(int);

/*************************************************/

/*int init_PList() */

/*Purpose: Initialize Protocol array to VALID, */

/* thus all protocols are set to pass. */

/*Parameters: none */

/* */

/*************************************************/

int init_PList()

{

int i,j;

/*the ip header field for protocol is */

/*only 8 bits, so the maximum number of */

/*protocols is 256. */

for(i=0;i<256;i++)

{

PList[i]=VALID;

}

return(0);

}

/*end init_PList()*/

/*************************************************/

/*int strip_packet(unsigned char *packet */

/*Purpose: strips the packet of source, dest, */

/* protocol, timestamp, and interface */

/*Parameters: packet - a char pointer to a */

/* structure that has a ptr */

/* to the raw packet */

int strip_packet(unsigned char *packet)

{

ipq_packet_msg_t *pk;

int i;

int retip,rettcp;

int ptype;

int interface;

int time;

/*cast the ptr to the structure*/

pk = (ipq_packet_msg_t *) packet;

/*pull data from the struct*/

ptype = (int)pk->payload[9];

time = (int)pk->timestamp_sec;

/*get source and dest ip addresses*/

for(i=0;i<4;i++)

{

sour[i]=pk->payload[i+12];

dest[i]=pk->payload[i+16];

}

/*determine which interface the*/

/*packet arrived on*/

printf("The data length of packet is %d\n",(pk->payload[0]));

printf(" The packet lenght is %d",pk->payload[2]);

ip=(struct iphdr*)pk->payload;

printf("source addr= %ld",ip->saddr);

printf("%d\n",pk->payload[3]);

if(pk->indev_name[3] == 0)

{

interface = EXTERNAL;

}

else if(pk->indev_name[3] == 1)

{

interface = INTERNAL;

}

else

{

printf("Cannot determine interface the packet arrived on, exiting\n");

return(ERROR);

}

 

/*call verify_packet*/

retip = verify_packet(interface,sour,dest,time,ptype);

rettcp= verifytcp();

if (ip->protocol == 6)

{

tcp = (struct tcphdr*)((__u32 *)ip+ip->ihl);

rettcp=verifytcp();

}

if(retip==DROP||rettcp==DROP)

{

printf("Drop\n");

if(TEST)

{

printf("STATUS : DROP \n\n\n");

}

ipq_set_verdict(qh, pk->packet_id, NF_DROP, pk->data_len,pk->payload);

drop++;

}

else

{

printf("accept\n");

if(TEST)

{

printf("STATUS : ACCEPT \n\n\n");

}

ipq_set_verdict(qh, pk->packet_id, NF_ACCEPT, pk->data_len,pk->payload);

accep++;

}

return 1;

}

 

 

/*************************************************/

int check_proto(int type)

{

int ret;

ret = PList[type];

if(TEST)

{

printf(" check_proto:type %d\n",type);

printf(" check_proto:ret %d\n",ret);

}

return(ret);

}

/*************************************************/

/*int check_bList() */

/*Purpose: compares a ip address to the blacklist*/

/*Parameters: ip[] - an array containing the four*/

/* fields in an ip address */

/*************************************************/

int check_blist(int ip[])

{

int i,j,match,found;

bNodetype *temp;

temp = bList.Next;

found = 0;

for(i=0;i<bList.num;i++)

{

match = 1;

for(j=0;((j<4) && (match==1));j++)

{

if(temp->ipAdd[j]!=ip[j])

{

match = 0;

}

else if(j==3)

{

found = 1;

}

 

}

}

if(TEST)

{

printf(" check_blist:PASS\n");

}

return(ACCEPT);

}

/************************************************/

/*int init() */

/*Purpose: to initilize to start of the program */

/* to control setting default values */

/*Parameters: none */

/************************************************/

int init()

{

if(TEST)

{

printf("INITALIZATION\n");

}

init_PList();

bList.num=0;

cList.num=0;

packetnum=0;

if(TEST)

{

printf("initiaizationover\n");

}

return(0);

}

 

/*************************************************/

/*int check_com() */

/*Purpose: To check a list for matching source */

/* and destination addresses */

/*Parameters:Source[] - source ip */

/* Dest[] - destination address */

/* time - the timestamp of the packet */

/* type - incoming or outgoing(the */

/* interface on which the packet*/

/* entered the system */

/*************************************************/

int check_com(int Source[],int Dest[],int time,int type)

{

int i,j;

int match,found;

cNodetype *temp=cList.Next;

for(i=0;i<cList.num;i++)

{

for(j=0;j<4&&match;j++)

{

if((temp->ipSour[j]==Source[j])&&(temp->ipDest[j]==Dest[j]))

{

if(j==3)

{

found = 1;

}

}

else

{

match = 0;

}

}

if(match)

{

if(type == INTERNAL)

{

temp->time = time;

if(TEST)

{

printf(" checkcom: UPDATETIMEVALID\n");

}

return(VALID);

}

else

{

if((time - temp->time)<time_out)

{

if(TEST)

{

printf(" check_com VALID\n");

}

return(VALID);

}

else

{

if(TEST)

{

printf(" check_com: INVALID\n");

}

return(INVALID);

}

}

}

}

}

 

 

/*************************************************/

/*int add_b(int ip[]) */

/*Purpose: add a ip address to the blacklist */

/*Parameters: ip[] - the ip address to add */

/*************************************************/

int add_b(int ip[])

{

int i;

bNodetype *temp;

temp = bList.Next;

bList.Next = malloc(sizeof(bNodetype));

for(i=0;i<4;i++)

{

bList.Next->ipAdd[i]=ip[i];

}

bList.Next->Next=temp;

bList.num = bList.num + 1;

return(0);

}

/*************************************************/

/*int add_com(int Source[],int Dest[], int time) */

/*Purpose: add a connection to the comlist */

/*Parameters: Source[] - the sourceip address to*/

/* Dest[] - the destination address */

/* time - the timestamp of the packet */

/*************************************************/

int add_com(int Source[],int Dest[],int time)

{

int i;

cNodetype *temp;

temp = cList.Next;

cList.Next = malloc(sizeof(cNodetype));

for(i=0;i<4;i++)

{

cList.Next->ipSour[i]=Source[i];

cList.Next->ipDest[i]=Dest[i];

}

cList.Next->time=time;

return 1;

}

/*int verify(int Source[],int Dest[], int time) */

/*Purpose: goes through the tests */

/*Parameters: Source[] - the sourceip address to*/

/* Dest[] - the destination address */

/* time - the timestamp of the packet */

/*************************************************/

int verify_packet(int interface,int Source[],int Dest[],int time,int ptype)

{

if(TEST)

{

printf(" verify_packet: Verifying Packet\n");

printf(" verify_packet: Interface %d\n",interface);

printf(" verify_packet: Source IP %d.%d.%d.%d\n",Source[0],Source[1],Source[2],Source[3]);

printf(" verify_packet: Dest IP %d.%d.%d.%d\n",Dest[0],Dest[1],Dest[2],Dest[3]);

printf(" verify_packet: Type %d\n",ptype);

printf(" verify_packet: Time Stamp %d\n\n",time);

}

if(check_proto(ptype)==INVALID)

{

if(TEST)

{

printf("verify_packet:return INVALID\n");

}

return(DROP);

}

switch(interface)

{

case EXTERNAL:

if(TEST)

{

printf("EXTERNAL");

}

if(check_blist(Source)==DROP)

{

return(DROP);

}

if(oneway)

{

if(check_com(Source,Dest,time,interface)==VALID)

{

add_com(Dest,Source,time); 

}

}

return(ACCEPT);

break;

case INTERNAL:

if(TEST)

{

printf("INTERNAL\n");

}

if(check_blist(Dest)==DROP)

{

printf("Blacklist\n");

return(DROP);

}

if(oneway){

 

if(check_com(Dest,Source,time,interface)==INVALID)

{

add_com(Dest,Source,time);

}

}

return(ACCEPT);

break;

default:

return(ERROR);

break;

}//end switch

return(0);

}

 

/*************************************************/

/*run() */

/*Purpose: sets the connection to ip_queue */

/* and listens for a packet */

/*Parameters.

*/

/*************************************************/

int run()

{

int i,rval;

ssize_t len;

unsigned char *buf;

int error;

/*Create Handle and Error Check*/

qh=NULL;

if((qh=ipq_create_handle(0))==NULL)

{

//error=100;

printf("Could not create IPQ Handle, Exiting\n");

exit(2);

}

rval = ipq_set_mode(qh, IPQ_COPY_PACKET, 0);

if(rval<0)

{

ipq_destroy_handle(qh);

exit(1);

}

if(qh)

printf("Created IPQ Handle\n");

buf = (char *) malloc(IPQ_BUF_SIZE);

quit=1;

while(quit)

{

int ptype,error;

unsigned char *packet;

len = ipq_read(qh, buf, IPQ_BUF_SIZE, 0);

if (len < 0)

{

printf("Nothing\n");

break;

} else if (len == 0) {

printf("timeout exceeded\n");

} else {

printf("got a packet\n");

ptype = ipq_message_type(buf);

packet = (unsigned char *)ipq_get_packet(buf);

printf("the packet type is %d",ptype);

switch (ptype)

{

case NLMSG_ERROR:

printf("NLMSG_ERROR: %d\n", error);

exit(3);

break;

case IPQM_PACKET:

strip_packet(packet);

break;

}

}

}

ipq_destroy_handle(qh);

printf("exit from run\n");

}

/*************************************************/

/*int setoptions() */

/*Purpose: allows the user to enter options */

/* */

/* */

/* */

/* */

/*************************************************/

int setoptions()

{

int prot,port;

int i,ip[4];

printf("PROTOCOL:do you want to mark any protocol as invalid? 1 to enter or 0 to skip\n");

scanf("%d",&i);

while(i)

{

printf("PROTOCOL:enter protocol number which is to be marked invalid\n");

scanf("%d",&prot);

PList[prot]=INVALID;

printf("PROTOCOL: ANOTHER PROTOCOL? 1 to enter, 0 to skip\n");

scanf("%d",&i);

}

port=0;

printf("PORT:do you want to deny access to particular ports? 1 to enter or 0 to skip\n");

scanf("%d",&i);

while(i)

{

printf("PROTOCOL:enter port number to which externel access is to be denied:");

scanf("%d",&prot);

portlist[port]=prot;

port++;

printf("PORT: ANOTHER PORT? 1 to enter, 0 to skip\n");

scanf("%d",&i);

}

i = 1;

while(i)

{

printf("BLACKLIST: Enter 1 to enter ip or 0 to skip\n");

scanf("%d",&i);

if(i==1)

{

printf("ENTER IP ADDRESS\n\n");

scanf("%d.%d.%d.%d",&ip[0],&ip[1],&ip[2],&ip[3]);

add_b(ip);

}

}

printf("ONEWAY COM: To turn off one way communication type 0 otherwise enter 1\n");

scanf("%d",&oneway);

if(oneway!=0)

{

oneway = 1;

printf("Enter timeout value (seconds)\n");

scanf("%d",&time_out);

}

return(0);

}

 

empty_b()

{

int i;

bNodetype *temp;

bNodetype *next;

temp = bList.Next;

next = temp ->Next;

for(i = 0; i < bList.num; i++)

{

free(temp);

temp = next;

if(i<bList.num-1)

{

next = temp->Next;

}

}

}

 

int main()

{

int ret;

printf("**********************************\n");

printf(" LINUX FIREWALL \n");

printf("**********************************\n); 

signal (SIGINT,sig_handler);

while(1)

{

init();

setoptions();

printf("call run\n");

run();

}

exit(0);

}

static void sig_handler(int sig)

{

int i;

printf("ENTER 1 to Revise table, enter 0 to quit\n");

scanf("%d",&i);

if(i==0)

{

printf("****************** linux firewall statistics*********************\n");

printf("Number of packets received = %lf\n",accep+drop);

printf("Number of packets dropped = %lf\n",drop);

printf("Number of packets accepted = %lf\n",accep);

printf("Attack probability ratio = %lf\n",drop/(drop+accep));

printf("***************************************************************\n");

_exit(sig);

}

else

{

quit=0;

}

}

int verifytcp()

{

int i;

printf(" verify_packet: Packet has TCP payload\n");

printf(" verify_packet: The Source port is: %d\n",ntohs(tcp->source));

printf(" verify_packet: The Destination port is: %d\n",ntohs(tcp->dest));

if(check_port(ntohs(tcp->dest)) )

{

printf(" verify_packet: Access to port %d denied for packet\n",ntohs(tcp->dest));

printf("Access to port %d denied for packet\n",ntohs(tcp->dest));

return(DROP);

}

/* drops Xmas || Ymax */

if (tcp->res1 != 0)

return(DROP);

/* drops SYN without ACK but with others flags set */

if ((tcp->syn && !tcp->ack)

&& (tcp->fin || tcp->rst || tcp->psh || tcp->urg))

return(DROP);

/* drops SYN/ACK with RST and/or FIN set */

if ((tcp->syn && tcp->ack) && (tcp->fin || tcp->rst))

return(DROP);

/* drops TCP packets with no-sense flags (or without flags set) */

if (!tcp->fin && !tcp->syn && !tcp->rst && !tcp->ack)

return(DROP);

printf(" verify_packet: The packet passed TCP sanity check\n");

printf("The packet passed TCP sanity check\n");

return(ACCEPT);

}

int check_port(int port)

{

int i;

for(i=0;i<=255;i++)

if(port==portlist[i])

return (1);

return (0);

}

 

 

 

 

 

 

 

 

 

/*

* libipq.h

*

* IPQ library for userspace.

*

* Author: James Morris <jmorris@intercode.com.au>

*

* Copyright (c) 2000-2001 Netfilter Core Team

*

* This program is free software; you can redistribute it and/or modify

* it under the terms of the GNU General Public License as published by

* the Free Software Foundation; either version 2 of the License, or

* (at your option) any later version.

*

* This program is distributed in the hope that it will be useful,

* but WITHOUT ANY WARRANTY; without even the implied warranty of

* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the

* GNU General Public License for more details.

*

*/

#ifndef _LIBIPQ_H

#define _LIBIPQ_H

#include <errno.h>

#include <unistd.h>

#include <fcntl.h>

#include <sys/types.h>

#include <sys/socket.h>

#include <sys/uio.h>

#include <asm/types.h>

#include <linux/netlink.h>

#ifdef KERNEL_64_USERSPACE_32

#include "ip_queue_64.h"

typedef u_int64_t ipq_id_t;

#else

#include <linux/netfilter_ipv4/ip_queue.h>

typedef u_int32_t ipq_id_t;

#endif

#ifdef DEBUG_LIBIPQ

#include <stdio.h>

#define LDEBUG(x...) fprintf(stderr, ## x)

#else

#define LDEBUG(x...)

#endif /* DEBUG_LIBIPQ */

/* FIXME: glibc sucks */

#ifndef MSG_TRUNC

#define MSG_TRUNC 0x20

#endif

struct ipq_handle

{

int fd;

u_int8_t blocking;

struct sockaddr_nl local;

struct sockaddr_nl peer;

};

struct ipq_handle *ipq_create_handle(u_int32_t flags);

int ipq_destroy_handle(struct ipq_handle *h);

ssize_t ipq_read(const struct ipq_handle *h,

unsigned char *buf, size_t len, int timeout);

int ipq_set_mode(const struct ipq_handle *h, u_int8_t mode, size_t len);

ipq_packet_msg_t *ipq_get_packet(const unsigned char *buf);

int ipq_message_type(const unsigned char *buf);

int ipq_get_msgerr(const unsigned char *buf);

int ipq_set_verdict(const struct ipq_handle *h,

ipq_id_t id,

unsigned int verdict,

size_t data_len,

unsigned char *buf);

int ipq_ctl(const struct ipq_handle *h, int request, ...);

char *ipq_errstr(void);

void ipq_perror(const char *s);

#endif /* _LIBIPQ_H */

 

 

 

 

 

//libipq.c

#include <stdlib.h>

#include <stdio.h>

#include <string.h>

#include <unistd.h>

#include "libipq.h"

/****************************************************************************

*

* Private interface

*

****************************************************************************/

enum {

IPQ_ERR_NONE = 0,

IPQ_ERR_IMPL,

IPQ_ERR_HANDLE,

IPQ_ERR_SOCKET,

IPQ_ERR_BIND,

IPQ_ERR_BUFFER,

IPQ_ERR_RECV,

IPQ_ERR_NLEOF,

IPQ_ERR_ADDRLEN,

IPQ_ERR_STRUNC,

IPQ_ERR_RTRUNC,

IPQ_ERR_NLRECV,

IPQ_ERR_SEND,

IPQ_ERR_SUPP,

IPQ_ERR_RECVBUF

};

#define IPQ_MAXERR IPQ_ERR_RECVBUF

struct ipq_errmap_t {

int errcode;

char *message;

} ipq_errmap[] = {

{ IPQ_ERR_NONE, "Unknown error" },

{ IPQ_ERR_IMPL, "Implementation error" },

{ IPQ_ERR_HANDLE, "Unable to create netlink handle" },

{ IPQ_ERR_SOCKET, "Unable to create netlink socket" },

{ IPQ_ERR_BIND, "Unable to bind netlink socket" },

{ IPQ_ERR_BUFFER, "Unable to allocate buffer" },

{ IPQ_ERR_RECV, "Failed to receive netlink message" },

{ IPQ_ERR_NLEOF, "Received EOF on netlink socket" },

{ IPQ_ERR_ADDRLEN, "Invalid peer address length" },

{ IPQ_ERR_STRUNC, "Sent message truncated" },

{ IPQ_ERR_RTRUNC, "Received message truncated" },

{ IPQ_ERR_NLRECV, "Received error from netlink" },

{ IPQ_ERR_SEND, "Failed to send netlink message" },

{ IPQ_ERR_SUPP, "Operation not supported" },

{ IPQ_ERR_RECVBUF, "Receive buffer size invalid" }

};

static int ipq_errno = IPQ_ERR_NONE;

static ssize_t ipq_netlink_sendto(const struct ipq_handle *h,

const void *msg, size_t len);

static ssize_t ipq_netlink_recvfrom(const struct ipq_handle *h,

unsigned char *buf, size_t len);

static ssize_t ipq_netlink_sendmsg(const struct ipq_handle *h,

const struct msghdr *msg,

unsigned int flags);

static char *ipq_strerror(int errcode);

static ssize_t ipq_netlink_sendto(const struct ipq_handle *h,

const void *msg, size_t len)

{

int status = sendto(h->fd, msg, len, 0,

(struct sockaddr *)&h->peer, sizeof(h->peer));

if (status < 0)

ipq_errno = IPQ_ERR_SEND;

return status;

}

static ssize_t ipq_netlink_sendmsg(const struct ipq_handle *h,

const struct msghdr *msg,

unsigned int flags)

{

int status = sendmsg(h->fd, msg, flags);

if (status < 0)

ipq_errno = IPQ_ERR_SEND;

return status;

}

static ssize_t ipq_netlink_recvfrom(const struct ipq_handle *h,

unsigned char *buf, size_t len)

{

int addrlen, status;

struct nlmsghdr *nlh;

if (len < sizeof(struct nlmsgerr)) {

ipq_errno = IPQ_ERR_RECVBUF;

return -1;

}

addrlen = sizeof(h->peer);

status = recvfrom(h->fd, buf, len, 0,

(struct sockaddr *)&h->peer, &addrlen);

if (status < 0) {

ipq_errno = IPQ_ERR_RECV;

return status;

}

if (addrlen != sizeof(h->peer)) {

ipq_errno = IPQ_ERR_RECV;

return -1;

}

if (status == 0) {

ipq_errno = IPQ_ERR_NLEOF;

return -1;

}

nlh = (struct nlmsghdr *)buf;

if (nlh->nlmsg_flags & MSG_TRUNC || nlh->nlmsg_len > status) {

ipq_errno = IPQ_ERR_RTRUNC;

return -1;

}

return status;

}

static char *ipq_strerror(int errcode)

{

if (errcode < 0 || errcode > IPQ_MAXERR)

errcode = IPQ_ERR_IMPL;

return ipq_errmap[errcode].message;

}

/****************************************************************************

*

* Public interface

*

****************************************************************************/

/*

* Create and initialise an ipq handle.

* FIXME: implement flags.

*/

struct ipq_handle *ipq_create_handle(u_int32_t flags)

{

int status;

struct ipq_handle *h;

h = (struct ipq_handle *)malloc(sizeof(struct ipq_handle));

if (h == NULL) {

ipq_errno = IPQ_ERR_HANDLE;

return NULL;

}

memset(h, 0, sizeof(struct ipq_handle));

h->fd = socket(PF_NETLINK, SOCK_RAW, NETLINK_FIREWALL);

if (h->fd == -1) {

ipq_errno = IPQ_ERR_SOCKET;

close(h->fd);

free(h);

return NULL;

}

memset(&h->local, 0, sizeof(struct sockaddr_nl));

h->local.nl_family = AF_NETLINK;

h->local.nl_pid = getpid();

h->local.nl_groups = 0;

status = bind(h->fd, (struct sockaddr *)&h->local, sizeof(h->local));

if (status == -1) {

ipq_errno = IPQ_ERR_BIND;

close(h->fd);

free(h);

return NULL;

}

memset(&h->peer, 0, sizeof(struct sockaddr_nl));

h->peer.nl_family = AF_NETLINK;

h->peer.nl_pid = 0;

h->peer.nl_groups = 0;

return h;

}

/*

* No error condition is checked here at this stage, but it may happen

* if/when reliable messaging is implemented.

*/

int ipq_destroy_handle(struct ipq_handle *h)

{

if (h) {

close(h->fd);

free(h);

}

return 0;

}

int ipq_set_mode(const struct ipq_handle *h,

u_int8_t mode, size_t range)

{

struct {

struct nlmsghdr nlh;

ipq_peer_msg_t pm;

} req;

memset(&req, 0, sizeof(req));

req.nlh.nlmsg_len = NLMSG_LENGTH(sizeof(req));

req.nlh.nlmsg_flags = NLM_F_REQUEST;

req.nlh.nlmsg_type = IPQM_MODE;

req.nlh.nlmsg_pid = h->local.nl_pid;

req.pm.msg.mode.value = mode;

req.pm.msg.mode.range = range;

return ipq_netlink_sendto(h, (void *)&req, req.nlh.nlmsg_len);

}

/* Note: timeout is not yet implemented */

ssize_t ipq_read(const struct ipq_handle *h,

unsigned char *buf, size_t len, int timeout)

{

return ipq_netlink_recvfrom(h, buf, len);

}

int ipq_message_type(const unsigned char *buf)

{

return ((struct nlmsghdr*)buf)->nlmsg_type;

}

int ipq_get_msgerr(const unsigned char *buf)

{

struct nlmsghdr *h = (struct nlmsghdr *)buf;

struct nlmsgerr *err = (struct nlmsgerr*)NLMSG_DATA(h);

return -err->error;

}

ipq_packet_msg_t *ipq_get_packet(const unsigned char *buf)

{

return NLMSG_DATA((struct nlmsghdr *)(buf));

}

int ipq_set_verdict(const struct ipq_handle *h,

ipq_id_t id,

unsigned int verdict,

size_t data_len,

unsigned char *buf)

{

unsigned char nvecs;

size_t tlen;

struct nlmsghdr nlh;

ipq_peer_msg_t pm;

struct iovec iov[3];

struct msghdr msg;

memset(&nlh, 0, sizeof(nlh));

nlh.nlmsg_flags = NLM_F_REQUEST;

nlh.nlmsg_type = IPQM_VERDICT;

nlh.nlmsg_pid = h->local.nl_pid;

memset(&pm, 0, sizeof(pm));

pm.msg.verdict.value = verdict;

pm.msg.verdict.id = id;

pm.msg.verdict.data_len = data_len;

iov[0].iov_base = &nlh;

iov[0].iov_len = sizeof(nlh);

iov[1].iov_base = &pm;

iov[1].iov_len = sizeof(pm);

tlen = sizeof(nlh) + sizeof(pm);

nvecs = 2;

if (data_len && buf) {

iov[2].iov_base = buf;

iov[2].iov_len = data_len;

tlen += data_len;

nvecs++;

}

msg.msg_name = (void *)&h->peer;

msg.msg_namelen = sizeof(h->peer);

msg.msg_iov = iov;

msg.msg_iovlen = nvecs;

msg.msg_control = NULL;

msg.msg_controllen = 0;

msg.msg_flags = 0;

nlh.nlmsg_len = tlen;

return ipq_netlink_sendmsg(h, &msg, 0);

}

/* Not implemented yet */

int ipq_ctl(const struct ipq_handle *h, int request, ...)

{

return 1;

}

char *ipq_errstr(void)

{

return ipq_strerror(ipq_errno);

}

void ipq_perror(const char *s)

{

if (s)

fputs(s, stderr);

else

fputs("ERROR", stderr);

if (ipq_errno)

fprintf(stderr, ": %s", ipq_errstr());

if (errno)

fprintf(stderr, ": %s", strerror(errno));

fputc('\n', stderr);

}

 

//nf_queue.c

 

#include <linux/config.h>

#include <linux/module.h>

#include <linux/kernel.h>

#include <asm/types.h>

#include <linux/stddef.h>

#include <linux/types.h>

#include <linux/netfilter.h>

#include <linux/netfilter_ipv4.h>

#include <linux/skbuff.h>

#include <linux/ip.h>

#include <linux/netdevice.h>

#include <linux/if_ether.h>

const char *dest = "dest:";

const char *source = "source:";

static int nf_set_debug(struct sock *sk, int cmd, void *user, unsigned int len){

printk(KERN_DEBUG "in nf_setsockopt inet\n");

return 0;

}

static int nf_get_debug(struct sock *sk, int cmd, void *user, int *len){

printk(KERN_DEBUG "in nf_getsockopt inet\n");

return 0;

}

static struct nf_sockopt_ops nf_kqueue

= { { NULL, NULL }, PF_INET, 3700, 3702, nf_set_debug,

3700, 3702, nf_get_debug };

static unsigned int

nf_packet_passing(unsigned int hook,

struct sk_buff **pskb,

const struct net_device *indev,

const struct net_device *outdev,

int (*okfn)(struct sk_buff *))

{

printk("got a packet hook=%d",hook);

return NF_QUEUE;

}

 

static struct nf_hook_ops local_out_chain

= { { NULL, NULL }, nf_packet_passing, PF_INET, NF_IP_LOCAL_OUT, 0 };

static struct nf_hook_ops local_in_chain

= { { NULL, NULL }, nf_packet_passing, PF_INET, NF_IP_LOCAL_IN, 0 };

static struct nf_hook_ops forward_chain

= { { NULL, NULL }, nf_packet_passing, PF_INET, NF_IP_FORWARD, 0 };

static struct nf_hook_ops pre_routing_chain

= { { NULL, NULL }, nf_packet_passing, PF_INET, NF_IP_PRE_ROUTING, 0 };

static struct nf_hook_ops post_routing_chain

= { { NULL, NULL }, nf_packet_passing, PF_INET, NF_IP_POST_ROUTING, 0 };

int init_module(void)

{

nf_register_hook(&pre_routing_chain);

nf_register_sockopt(&nf_kqueue);

return 0;

}

void cleanup_module(void)

{

nf_unregister_hook(&pre_routing_chain);

nf_unregister_sockopt(&nf_kqueue);

}

/* To compile this as a loadable kernel module

gcc -O -Wall -Wunused -Iinclude/ -I/usr/src/linux/include -D__KERNEL__ -DMODULE -fno-strict-aliasing nf_queue.c -c -o nf_queue.o*/

 

 

 

 

 

 

 

Catch all the cricket action. Download Yahoo! Score tracker
--0-989538100-1037369433=:47562
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: 8bit

<FONT size=2>
<P>I have problem with firewall built using netfilter.can any one please help me detect the problem.</P>
<P>In libipq ipq_read is not working</P>
<P>I have the following files firewall.c, libipq.c , nf_queue.c</P>
<P>I complied and ran on Red hat linux 2.4.2</P>
<P>I compiled as root user</P>
<P>I did the following</P>
<P>gcc firewall.c libipq.c</P>
<P>insmod ip_queue.o</P>
<P>insmod nf_queue.o</P>
<P>./a.out</P>
<P>The ipq&nbsp; handle is created&nbsp; but never packets are recieved in userspaceand they are never stripped ,no stripped information and no tatistics.I ping from a different host and they are dropped but no stripped information.while setting rules i set icmpto discard and the host ip address in black list.</P>
<P>so i enclose the the following files.any plese help me to detect the problem</P>
<P>&nbsp;</P>
<P>&nbsp;</P>
<P>&nbsp;</P>
<P>// firewall.c</P>
<P>#include &lt;stdio.h&gt;</P>
<P>#include &lt;stdlib.h&gt;</P>
<P>#include "libipq.h"</P>
<P>#include &lt;linux/netfilter.h&gt;</P>
<P>#include &lt;sys/socket.h&gt;</P>
<P>#include &lt;sys/un.h&gt;</P>
<P>#include &lt;signal.h&gt;</P>
<P>#include &lt;linux/ip.h&gt;</P>
<P>#include &lt;linux/tcp.h&gt;</P>
<P>#include &lt;linux/icmp.h&gt;</P>
<P>&nbsp;</P>
<P>#define VALID 1</P>
<P>#define INVALID 0</P>
<P>#define ERROR 0</P>
<P>#define DROP 0</P>
<P>#define TEST 1</P>
<P>#define ACCEPT 1</P>
<P>#define IPQ_BUF_SIZE 65536</P>
<P>#define INTERNAL -1</P>
<P>#define EXTERNAL 1</P>
<P>#define IN 0</P>
<P>#define OUT 1</P>
<P>#define MATCH 1</P>
<P>#define NOMATCH -1</P>
<P>#define TIMEOUT 10</P>
<P>#define CheckProtocol(P) (PList[(P)])</P>
<P>/*************************************************/</P>
<P>/*Structure Declarations*/</P>
<P>/*************************************************/</P>
<P>/*struct bNode is a node in the black list */</P>
<P>typedef struct bNode</P>
<P>{</P>
<P>int ipAdd[4];</P>
<P>struct bNode *Next;</P>
<P>}bNodetype;</P>
<P>/*struct bHead is the head of the black list */</P>
<P>typedef struct bHead</P>
<P>{</P>
<P>int num;</P>
<P>struct bNode *Next;</P>
<P>} bHeadtype;</P>
<P>static struct ipq_handle *qh;</P>
<P>/*struct cNode is a node in the communication list */</P>
<P>typedef struct cNode</P>
<P>{</P>
<P>int ipSour[4];</P>
<P>int ipDest[4];</P>
<P>int time;</P>
<P>struct cNode *Next;</P>
<P>}cNodetype;</P>
<P>/*struct cHead is the head of the communication list */</P>
<P>typedef struct cHead</P>
<P>{</P>
<P>int num;</P>
<P>cNodetype *Next;</P>
<P>}cHeadtype;</P>
<P>bHeadtype bList;</P>
<P>cHeadtype cList;</P>
<P>int packetnum;</P>
<P>int quit;</P>
<P>int PList[256];</P>
<P>int portlist[256];</P>
<P>int sour[4];</P>
<P>int dest[4];</P>
<P>int oneway = 1;/*Flag for one way communication*/</P>
<P>int time_out = 10;</P>
<P>struct iphdr *ip;</P>
<P>struct tcphdr *tcp;</P>
<P>double accep=0;</P>
<P>double drop=0;</P>
<P>/*************************************************/</P>
<P>/*Function Prototype */</P>
<P>/*************************************************/</P>
<P>int strip_packet(unsigned char *packet);</P>
<P>int verify_packet(int interface,int Source[],int Dest[],int time,int ptype);</P>
<P>int check_proto(int type);</P>
<P>int check_port();</P>
<P>int check_bList(int ip);</P>
<P>int check_cList(int ipIn[],int ipEx[],int time);</P>
<P>int add_cList(int ipIn[],int ipEx[],int time);</P>
<P>int init_PList();</P>
<P>static void sig_handler(int);</P>
<P>/*************************************************/</P>
<P>/*int init_PList() */</P>
<P>/*Purpose: Initialize Protocol array to VALID, */</P>
<P>/* thus all protocols are set to pass. */</P>
<P>/*Parameters: none */</P>
<P>/* */</P>
<P>/*************************************************/</P>
<P>int init_PList()</P>
<P>{</P>
<P>int i,j;</P>
<P>/*the ip header field for protocol is */</P>
<P>/*only 8 bits, so the maximum number of */</P>
<P>/*protocols is 256. */</P>
<P>for(i=0;i&lt;256;i++)</P>
<P>{</P>
<P>PList[i]=VALID;</P>
<P>}</P>
<P>return(0);</P>
<P>}</P>
<P>/*end init_PList()*/</P>
<P>/*************************************************/</P>
<P>/*int strip_packet(unsigned char *packet */</P>
<P>/*Purpose: strips the packet of source, dest, */</P>
<P>/* protocol, timestamp, and interface */</P>
<P>/*Parameters: packet - a char pointer to a */</P>
<P>/* structure that has a ptr */</P>
<P>/* to the raw packet */</P>
<P>int strip_packet(unsigned char *packet)</P>
<P>{</P>
<P>ipq_packet_msg_t *pk;</P>
<P>int i;</P>
<P>int retip,rettcp;</P>
<P>int ptype;</P>
<P>int interface;</P>
<P>int time;</P>
<P>/*cast the ptr to the structure*/</P>
<P>pk = (ipq_packet_msg_t *) packet;</P>
<P>/*pull data from the struct*/</P>
<P>ptype = (int)pk-&gt;payload[9];</P>
<P>time = (int)pk-&gt;timestamp_sec;</P>
<P>/*get source and dest ip addresses*/</P>
<P>for(i=0;i&lt;4;i++)</P>
<P>{</P>
<P>sour[i]=pk-&gt;payload[i+12];</P>
<P>dest[i]=pk-&gt;payload[i+16];</P>
<P>}</P>
<P>/*determine which interface the*/</P>
<P>/*packet arrived on*/</P>
<P>printf("The data length of packet is %d\n",(pk-&gt;payload[0]));</P>
<P>printf(" The packet lenght is %d",pk-&gt;payload[2]);</P>
<P>ip=(struct iphdr*)pk-&gt;payload;</P>
<P>printf("source addr= %ld",ip-&gt;saddr);</P>
<P>printf("%d\n",pk-&gt;payload[3]);</P>
<P>if(pk-&gt;indev_name[3] == 0)</P>
<P>{</P>
<P>interface = EXTERNAL;</P>
<P>}</P>
<P>else if(pk-&gt;indev_name[3] == 1)</P>
<P>{</P>
<P>interface = INTERNAL;</P>
<P>}</P>
<P>else</P>
<P>{</P>
<P>printf("Cannot determine interface the packet arrived on, exiting\n");</P>
<P>return(ERROR);</P>
<P>}</P>
<P>&nbsp;</P>
<P>/*call verify_packet*/</P>
<P>retip = verify_packet(interface,sour,dest,time,ptype);</P>
<P>rettcp= verifytcp();</P>
<P>if (ip-&gt;protocol == 6)</P>
<P>{</P>
<P>tcp = (struct tcphdr*)((__u32 *)ip+ip-&gt;ihl);</P>
<P>rettcp=verifytcp();</P>
<P>}</P>
<P>if(retip==DROP||rettcp==DROP)</P>
<P>{</P>
<P>printf("Drop\n");</P>
<P>if(TEST)</P>
<P>{</P>
<P>printf("STATUS : DROP \n\n\n");</P>
<P>}</P>
<P>ipq_set_verdict(qh, pk-&gt;packet_id, NF_DROP, pk-&gt;data_len,pk-&gt;payload);</P>
<P>drop++;</P>
<P>}</P>
<P>else</P>
<P>{</P>
<P>printf("accept\n");</P>
<P>if(TEST)</P>
<P>{</P>
<P>printf("STATUS : ACCEPT \n\n\n");</P>
<P>}</P>
<P>ipq_set_verdict(qh, pk-&gt;packet_id, NF_ACCEPT, pk-&gt;data_len,pk-&gt;payload);</P>
<P>accep++;</P>
<P>}</P>
<P>return 1;</P>
<P>}</P>
<P>&nbsp;</P>
<P>&nbsp;</P>
<P>/*************************************************/</P>
<P>int check_proto(int type)</P>
<P>{</P>
<P>int ret;</P>
<P>ret = PList[type];</P>
<P>if(TEST)</P>
<P>{</P>
<P>printf(" check_proto:type %d\n",type);</P>
<P>printf(" check_proto:ret %d\n",ret);</P>
<P>}</P>
<P>return(ret);</P>
<P>}</P>
<P>/*************************************************/</P>
<P>/*int check_bList() */</P>
<P>/*Purpose: compares a ip address to the blacklist*/</P>
<P>/*Parameters: ip[] - an array containing the four*/</P>
<P>/* fields in an ip address */</P>
<P>/*************************************************/</P>
<P>int check_blist(int ip[])</P>
<P>{</P>
<P>int i,j,match,found;</P>
<P>bNodetype *temp;</P>
<P>temp = bList.Next;</P>
<P>found = 0;</P>
<P>for(i=0;i&lt;bList.num;i++)</P>
<P>{</P>
<P>match = 1;</P>
<P>for(j=0;((j&lt;4) &amp;&amp; (match==1));j++)</P>
<P>{</P>
<P>if(temp-&gt;ipAdd[j]!=ip[j])</P>
<P>{</P>
<P>match = 0;</P>
<P>}</P>
<P>else if(j==3)</P>
<P>{</P>
<P>found = 1;</P>
<P>}</P>
<P>&nbsp;</P>
<P>}</P>
<P>}</P>
<P>if(TEST)</P>
<P>{</P>
<P>printf(" check_blist:PASS\n");</P>
<P>}</P>
<P>return(ACCEPT);</P>
<P>}</P>
<P>/************************************************/</P>
<P>/*int init() */</P>
<P>/*Purpose: to initilize to start of the program */</P>
<P>/* to control setting default values */</P>
<P>/*Parameters: none */</P>
<P>/************************************************/</P>
<P>int init()</P>
<P>{</P>
<P>if(TEST)</P>
<P>{</P>
<P>printf("INITALIZATION\n");</P>
<P>}</P>
<P>init_PList();</P>
<P>bList.num=0;</P>
<P>cList.num=0;</P>
<P>packetnum=0;</P>
<P>if(TEST)</P>
<P>{</P>
<P>printf("initiaizationover\n");</P>
<P>}</P>
<P>return(0);</P>
<P>}</P>
<P>&nbsp;</P>
<P>/*************************************************/</P>
<P>/*int check_com() */</P>
<P>/*Purpose: To check a list for matching source */</P>
<P>/* and destination addresses */</P>
<P>/*Parameters:Source[] - source ip */</P>
<P>/* Dest[] - destination address */</P>
<P>/* time - the timestamp of the packet */</P>
<P>/* type - incoming or outgoing(the */</P>
<P>/* interface on which the packet*/</P>
<P>/* entered the system */</P>
<P>/*************************************************/</P>
<P>int check_com(int Source[],int Dest[],int time,int type)</P>
<P>{</P>
<P>int i,j;</P>
<P>int match,found;</P>
<P>cNodetype *temp=cList.Next;</P>
<P>for(i=0;i&lt;cList.num;i++)</P>
<P>{</P>
<P>for(j=0;j&lt;4&amp;&amp;match;j++)</P>
<P>{</P>
<P>if((temp-&gt;ipSour[j]==Source[j])&amp;&amp;(temp-&gt;ipDest[j]==Dest[j]))</P>
<P>{</P>
<P>if(j==3)</P>
<P>{</P>
<P>found = 1;</P>
<P>}</P>
<P>}</P>
<P>else</P>
<P>{</P>
<P>match = 0;</P>
<P>}</P>
<P>}</P>
<P>if(match)</P>
<P>{</P>
<P>if(type == INTERNAL)</P>
<P>{</P>
<P>temp-&gt;time = time;</P>
<P>if(TEST)</P>
<P>{</P>
<P>printf(" checkcom: UPDATETIMEVALID\n");</P>
<P>}</P>
<P>return(VALID);</P>
<P>}</P>
<P>else</P>
<P>{</P>
<P>if((time - temp-&gt;time)&lt;time_out)</P>
<P>{</P>
<P>if(TEST)</P>
<P>{</P>
<P>printf(" check_com VALID\n");</P>
<P>}</P>
<P>return(VALID);</P>
<P>}</P>
<P>else</P>
<P>{</P>
<P>if(TEST)</P>
<P>{</P>
<P>printf(" check_com: INVALID\n");</P>
<P>}</P>
<P>return(INVALID);</P>
<P>}</P>
<P>}</P>
<P>}</P>
<P>}</P>
<P>}</P>
<P>&nbsp;</P>
<P>&nbsp;</P>
<P>/*************************************************/</P>
<P>/*int add_b(int ip[]) */</P>
<P>/*Purpose: add a ip address to the blacklist */</P>
<P>/*Parameters: ip[] - the ip address to add */</P>
<P>/*************************************************/</P>
<P>int add_b(int ip[])</P>
<P>{</P>
<P>int i;</P>
<P>bNodetype *temp;</P>
<P>temp = bList.Next;</P>
<P>bList.Next = malloc(sizeof(bNodetype));</P>
<P>for(i=0;i&lt;4;i++)</P>
<P>{</P>
<P>bList.Next-&gt;ipAdd[i]=ip[i];</P>
<P>}</P>
<P>bList.Next-&gt;Next=temp;</P>
<P>bList.num = bList.num + 1;</P>
<P>return(0);</P>
<P>}</P>
<P>/*************************************************/</P>
<P>/*int add_com(int Source[],int Dest[], int time) */</P>
<P>/*Purpose: add a connection to the comlist */</P>
<P>/*Parameters: Source[] - the sourceip address to*/</P>
<P>/* Dest[] - the destination address */</P>
<P>/* time - the timestamp of the packet */</P>
<P>/*************************************************/</P>
<P>int add_com(int Source[],int Dest[],int time)</P>
<P>{</P>
<P>int i;</P>
<P>cNodetype *temp;</P>
<P>temp = cList.Next;</P>
<P>cList.Next = malloc(sizeof(cNodetype));</P>
<P>for(i=0;i&lt;4;i++)</P>
<P>{</P>
<P>cList.Next-&gt;ipSour[i]=Source[i];</P>
<P>cList.Next-&gt;ipDest[i]=Dest[i];</P>
<P>}</P>
<P>cList.Next-&gt;time=time;</P>
<P>return 1;</P>
<P>}</P>
<P>/*int verify(int Source[],int Dest[], int time) */</P>
<P>/*Purpose: goes through the tests */</P>
<P>/*Parameters: Source[] - the sourceip address to*/</P>
<P>/* Dest[] - the destination address */</P>
<P>/* time - the timestamp of the packet */</P>
<P>/*************************************************/</P>
<P>int verify_packet(int interface,int Source[],int Dest[],int time,int ptype)</P>
<P>{</P>
<P>if(TEST)</P>
<P>{</P>
<P>printf(" verify_packet: Verifying Packet\n");</P>
<P>printf(" verify_packet: Interface %d\n",interface);</P>
<P>printf(" verify_packet: Source IP %d.%d.%d.%d\n",Source[0],Source[1],Source[2],Source[3]);</P>
<P>printf(" verify_packet: Dest IP %d.%d.%d.%d\n",Dest[0],Dest[1],Dest[2],Dest[3]);</P>
<P>printf(" verify_packet: Type %d\n",ptype);</P>
<P>printf(" verify_packet: Time Stamp %d\n\n",time);</P>
<P>}</P>
<P>if(check_proto(ptype)==INVALID)</P>
<P>{</P>
<P>if(TEST)</P>
<P>{</P>
<P>printf("verify_packet:return INVALID\n");</P>
<P>}</P>
<P>return(DROP);</P>
<P>}</P>
<P>switch(interface)</P>
<P>{</P>
<P>case EXTERNAL:</P>
<P>if(TEST)</P>
<P>{</P>
<P>printf("EXTERNAL");</P>
<P>}</P>
<P>if(check_blist(Source)==DROP)</P>
<P>{</P>
<P>return(DROP);</P>
<P>}</P>
<P>if(oneway)</P>
<P>{</P>
<P>if(check_com(Source,Dest,time,interface)==VALID)</P>
<P>{</P>
<P>add_com(Dest,Source,time); </P>
<P>}</P>
<P>}</P>
<P>return(ACCEPT);</P>
<P>break;</P>
<P>case INTERNAL:</P>
<P>if(TEST)</P>
<P>{</P>
<P>printf("INTERNAL\n");</P>
<P>}</P>
<P>if(check_blist(Dest)==DROP)</P>
<P>{</P>
<P>printf("Blacklist\n");</P>
<P>return(DROP);</P>
<P>}</P>
<P>if(oneway){</P>
<P>&nbsp;</P>
<P>if(check_com(Dest,Source,time,interface)==INVALID)</P>
<P>{</P>
<P>add_com(Dest,Source,time);</P>
<P>}</P>
<P>}</P>
<P>return(ACCEPT);</P>
<P>break;</P>
<P>default:</P>
<P>return(ERROR);</P>
<P>break;</P>
<P>}//end switch</P>
<P>return(0);</P>
<P>}</P>
<P>&nbsp;</P>
<P>/*************************************************/</P>
<P>/*run() */</P>
<P>/*Purpose: sets the connection to ip_queue */</P>
<P>/* and listens for a packet */</P>
<P>/*Parameters.</P>
<P>*/</P>
<P>/*************************************************/</P>
<P>int run()</P>
<P>{</P>
<P>int i,rval;</P>
<P>ssize_t len;</P>
<P>unsigned char *buf;</P>
<P>int error;</P>
<P>/*Create Handle and Error Check*/</P>
<P>qh=NULL;</P>
<P>if((qh=ipq_create_handle(0))==NULL)</P>
<P>{</P>
<P>//error=100;</P>
<P>printf("Could not create IPQ Handle, Exiting\n");</P>
<P>exit(2);</P>
<P>}</P>
<P>rval = ipq_set_mode(qh, IPQ_COPY_PACKET, 0);</P>
<P>if(rval&lt;0)</P>
<P>{</P>
<P>ipq_destroy_handle(qh);</P>
<P>exit(1);</P>
<P>}</P>
<P>if(qh)</P>
<P>printf("Created IPQ Handle\n");</P>
<P>buf = (char *) malloc(IPQ_BUF_SIZE);</P>
<P>quit=1;</P>
<P>while(quit)</P>
<P>{</P>
<P>int ptype,error;</P>
<P>unsigned char *packet;</P>
<P>len = ipq_read(qh, buf, IPQ_BUF_SIZE, 0);</P>
<P>if (len &lt; 0)</P>
<P>{</P>
<P>printf("Nothing\n");</P>
<P>break;</P>
<P>} else if (len == 0) {</P>
<P>printf("timeout exceeded\n");</P>
<P>} else {</P>
<P>printf("got a packet\n");</P>
<P>ptype = ipq_message_type(buf);</P>
<P>packet = (unsigned char *)ipq_get_packet(buf);</P>
<P>printf("the packet type is %d",ptype);</P>
<P>switch (ptype)</P>
<P>{</P>
<P>case NLMSG_ERROR:</P>
<P>printf("NLMSG_ERROR: %d\n", error);</P>
<P>exit(3);</P>
<P>break;</P>
<P>case IPQM_PACKET:</P>
<P>strip_packet(packet);</P>
<P>break;</P>
<P>}</P>
<P>}</P>
<P>}</P>
<P>ipq_destroy_handle(qh);</P>
<P>printf("exit from run\n");</P>
<P>}</P>
<P>/*************************************************/</P>
<P>/*int setoptions() */</P>
<P>/*Purpose: allows the user to enter options */</P>
<P>/* */</P>
<P>/* */</P>
<P>/* */</P>
<P>/* */</P>
<P>/*************************************************/</P>
<P>int setoptions()</P>
<P>{</P>
<P>int prot,port;</P>
<P>int i,ip[4];</P>
<P>printf("PROTOCOL:do you want to mark any protocol as invalid? 1 to enter or 0 to skip\n");</P>
<P>scanf("%d",&amp;i);</P>
<P>while(i)</P>
<P>{</P>
<P>printf("PROTOCOL:enter protocol number which is to be marked invalid\n");</P>
<P>scanf("%d",&amp;prot);</P>
<P>PList[prot]=INVALID;</P>
<P>printf("PROTOCOL: ANOTHER PROTOCOL? 1 to enter, 0 to skip\n");</P>
<P>scanf("%d",&amp;i);</P>
<P>}</P>
<P>port=0;</P>
<P>printf("PORT:do you want to deny access to particular ports? 1 to enter or 0 to skip\n");</P>
<P>scanf("%d",&amp;i);</P>
<P>while(i)</P>
<P>{</P>
<P>printf("PROTOCOL:enter port number to which externel access is to be denied:");</P>
<P>scanf("%d",&amp;prot);</P>
<P>portlist[port]=prot;</P>
<P>port++;</P>
<P>printf("PORT: ANOTHER PORT? 1 to enter, 0 to skip\n");</P>
<P>scanf("%d",&amp;i);</P>
<P>}</P>
<P>i = 1;</P>
<P>while(i)</P>
<P>{</P>
<P>printf("BLACKLIST: Enter 1 to enter ip or 0 to skip\n");</P>
<P>scanf("%d",&amp;i);</P>
<P>if(i==1)</P>
<P>{</P>
<P>printf("ENTER IP ADDRESS\n\n");</P>
<P>scanf("%d.%d.%d.%d",&amp;ip[0],&amp;ip[1],&amp;ip[2],&amp;ip[3]);</P>
<P>add_b(ip);</P>
<P>}</P>
<P>}</P>
<P>printf("ONEWAY COM: To turn off one way communication type 0 otherwise enter 1\n");</P>
<P>scanf("%d",&amp;oneway);</P>
<P>if(oneway!=0)</P>
<P>{</P>
<P>oneway = 1;</P>
<P>printf("Enter timeout value (seconds)\n");</P>
<P>scanf("%d",&amp;time_out);</P>
<P>}</P>
<P>return(0);</P>
<P>}</P>
<P>&nbsp;</P>
<P>empty_b()</P>
<P>{</P>
<P>int i;</P>
<P>bNodetype *temp;</P>
<P>bNodetype *next;</P>
<P>temp = bList.Next;</P>
<P>next = temp -&gt;Next;</P>
<P>for(i = 0; i &lt; bList.num; i++)</P>
<P>{</P>
<P>free(temp);</P>
<P>temp = next;</P>
<P>if(i&lt;bList.num-1)</P>
<P>{</P>
<P>next = temp-&gt;Next;</P>
<P>}</P>
<P>}</P>
<P>}</P>
<P>&nbsp;</P>
<P>int main()</P>
<P>{</P>
<P>int ret;</P>
<P>printf("**********************************\n");</P>
<P>printf(" LINUX FIREWALL \n");</P>
<P>printf("**********************************\n); </P>
<P>signal (SIGINT,sig_handler);</P>
<P>while(1)</P>
<P>{</P>
<P>init();</P>
<P>setoptions();</P>
<P>printf("call run\n");</P>
<P>run();</P>
<P>}</P>
<P>exit(0);</P>
<P>}</P>
<P>static void sig_handler(int sig)</P>
<P>{</P>
<P>int i;</P>
<P>printf("ENTER 1 to Revise table, enter 0 to quit\n");</P>
<P>scanf("%d",&amp;i);</P>
<P>if(i==0)</P>
<P>{</P>
<P>printf("****************** linux firewall statistics*********************\n");</P>
<P>printf("Number of packets received = %lf\n",accep+drop);</P>
<P>printf("Number of packets dropped = %lf\n",drop);</P>
<P>printf("Number of packets accepted = %lf\n",accep);</P>
<P>printf("Attack probability ratio = %lf\n",drop/(drop+accep));</P>
<P>printf("***************************************************************\n");</P>
<P>_exit(sig);</P>
<P>}</P>
<P>else</P>
<P>{</P>
<P>quit=0;</P>
<P>}</P>
<P>}</P>
<P>int verifytcp()</P>
<P>{</P>
<P>int i;</P>
<P>printf(" verify_packet: Packet has TCP payload\n");</P>
<P>printf(" verify_packet: The Source port is: %d\n",ntohs(tcp-&gt;source));</P>
<P>printf(" verify_packet: The Destination port is: %d\n",ntohs(tcp-&gt;dest));</P>
<P>if(check_port(ntohs(tcp-&gt;dest)) )</P>
<P>{</P>
<P>printf(" verify_packet: Access to port %d denied for packet\n",ntohs(tcp-&gt;dest));</P>
<P>printf("Access to port %d denied for packet\n",ntohs(tcp-&gt;dest));</P>
<P>return(DROP);</P>
<P>}</P>
<P>/* drops Xmas || Ymax */</P>
<P>if (tcp-&gt;res1 != 0)</P>
<P>return(DROP);</P>
<P>/* drops SYN without ACK but with others flags set */</P>
<P>if ((tcp-&gt;syn &amp;&amp; !tcp-&gt;ack)</P>
<P>&amp;&amp; (tcp-&gt;fin || tcp-&gt;rst || tcp-&gt;psh || tcp-&gt;urg))</P>
<P>return(DROP);</P>
<P>/* drops SYN/ACK with RST and/or FIN set */</P>
<P>if ((tcp-&gt;syn &amp;&amp; tcp-&gt;ack) &amp;&amp; (tcp-&gt;fin || tcp-&gt;rst))</P>
<P>return(DROP);</P>
<P>/* drops TCP packets with no-sense flags (or without flags set) */</P>
<P>if (!tcp-&gt;fin &amp;&amp; !tcp-&gt;syn &amp;&amp; !tcp-&gt;rst &amp;&amp; !tcp-&gt;ack)</P>
<P>return(DROP);</P>
<P>printf(" verify_packet: The packet passed TCP sanity check\n");</P>
<P>printf("The packet passed TCP sanity check\n");</P>
<P>return(ACCEPT);</P>
<P>}</P>
<P>int check_port(int port)</P>
<P>{</P>
<P>int i;</P>
<P>for(i=0;i&lt;=255;i++)</P>
<P>if(port==portlist[i])</P>
<P>return (1);</P>
<P>return (0);</P>
<P>}</P>
<P>&nbsp;</P>
<P>&nbsp;</P>
<P>&nbsp;</P>
<P>&nbsp;</P>
<P>&nbsp;</P>
<P>&nbsp;</P>
<P>&nbsp;</P>
<P>&nbsp;</P>
<P>&nbsp;</P>
<P>/*</P>
<P>* libipq.h</P>
<P>*</P>
<P>* IPQ library for userspace.</P>
<P>*</P>
<P>* Author: James Morris &lt;jmorris@intercode.com.au&gt;</P>
<P>*</P>
<P>* Copyright (c) 2000-2001 Netfilter Core Team</P>
<P>*</P>
<P>* This program is free software; you can redistribute it and/or modify</P>
<P>* it under the terms of the GNU General Public License as published by</P>
<P>* the Free Software Foundation; either version 2 of the License, or</P>
<P>* (at your option) any later version.</P>
<P>*</P>
<P>* This program is distributed in the hope that it will be useful,</P>
<P>* but WITHOUT ANY WARRANTY; without even the implied warranty of</P>
<P>* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the</P>
<P>* GNU General Public License for more details.</P>
<P>*</P>
<P>*/</P>
<P>#ifndef _LIBIPQ_H</P>
<P>#define _LIBIPQ_H</P>
<P>#include &lt;errno.h&gt;</P>
<P>#include &lt;unistd.h&gt;</P>
<P>#include &lt;fcntl.h&gt;</P>
<P>#include &lt;sys/types.h&gt;</P>
<P>#include &lt;sys/socket.h&gt;</P>
<P>#include &lt;sys/uio.h&gt;</P>
<P>#include &lt;asm/types.h&gt;</P>
<P>#include &lt;linux/netlink.h&gt;</P>
<P>#ifdef KERNEL_64_USERSPACE_32</P>
<P>#include "ip_queue_64.h"</P>
<P>typedef u_int64_t ipq_id_t;</P>
<P>#else</P>
<P>#include &lt;linux/netfilter_ipv4/ip_queue.h&gt;</P>
<P>typedef u_int32_t ipq_id_t;</P>
<P>#endif</P>
<P>#ifdef DEBUG_LIBIPQ</P>
<P>#include &lt;stdio.h&gt;</P>
<P>#define LDEBUG(x...) fprintf(stderr, ## x)</P>
<P>#else</P>
<P>#define LDEBUG(x...)</P>
<P>#endif /* DEBUG_LIBIPQ */</P>
<P>/* FIXME: glibc sucks */</P>
<P>#ifndef MSG_TRUNC</P>
<P>#define MSG_TRUNC 0x20</P>
<P>#endif</P>
<P>struct ipq_handle</P>
<P>{</P>
<P>int fd;</P>
<P>u_int8_t blocking;</P>
<P>struct sockaddr_nl local;</P>
<P>struct sockaddr_nl peer;</P>
<P>};</P>
<P>struct ipq_handle *ipq_create_handle(u_int32_t flags);</P>
<P>int ipq_destroy_handle(struct ipq_handle *h);</P>
<P>ssize_t ipq_read(const struct ipq_handle *h,</P>
<P>unsigned char *buf, size_t len, int timeout);</P>
<P>int ipq_set_mode(const struct ipq_handle *h, u_int8_t mode, size_t len);</P>
<P>ipq_packet_msg_t *ipq_get_packet(const unsigned char *buf);</P>
<P>int ipq_message_type(const unsigned char *buf);</P>
<P>int ipq_get_msgerr(const unsigned char *buf);</P>
<P>int ipq_set_verdict(const struct ipq_handle *h,</P>
<P>ipq_id_t id,</P>
<P>unsigned int verdict,</P>
<P>size_t data_len,</P>
<P>unsigned char *buf);</P>
<P>int ipq_ctl(const struct ipq_handle *h, int request, ...);</P>
<P>char *ipq_errstr(void);</P>
<P>void ipq_perror(const char *s);</P>
<P>#endif /* _LIBIPQ_H */</P>
<P>&nbsp;</P>
<P>&nbsp;</P>
<P>&nbsp;</P>
<P>&nbsp;</P>
<P>&nbsp;</P>
<P>//libipq.c</P>
<P>#include &lt;stdlib.h&gt;</P>
<P>#include &lt;stdio.h&gt;</P>
<P>#include &lt;string.h&gt;</P>
<P>#include &lt;unistd.h&gt;</P>
<P>#include "libipq.h"</P>
<P>/****************************************************************************</P>
<P>*</P>
<P>* Private interface</P>
<P>*</P>
<P>****************************************************************************/</P>
<P>enum {</P>
<P>IPQ_ERR_NONE = 0,</P>
<P>IPQ_ERR_IMPL,</P>
<P>IPQ_ERR_HANDLE,</P>
<P>IPQ_ERR_SOCKET,</P>
<P>IPQ_ERR_BIND,</P>
<P>IPQ_ERR_BUFFER,</P>
<P>IPQ_ERR_RECV,</P>
<P>IPQ_ERR_NLEOF,</P>
<P>IPQ_ERR_ADDRLEN,</P>
<P>IPQ_ERR_STRUNC,</P>
<P>IPQ_ERR_RTRUNC,</P>
<P>IPQ_ERR_NLRECV,</P>
<P>IPQ_ERR_SEND,</P>
<P>IPQ_ERR_SUPP,</P>
<P>IPQ_ERR_RECVBUF</P>
<P>};</P>
<P>#define IPQ_MAXERR IPQ_ERR_RECVBUF</P>
<P>struct ipq_errmap_t {</P>
<P>int errcode;</P>
<P>char *message;</P>
<P>} ipq_errmap[] = {</P>
<P>{ IPQ_ERR_NONE, "Unknown error" },</P>
<P>{ IPQ_ERR_IMPL, "Implementation error" },</P>
<P>{ IPQ_ERR_HANDLE, "Unable to create netlink handle" },</P>
<P>{ IPQ_ERR_SOCKET, "Unable to create netlink socket" },</P>
<P>{ IPQ_ERR_BIND, "Unable to bind netlink socket" },</P>
<P>{ IPQ_ERR_BUFFER, "Unable to allocate buffer" },</P>
<P>{ IPQ_ERR_RECV, "Failed to receive netlink message" },</P>
<P>{ IPQ_ERR_NLEOF, "Received EOF on netlink socket" },</P>
<P>{ IPQ_ERR_ADDRLEN, "Invalid peer address length" },</P>
<P>{ IPQ_ERR_STRUNC, "Sent message truncated" },</P>
<P>{ IPQ_ERR_RTRUNC, "Received message truncated" },</P>
<P>{ IPQ_ERR_NLRECV, "Received error from netlink" },</P>
<P>{ IPQ_ERR_SEND, "Failed to send netlink message" },</P>
<P>{ IPQ_ERR_SUPP, "Operation not supported" },</P>
<P>{ IPQ_ERR_RECVBUF, "Receive buffer size invalid" }</P>
<P>};</P>
<P>static int ipq_errno = IPQ_ERR_NONE;</P>
<P>static ssize_t ipq_netlink_sendto(const struct ipq_handle *h,</P>
<P>const void *msg, size_t len);</P>
<P>static ssize_t ipq_netlink_recvfrom(const struct ipq_handle *h,</P>
<P>unsigned char *buf, size_t len);</P>
<P>static ssize_t ipq_netlink_sendmsg(const struct ipq_handle *h,</P>
<P>const struct msghdr *msg,</P>
<P>unsigned int flags);</P>
<P>static char *ipq_strerror(int errcode);</P>
<P>static ssize_t ipq_netlink_sendto(const struct ipq_handle *h,</P>
<P>const void *msg, size_t len)</P>
<P>{</P>
<P>int status = sendto(h-&gt;fd, msg, len, 0,</P>
<P>(struct sockaddr *)&amp;h-&gt;peer, sizeof(h-&gt;peer));</P>
<P>if (status &lt; 0)</P>
<P>ipq_errno = IPQ_ERR_SEND;</P>
<P>return status;</P>
<P>}</P>
<P>static ssize_t ipq_netlink_sendmsg(const struct ipq_handle *h,</P>
<P>const struct msghdr *msg,</P>
<P>unsigned int flags)</P>
<P>{</P>
<P>int status = sendmsg(h-&gt;fd, msg, flags);</P>
<P>if (status &lt; 0)</P>
<P>ipq_errno = IPQ_ERR_SEND;</P>
<P>return status;</P>
<P>}</P>
<P>static ssize_t ipq_netlink_recvfrom(const struct ipq_handle *h,</P>
<P>unsigned char *buf, size_t len)</P>
<P>{</P>
<P>int addrlen, status;</P>
<P>struct nlmsghdr *nlh;</P>
<P>if (len &lt; sizeof(struct nlmsgerr)) {</P>
<P>ipq_errno = IPQ_ERR_RECVBUF;</P>
<P>return -1;</P>
<P>}</P>
<P>addrlen = sizeof(h-&gt;peer);</P>
<P>status = recvfrom(h-&gt;fd, buf, len, 0,</P>
<P>(struct sockaddr *)&amp;h-&gt;peer, &amp;addrlen);</P>
<P>if (status &lt; 0) {</P>
<P>ipq_errno = IPQ_ERR_RECV;</P>
<P>return status;</P>
<P>}</P>
<P>if (addrlen != sizeof(h-&gt;peer)) {</P>
<P>ipq_errno = IPQ_ERR_RECV;</P>
<P>return -1;</P>
<P>}</P>
<P>if (status == 0) {</P>
<P>ipq_errno = IPQ_ERR_NLEOF;</P>
<P>return -1;</P>
<P>}</P>
<P>nlh = (struct nlmsghdr *)buf;</P>
<P>if (nlh-&gt;nlmsg_flags &amp; MSG_TRUNC || nlh-&gt;nlmsg_len &gt; status) {</P>
<P>ipq_errno = IPQ_ERR_RTRUNC;</P>
<P>return -1;</P>
<P>}</P>
<P>return status;</P>
<P>}</P>
<P>static char *ipq_strerror(int errcode)</P>
<P>{</P>
<P>if (errcode &lt; 0 || errcode &gt; IPQ_MAXERR)</P>
<P>errcode = IPQ_ERR_IMPL;</P>
<P>return ipq_errmap[errcode].message;</P>
<P>}</P>
<P>/****************************************************************************</P>
<P>*</P>
<P>* Public interface</P>
<P>*</P>
<P>****************************************************************************/</P>
<P>/*</P>
<P>* Create and initialise an ipq handle.</P>
<P>* FIXME: implement flags.</P>
<P>*/</P>
<P>struct ipq_handle *ipq_create_handle(u_int32_t flags)</P>
<P>{</P>
<P>int status;</P>
<P>struct ipq_handle *h;</P>
<P>h = (struct ipq_handle *)malloc(sizeof(struct ipq_handle));</P>
<P>if (h == NULL) {</P>
<P>ipq_errno = IPQ_ERR_HANDLE;</P>
<P>return NULL;</P>
<P>}</P>
<P>memset(h, 0, sizeof(struct ipq_handle));</P>
<P>h-&gt;fd = socket(PF_NETLINK, SOCK_RAW, NETLINK_FIREWALL);</P>
<P>if (h-&gt;fd == -1) {</P>
<P>ipq_errno = IPQ_ERR_SOCKET;</P>
<P>close(h-&gt;fd);</P>
<P>free(h);</P>
<P>return NULL;</P>
<P>}</P>
<P>memset(&amp;h-&gt;local, 0, sizeof(struct sockaddr_nl));</P>
<P>h-&gt;local.nl_family = AF_NETLINK;</P>
<P>h-&gt;local.nl_pid = getpid();</P>
<P>h-&gt;local.nl_groups = 0;</P>
<P>status = bind(h-&gt;fd, (struct sockaddr *)&amp;h-&gt;local, sizeof(h-&gt;local));</P>
<P>if (status == -1) {</P>
<P>ipq_errno = IPQ_ERR_BIND;</P>
<P>close(h-&gt;fd);</P>
<P>free(h);</P>
<P>return NULL;</P>
<P>}</P>
<P>memset(&amp;h-&gt;peer, 0, sizeof(struct sockaddr_nl));</P>
<P>h-&gt;peer.nl_family = AF_NETLINK;</P>
<P>h-&gt;peer.nl_pid = 0;</P>
<P>h-&gt;peer.nl_groups = 0;</P>
<P>return h;</P>
<P>}</P>
<P>/*</P>
<P>* No error condition is checked here at this stage, but it may happen</P>
<P>* if/when reliable messaging is implemented.</P>
<P>*/</P>
<P>int ipq_destroy_handle(struct ipq_handle *h)</P>
<P>{</P>
<P>if (h) {</P>
<P>close(h-&gt;fd);</P>
<P>free(h);</P>
<P>}</P>
<P>return 0;</P>
<P>}</P>
<P>int ipq_set_mode(const struct ipq_handle *h,</P>
<P>u_int8_t mode, size_t range)</P>
<P>{</P>
<P>struct {</P>
<P>struct nlmsghdr nlh;</P>
<P>ipq_peer_msg_t pm;</P>
<P>} req;</P>
<P>memset(&amp;req, 0, sizeof(req));</P>
<P>req.nlh.nlmsg_len = NLMSG_LENGTH(sizeof(req));</P>
<P>req.nlh.nlmsg_flags = NLM_F_REQUEST;</P>
<P>req.nlh.nlmsg_type = IPQM_MODE;</P>
<P>req.nlh.nlmsg_pid = h-&gt;local.nl_pid;</P>
<P>req.pm.msg.mode.value = mode;</P>
<P>req.pm.msg.mode.range = range;</P>
<P>return ipq_netlink_sendto(h, (void *)&amp;req, req.nlh.nlmsg_len);</P>
<P>}</P>
<P>/* Note: timeout is not yet implemented */</P>
<P>ssize_t ipq_read(const struct ipq_handle *h,</P>
<P>unsigned char *buf, size_t len, int timeout)</P>
<P>{</P>
<P>return ipq_netlink_recvfrom(h, buf, len);</P>
<P>}</P>
<P>int ipq_message_type(const unsigned char *buf)</P>
<P>{</P>
<P>return ((struct nlmsghdr*)buf)-&gt;nlmsg_type;</P>
<P>}</P>
<P>int ipq_get_msgerr(const unsigned char *buf)</P>
<P>{</P>
<P>struct nlmsghdr *h = (struct nlmsghdr *)buf;</P>
<P>struct nlmsgerr *err = (struct nlmsgerr*)NLMSG_DATA(h);</P>
<P>return -err-&gt;error;</P>
<P>}</P>
<P>ipq_packet_msg_t *ipq_get_packet(const unsigned char *buf)</P>
<P>{</P>
<P>return NLMSG_DATA((struct nlmsghdr *)(buf));</P>
<P>}</P>
<P>int ipq_set_verdict(const struct ipq_handle *h,</P>
<P>ipq_id_t id,</P>
<P>unsigned int verdict,</P>
<P>size_t data_len,</P>
<P>unsigned char *buf)</P>
<P>{</P>
<P>unsigned char nvecs;</P>
<P>size_t tlen;</P>
<P>struct nlmsghdr nlh;</P>
<P>ipq_peer_msg_t pm;</P>
<P>struct iovec iov[3];</P>
<P>struct msghdr msg;</P>
<P>memset(&amp;nlh, 0, sizeof(nlh));</P>
<P>nlh.nlmsg_flags = NLM_F_REQUEST;</P>
<P>nlh.nlmsg_type = IPQM_VERDICT;</P>
<P>nlh.nlmsg_pid = h-&gt;local.nl_pid;</P>
<P>memset(&amp;pm, 0, sizeof(pm));</P>
<P>pm.msg.verdict.value = verdict;</P>
<P>pm.msg.verdict.id = id;</P>
<P>pm.msg.verdict.data_len = data_len;</P>
<P>iov[0].iov_base = &amp;nlh;</P>
<P>iov[0].iov_len = sizeof(nlh);</P>
<P>iov[1].iov_base = &amp;pm;</P>
<P>iov[1].iov_len = sizeof(pm);</P>
<P>tlen = sizeof(nlh) + sizeof(pm);</P>
<P>nvecs = 2;</P>
<P>if (data_len &amp;&amp; buf) {</P>
<P>iov[2].iov_base = buf;</P>
<P>iov[2].iov_len = data_len;</P>
<P>tlen += data_len;</P>
<P>nvecs++;</P>
<P>}</P>
<P>msg.msg_name = (void *)&amp;h-&gt;peer;</P>
<P>msg.msg_namelen = sizeof(h-&gt;peer);</P>
<P>msg.msg_iov = iov;</P>
<P>msg.msg_iovlen = nvecs;</P>
<P>msg.msg_control = NULL;</P>
<P>msg.msg_controllen = 0;</P>
<P>msg.msg_flags = 0;</P>
<P>nlh.nlmsg_len = tlen;</P>
<P>return ipq_netlink_sendmsg(h, &amp;msg, 0);</P>
<P>}</P>
<P>/* Not implemented yet */</P>
<P>int ipq_ctl(const struct ipq_handle *h, int request, ...)</P>
<P>{</P>
<P>return 1;</P>
<P>}</P>
<P>char *ipq_errstr(void)</P>
<P>{</P>
<P>return ipq_strerror(ipq_errno);</P>
<P>}</P>
<P>void ipq_perror(const char *s)</P>
<P>{</P>
<P>if (s)</P>
<P>fputs(s, stderr);</P>
<P>else</P>
<P>fputs("ERROR", stderr);</P>
<P>if (ipq_errno)</P>
<P>fprintf(stderr, ": %s", ipq_errstr());</P>
<P>if (errno)</P>
<P>fprintf(stderr, ": %s", strerror(errno));</P>
<P>fputc('\n', stderr);</P>
<P>}</P>
<P>&nbsp;</P>
<P>//nf_queue.c</P>
<P>&nbsp;</P>
<P>#include &lt;linux/config.h&gt;</P>
<P>#include &lt;linux/module.h&gt;</P>
<P>#include &lt;linux/kernel.h&gt;</P>
<P>#include &lt;asm/types.h&gt;</P>
<P>#include &lt;linux/stddef.h&gt;</P>
<P>#include &lt;linux/types.h&gt;</P>
<P>#include &lt;linux/netfilter.h&gt;</P>
<P>#include &lt;linux/netfilter_ipv4.h&gt;</P>
<P>#include &lt;linux/skbuff.h&gt;</P>
<P>#include &lt;linux/ip.h&gt;</P>
<P>#include &lt;linux/netdevice.h&gt;</P>
<P>#include &lt;linux/if_ether.h&gt;</P>
<P>const char *dest = "dest:";</P>
<P>const char *source = "source:";</P>
<P>static int nf_set_debug(struct sock *sk, int cmd, void *user, unsigned int len){</P>
<P>printk(KERN_DEBUG "in nf_setsockopt inet\n");</P>
<P>return 0;</P>
<P>}</P>
<P>static int nf_get_debug(struct sock *sk, int cmd, void *user, int *len){</P>
<P>printk(KERN_DEBUG "in nf_getsockopt inet\n");</P>
<P>return 0;</P>
<P>}</P>
<P>static struct nf_sockopt_ops nf_kqueue</P>
<P>= { { NULL, NULL }, PF_INET, 3700, 3702, nf_set_debug,</P>
<P>3700, 3702, nf_get_debug };</P>
<P>static unsigned int</P>
<P>nf_packet_passing(unsigned int hook,</P>
<P>struct sk_buff **pskb,</P>
<P>const struct net_device *indev,</P>
<P>const struct net_device *outdev,</P>
<P>int (*okfn)(struct sk_buff *))</P>
<P>{</P>
<P>printk("got a packet hook=%d",hook);</P>
<P>return NF_QUEUE;</P>
<P>}</P>
<P>&nbsp;</P>
<P>static struct nf_hook_ops local_out_chain</P>
<P>= { { NULL, NULL }, nf_packet_passing, PF_INET, NF_IP_LOCAL_OUT, 0 };</P>
<P>static struct nf_hook_ops local_in_chain</P>
<P>= { { NULL, NULL }, nf_packet_passing, PF_INET, NF_IP_LOCAL_IN, 0 };</P>
<P>static struct nf_hook_ops forward_chain</P>
<P>= { { NULL, NULL }, nf_packet_passing, PF_INET, NF_IP_FORWARD, 0 };</P>
<P>static struct nf_hook_ops pre_routing_chain</P>
<P>= { { NULL, NULL }, nf_packet_passing, PF_INET, NF_IP_PRE_ROUTING, 0 };</P>
<P>static struct nf_hook_ops post_routing_chain</P>
<P>= { { NULL, NULL }, nf_packet_passing, PF_INET, NF_IP_POST_ROUTING, 0 };</P>
<P>int init_module(void)</P>
<P>{</P>
<P>nf_register_hook(&amp;pre_routing_chain);</P>
<P>nf_register_sockopt(&amp;nf_kqueue);</P>
<P>return 0;</P>
<P>}</P>
<P>void cleanup_module(void)</P>
<P>{</P>
<P>nf_unregister_hook(&amp;pre_routing_chain);</P>
<P>nf_unregister_sockopt(&amp;nf_kqueue);</P>
<P>}</P>
<P>/* To compile this as a loadable kernel module</P>
<P>gcc -O -Wall -Wunused -Iinclude/ -I/usr/src/linux/include -D__KERNEL__ -DMODULE -fno-strict-aliasing nf_queue.c -c -o nf_queue.o*/</P>
<P>&nbsp;</P>
<P>&nbsp;</P>
<P>&nbsp;</P>
<P>&nbsp;</P>
<P>&nbsp;</P>
<P>&nbsp;</P></FONT><FONT face="Times New Roman" size=2>
<P>&nbsp;</P></FONT><p><img src="http://sg.yimg.com/i/aa/icons/28/cricket.gif" height=28 width=28>
Catch all the cricket action. Download <a href="http://in.sports.yahoo.com/cricket/tracker.html" target="_blank">
Yahoo! Score tracker</a>
--0-989538100-1037369433=:47562--

