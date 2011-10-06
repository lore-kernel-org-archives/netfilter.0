From: Prashant Batra <prashant0100@gmail.com>
Subject: NETFILTER_FILREWALL socket , kernel returning error on sending
 IPQM_MODE message
Date: Thu, 6 Oct 2011 22:22:45 +0530
Message-ID: <CAG+XuE7DyHfYPsG5TT1Mc0MZPvt=c=6xPqdSTR3rsFMENtWvbw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=nR9eDBTHo2Jb4t5PhY34y7/HkdUaZ8ABxgEXpswobgE=;
        b=I9jdiPt9wPHmo0y+OPkAFSsqNb7JeWxV4+HTWkk8FV3JMfZZ3ISqT7+sEkavz8ufAP
         i9TANSo9RAykrMt7ZhbFedLZ9llrDo6Be0srAZpj3tovryOC+IpGHeyiSM5sxcB3ota7
         oCCtwXpilsB+H8Jh2IPYS0ypiaiJDtx0btfr8=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I am trying to start with NETLINK_FIREWALL.
The following code, seems to return an error on execution saying
"INVALID ARGUMENTS"

received data 44
nl_header->nlmsg_type 2
error occured while receiving the message from the kernel.
error code -22

****** Invalid argument ********
msg->nlmsg_len 24
msg->nlmsg_type 11
msg->nlmsg_flags 1
msg->nlmsg_seq: 0
msg->nlmsg_pid: 17717


/***CODE **/

#include <sys/socket.h>
#include <sys/types.h>
#include <linux/netlink.h>
#include <linux/netfilter_ipv4/ip_queue.h>
#include <linux/netfilter.h>

#define IPQM_BASE 0x10     /* standard netlink messages below this */
#define IPQM_MODE (IPQM_BASE + 1)          /* Mode request from peer */
#define IPQM_VERDICT       (IPQM_BASE + 2)         /* Verdict from peer */
#define IPQM_PACKET        (IPQM_BASE + 3)         /* Packet from kernel */

main()
{
        int netlink_socket;
        int seq=0;
        struct sockaddr_nl addr;
        struct nlmsghdr *nl_header = NULL;
        struct ipq_mode_msg *mode_data = NULL;
        struct ipq_packet_msg *pkt_data = NULL;
        struct ipq_verdict_msg *ver_data = NULL;
        unsigned char buf1[128];
        unsigned char buf2[128];

        netlink_socket = socket(AF_NETLINK, SOCK_RAW, NETLINK_FIREWALL);
        memset(&addr, 0, sizeof(struct sockaddr_nl));
        addr.nl_family=AF_NETLINK;
        addr.nl_pid=0;/*packets are destined for the kernel*/
        addr.nl_groups=0;/*we don.t need any multicast groups*/
        /*
         * *we need to send a mode message first, so fill
         * *out the nlmsghdr structure as such
         * */
        nl_header = (struct nlsmghdr *)buf1;
        nl_header->nlmsg_type = IPQM_MODE;
        nl_header->nlmsg_len = NLMSG_LENGTH(sizeof(struct ipq_mode_msg));
        nl_header->nlmsg_flags = (NLM_F_REQUEST);/*this is a request,
don.t ask for an answer*/
        nl_header->nlmsg_pid = getpid();
        nl_header->nlmsg_seq = seq++;/*arbitrary unique value to allow
response correlation*/
        mode_data = NLMSG_DATA(nl_header);
        mode_data->value = IPQ_COPY_PACKET;
        mode_data->range = 0;/*when mode is PACKET, 0 here means copy
whole packet*/
        if (sendto(netlink_socket,(void
*)nl_header,nl_header->nlmsg_len,0,(struct sockaddr
*)&addr,sizeof(struct sockaddr_nl)) < 0)
        {
            perror("unable to send mode message");
            exit(0);
        }

    int socklen = sizeof(struct sockaddr_nl);
        int len =0;
        for(;;)
        {
                if((len = recvfrom(netlink_socket, buf1,
NLMSG_LENGTH(sizeof(struct ipq_packet_msg)), 0, (struct sockaddr
*)&addr, &socklen)) < 0) {
                        perror("Unable to receive packet message");
                        exit(0);
                }
                    printf("received data %d\n", len);
                /*
                 * *once we have the packet message, lets extract the
header and ancilliary data
                 * */
                nl_header=(struct nlmsghdr *)buf1;
                printf("nl_header->nlmsg_type %d\n", nl_header->nlmsg_type);

                if( nl_header->nlmsg_type == NLMSG_ERROR )
                {
                    struct nlmsgerr* pError = (struct
nlmsgerr*)NLMSG_DATA( nl_header );
                    if( pError->error != 0 ) // Error number 0 is an
acknowledgement not an error.
                    {
                        printf("error occured while receiving the
message from the kernel.\n");
                        printf("error code %d \n ", pError->error);
                        printf("\n****** %s ********\n",strerror( -1 *
pError->error));
                        printf("msg->nlmsg_len %d\n", pError->msg.nlmsg_len);
                        printf("msg->nlmsg_type %x\n", pError->msg.nlmsg_type);
                        printf("msg->nlmsg_flags %x\n",pError->msg.nlmsg_flags);
                        printf("msg->nlmsg_seq: %d\n", pError->msg.nlmsg_seq);
                        printf("msg->nlmsg_pid: %d\n", pError->msg.nlmsg_pid);
                        return 0;
                    }
                }

                pkt_data=NLMSG_DATA(nl_header);
                /*for the example just forward all packets*/
                nl_header=buf2;
                nl_header->nlmsg_type=IPQM_VERDICT;
                nl_header->nlmsg_len=NLMSG_LENGTH(sizeof(struct
ipq_verdict_msg));
                nl_header->nlmsg_flags=(NLM_F_REQUEST);/*this is a
request, don.t ask for an answer*/
                nl_header->nlmsg_pid=getpid();
                nl_header->nlmsg_seq=seq++;/*arbitrary unique value to
allow response correlation*/
                ver_data=(struct ipq_verdict_msg *)NLMSG_DATA(nl_header);
                ver_data->value=NF_ACCEPT;
                ver_data->id=pkt_data->packet_id;
                if(sendto(netlink_socket,(void
*)nl_header,nl_header->nlmsg_len,0,(struct sockaddr *)&addr,
sizeof(struct sockaddr_nl)) < 0)
    {
                        perror("unable to send mode message");
                        exit(0);
                }
        }
