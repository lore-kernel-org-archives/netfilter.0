From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: netlink socket -- set mode fails ???
Date: Tue, 4 Aug 2009 12:59:39 +0530
Message-ID: <cfeab66d0908040029x155db45o981b0f7d46918e03@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=1jmkJH1AO2PX8SsLRlHFNfsoRUYFd1UdE7qYN7+uqok=;
        b=K3mDyZoyHLZycAezELTu7kPfTm99Az/tKuDKK0gXNIcui+g3ER8lDubDItgNeGb5L6
         RVMVljLFSYL3LSq736WCofwlUmEtB78niPhxQKG+z/5ZU2F5QlKoqhvjHQUa+G2uGvvY
         0VH7M+2/3YGYAVLeVAV6pOtdMWn6kJdXAZ2Pg=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: netfilter@vger.kernel.org

I compiled and tried to execute below program . But it exit with an
error message "unable to send mode message: connection refused" .
I have registered NETLINK_FIREWALL by loading ip_queue.ko module .

Thanks,
Ratheesh




#include <unistd.h>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/socket.h>
#include <linux/rtnetlink.h>
//#include <linux/if.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#include <errno.h>
#include <stdio.h>
#include <getopt.h>
#include <sys/ioctl.h>
#include <syslog.h>
#include <net/if.h>
#include <linux/netfilter_ipv4/ip_queue.h>

#include <linux/in.h>
#include <linux/in6.h>




int main(int argc, char **argv)
{


int netlink_socket;
int seq=3D0;
struct sockaddr_nl addr;
struct nlmsghdr *nl_header =3D NULL;
struct ipq_mode_msg *mode_data =3D NULL;
struct ipq_packet_msg *pkt_data =3D NULL;
struct ipq_verdict_msg *ver_data =3D NULL;
unsigned char buf1[128];
unsigned char buf2[128];
/*create the socket*/
netlink_socket =3D socket(AF_NETLINK,SOCK_RAW,NETLINK_FIREWALL);

/*set up the socket address structure*/
memset(&addr,0,sizeof(struct sockaddr_nl));
addr.nl_family=3DAF_NETLINK;
addr.nl_pid=3D0;/*packets are destined for the kernel*/
addr.nl_groups=3D0;/*we don=92t need any multicast groups*/


nl_header=3D(struct nlsmghdr *)buf1;
nl_header->nlmsg_type=3DIPQM_MODE;
nl_header->nlmsg_len=3DNLMSG_LENGTH(sizeof(struct ipq_mode_msg));
nl_header->nlmsg_flags=3D(NLM_F_REQUEST);
nl_header->nlmsg_pid=3Dgetpid();
nl_header->nlmsg_seq=3Dseq++;
mode_data=3DNLMSG_DATA(nl_header);
mode_data->value=3DIPQ_COPY_META;
mode_data->range=3D0;/*when mode is PACKET, 0 here means copy whole pac=
ket*/
if(sendto(netlink_socket,(void
*)nl_header,nl_header->nlmsg_len,0,(struct sockaddr
*)&addr,sizeof(struct sockaddr_nl)) < 0) {
   perror("unable to send mode message");
   exit(0);
 }
/*
 *  *we=92re ready to fileter packets
 *   */
for(;;) {
   if(recvfrom(netlink_socket,buf1,NLMSG_LENGTH(sizeof(struct
ipq_packet_msg)),0,&addr,sizeof(struct sockaddr_nl)) < 0) {
      perror("Unable to receive packet message");
      exit(0);
   }

  nl_header=3D(struct nlmsghdr *)buf1;
  pkt_data=3DNLMSG_DATA(nl_header);
  /*for the example just forward all packets*/
  nl_header=3Dbuf2;
  nl_header->nlmsg_type=3DIPQM_VERDICT;
  nl_header->nlmsg_len=3DNLMSG_LENGTH(sizeof(struct ipq_verdict_msg));
  nl_header->nlmsg_flags=3D(NLM_F_REQUEST);
  nl_header->nlmsg_pid=3Dgetpid();
  nl_header->nlmsg_seq=3Dseq++;
  ver_data=3D(struct ipq_verdict_msg *)NLMSG_DATA(nl_header);
  ver_data->value=3DNF_ACCEPT;
  ver_data->id=3Dpkt_data->packet_id;
  if(sendto(netlink_socket,(void *)nl_header,nl_header->nlmsg_len,0,
	(struct sockaddr *)&addr,sizeof(struct sockaddr_nl)) < 0){
     perror("unable to send mode message");
     exit(0);
  }
}

}
