From: Peggy Kam <ppkam@n-dsi.com>
Subject: How to test synflood prevention
Date: Mon, 16 Feb 2004 17:52:17 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <403149A1.8000704@n-dsi.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

Hi,

I have set up some rules for preventing the synflood attack, ie:

iptables -A SYN_FLOOD -m limit --limit 2/s --limit-burst 4 -j ACCEPT
iptables -A SYN_FLOOD -j DROP
iptables -A SYN_FLOOD -i eth1 -p tcp ! --syn -m state --state NEW -j DROP

However, the firewall does not seem to filter any packets.  I have used 
the following tcpflood.c program to generate the flood, however, when I 
used tcpdump and checked the message log with the firewall with and 
without the above rules, they gave me the same results.  So, may I ask 
how I can test the firewall for DoS attack?

Thanks in advance,
Peggy



#tcpflood.c

#include <unistd.h>
#include <stdio.h>
#include <netdb.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <sys/types.h>


int main(int argc, char **argv) {

  struct sockaddr_in to_addr;
  int s;

  bzero(&to_addr, sizeof(to_addr));
  to_addr.sin_family=AF_INET;


  if ( argc == 3 ) {
        to_addr.sin_addr.s_addr=inet_addr(argv[1]);
        to_addr.sin_port=htons(atoi(argv[2]));
  }

  else {
        fprintf(stderr, "Usage: %s <IP> <PORT>\n", argv[0]);
        return 1;
  }

  printf("Flooding  %s:%d ...\n", argv[1], atoi(argv[2]));

  while (1) {

        if ((s = socket(PF_INET, SOCK_STREAM, 0)) < 0) {
                fprintf(stderr, "Error: socket()\n");
                return 1;
        }

        if ((connect(s, (struct sockaddr *)&to_addr, sizeof to_addr)) < 0) {
                perror("connect()");
                return 1;
        }


        printf(".");
        fflush(stdout);
        close(s);

  }

  return 0;

}

                           


