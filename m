From: Andriy T. Yanko <wireless@wireless.org.ua>
Subject: libipfwc memory leak?
Date: Tue, 24 Sep 2002 09:11:21 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020924091121.44aae61d.wireless@wireless.org.ua>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi people!

I know that this letter is not for this mailllist. But I'm tired to find mistake.

I just writen this smal code for example:

--- cut ---
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <sys/types.h>
#include <unistd.h>
#include <signal.h>
#include "libipfwc/libipfwc.h"


int main( int argc, char **argv)
{
    pid_t pid;

    unsigned int num_chains; 
    unsigned int num_rules; 
    static struct ipfwc_fwchain *chains;
    struct ipfwc_fwrule *rules;

    pid=fork();
    if ( pid == -1 ) { printf("Can't fork!\n"); exit(0); }
    if ( pid != 0) exit(0);
    setsid();

    while(1)
    {
	chains=ipfwc_get_chainnames(&num_chains); 
	rules=ipfwc_get_rules(&num_rules,0); 
	sleep(1);
    }
    
    return 0;
}
--- end ---

When program is runnig I just type command "ps aux" 
and I saw that my program get more and more system memory.

Is this memory leak of libipfwc library?

In  libipfwc.c  function ipfwc_get_chainnames & ipfwc_get_rules use malloc() but not use free().
It's maybe ok for program ipchains but in my case is not gut.

How to fix it?

THANKS IN ADVANCE.


-- 
Andriy T. Yanko
wireless@wireless.org.ua

* Avoid The Gates of Hell use Linux

