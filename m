From: Biswajit Paul <biswajit@cair.res.in>
Subject: Problem with libiptc ( Rules modification)
Date: Fri, 31 Oct 2003 15:52:02 +0530 (IST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.GSO.4.33.0310311529420.3823-100000@aditi.cair.res.in>
Mime-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rusty@linuxcare.com.au
Cc: leonardo@opalsoft.net, netfilter@lists.samba.org

hi
    I am writing a GUI for FW rule-sets.Instead of
using iptables directly i am using functions provided
by libiptc library.

    Viewing rules using libiptc functions is Ok
but when i am trying to modify firewall rules
its giving segmentation faults with every functions
which modifies rules.even i am also not able to
flush the rules.

   Plz help me out of it.

MY CODE :

#include<stdio.h>
#include<sys/socket.h>
#include<netinet/in.h>
#include<arpa/inet.h>
#include<sys/errno.h>
#include<iptables.h>
#include<libiptc/libiptc.h>

int main(void)

{ iptc_handle_t handle;
  const char *chain=NULL;
  int res;

handle=iptc_init("filter");

if(!handle)
     { printf("Error1: %s \n", iptc_strerror(errno));
       exit(errno);
     }

for(chain=iptc_first_chain(&handle);chain;chain=iptc_next_chain(&handle))
      { printf(" Flushing %s chain",chain);
        res=iptc_flush_entries(chain,&handle);  /* Culprit Line */
      }

if(!res)
     { printf("Error2: %s \n", iptc_strerror(errno));
       exit(errno);
     }
}

 With Regards

     Biswajit Paul



