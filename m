From: Khawar Shehzad <shehzad.khawar@gmail.com>
Subject: Libmnl - Adding IPv6 Address in the interface
Date: Mon, 29 Aug 2016 07:52:34 +0100
Message-ID: <7bf46bb2-c807-6a3e-3447-60e8b9a8cbf2@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding;
        bh=FMi9UCoRJ/XggyGMyub5DrwsziCogacucRAgVT/vTVU=;
        b=BufLwNH3daTMZoAYpupV9803oldQDZrfto2MNZ5M/JIjTfP3zcstL/JyAnvV9s9Itx
         4xBpT6zfHHNn5KO2KQTNIol0irZ+kGYV1r7nh5EEmg4fedEjxjUvTF5PMVXtwm/2rdy1
         VsEMY01zn7gYYdhWP7612KnuBqJ/9QplKTafZH+83OKRQ/3ENmsyhUSGMjc+ur6JTlIB
         1a/q3POSirVZjbgYtj8kgrajb2IF01qQ752G04jy7EMAYwtqk8Dub4wQfy/0SV/2pV+y
         CXluL6cF46+tD7suYj259KTxtnjQgAuZTlOkaZRGg0yTjA/NNGu3OEXa219/F3iRurFp
         YewA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi,
I hope all are fine.
You can view my question here as well ( 
http://stackoverflow.com/questions/39183969/adding-an-ipv6-address-to-the-interface-using-libmnl-and-rtnetlink 
)

I am trying to add an IPv6 address to an ethernet interface, using 
libmnl. After constructing a message and sending to the kernel, I saw 
that it was not added to the interface, even though the return codes for 
the kernel reply did not contain any error. Kindly can anybody have a 
look, and help me correct it. Am I supposed to add more attributes to 
the nlmsghdr or something else?


     #include <assert.h>
     #include <string.h>
     #include <inttypes.h>
     #include <sys/socket.h>
     #include <arpa/inet.h>
     #include <libmnl/libmnl.h>
     #include <linux/rtnetlink.h>
     #include <net/if.h>
     #include <time.h>
     static struct mnl_socket *nl;
     static unsigned int nlportid;

     int mnl_init(void);
     int mnl_init(){
         nl = mnl_socket_open(NETLINK_ROUTE);
         if(nl == NULL){
             printf("Error: mnl_socket_open\n");
             return 0;
         }
         if(mnl_socket_bind(nl, 0, MNL_SOCKET_AUTOPID) < 0){
             printf("Error: mnl_socket_bind\n");
             return 0;
         }
         nlportid = mnl_socket_get_portid(nl);
         return 1;
     }
     int add_to_interface(const char* eip){
         char buf[MNL_SOCKET_BUFFER_SIZE];
         struct nlmsghdr *nlh;
         struct ifaddrmsg *ifm;
         int ret;
         uint8_t seq;

         nlh = mnl_nlmsg_put_header(buf);

         nlh->nlmsg_type = RTM_NEWADDR;
         nlh->nlmsg_flags = NLM_F_REQUEST|NLM_F_CREATE|NLM_F_EXCL;
         nlh->nlmsg_seq = seq = time(NULL);

         ifm = mnl_nlmsg_put_extra_header(nlh, sizeof(*ifm));

         ifm->ifa_family = AF_INET6;
         ifm->ifa_prefixlen = 64;
         ifm->ifa_flags = IFA_F_PERMANENT;
         ifm->ifa_scope = RT_SCOPE_UNIVERSE;
         /* TODO get interaface name from user or configuration*/
         ifm->ifa_index = if_nametoindex("eth0");
         unsigned char eipn[16];
         inet_pton(AF_INET6, eip, eipn);
         mnl_attr_put(nlh, IFA_ADDRESS, 16,eipn);

         mnl_nlmsg_fprintf(stdout, nlh, nlh->nlmsg_len, sizeof(struct 
ifaddrmsg));

         if(mnl_socket_sendto(nl,nlh, nlh->nlmsg_len) < 0){
             printf("Error: mnl_socket_sendto");
             return 0;
         }
         ret = mnl_socket_recvfrom(nl,buf, sizeof(buf));
         if(ret == -1){
             printf("Error: mnl_socket_recvfrom");
             return 0;
         }
         ret = mnl_cb_run(buf, ret, seq, nlportid, NULL, NULL);
         return 0;
     }

     int main(int argc, char *argv[]){
         if(mnl_init()){
             add_to_interface("2001::20c:29ff:fe5f:13c7/64"); // for testing
         }
     }

Any help will be much appreciated.
Cheers,
Khawar

