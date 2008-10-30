From: Rick Jones <rick.jones2@hp.com>
Subject: Shortcuts to counting rules?
Date: Wed, 29 Oct 2008 17:20:57 -0700
Message-ID: <4908FDE9.7040006@hp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

I would like to teach netperf (www.netperf.org) to determine if a 
firewall is enabled and if so how many rules there are.  To that end 
after some searching/stumbling around I have gotten to the prototype 
code at the end of this message.

The downside is that it requires the person compiling netperf to have 
"iptables-dev" (or its equivalent) installed.  I have noticed that at 
the end of the day (so to speak) it comes down to a pair of getsockopt() 
calls against a socket for each tablename.

open("/proc/net/ip_tables_names", O_RDONLY) = 3
fstat(3, {st_mode=S_IFREG|0440, st_size=0, ...}) = 0
mmap(NULL, 65536, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 
0) = 0x20000000002c8000
read(3, "nat\nmangle\nfilter\n", 1024)  = 18
socket(PF_INET, SOCK_RAW, IPPROTO_RAW)  = 4
getsockopt(4, SOL_IP, 0x40 /* IP_??? */, 
"nat\0\0\0\0\0?\3p\212L\200\t\0\0\0\0\0\0\0\0\0\0\0\0\0"..., [84]) = 0
getsockopt(4, SOL_IP, 0x41 /* IP_??? */, 
"nat\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., [1008]) = 0
close(4)                                = 0
socket(PF_INET, SOCK_RAW, IPPROTO_RAW)  = 4
getsockopt(4, SOL_IP, 0x40 /* IP_??? */, 
"mangle\0\0?\3p\212L\200\t\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., [84]) = 0
getsockopt(4, SOL_IP, 0x41 /* IP_??? */, 
"mangle\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., [1776]) = 0
close(4)                                = 0
socket(PF_INET, SOCK_RAW, IPPROTO_RAW)  = 4
getsockopt(4, SOL_IP, 0x40 /* IP_??? */, 
"filter\0\0?\3p\212L\200\t\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., [84]) = 0
getsockopt(4, SOL_IP, 0x41 /* IP_??? */, 
"filter\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., [7680]) = 0
close(4)                                = 0

[drift - is it worth teaching strace about those getsockopts?]

Are there any reasonable ways I might relax that requirement that 
iptables-dev be present?  Are some of the datastructures used in the 
getsockopt() calls "stable enough" to do that that netperf could make 
the getsockopt() calls directly without having to pull-in libiptc? 
Netperf does not particularly care about the rules themselves, just 
their number.

thanks,

rick jones

#include <errno.h>
#include <stdio.h>
#include <fcntl.h>
#include <stdlib.h>
#include <string.h>
#include <dlfcn.h>
#include <time.h>
#include "libiptc/libiptc.h"
#include "iptables.h"

#define NETFW_UNKNONW -1
#define NETFW_IPTABLES 1

static int
count_rules(iptc_handle_t *messiah) {

         const char *chain;
         const struct ipt_entry *rule;
         int count = 0;

         chain = iptc_first_chain(messiah);
         while (chain) {
                 rule = iptc_first_rule(chain,messiah);
                 while (rule) {
                         count++;
                         rule = iptc_next_rule(rule,messiah);
                 }
                 chain = iptc_next_chain(messiah);
         }
         return count;
}

void
get_firewall_info(int *firewalltype, int *rulecount) {

         FILE *namesfile = NULL;
         char tablename[IPT_TABLE_MAXNAMELEN + 1];
         iptc_handle_t messiah;  /* handles, always handles */

         int mycount = 0;
         *firewalltype = NETFW_IPTABLES;
         *rulecount = -1;


         namesfile = fopen("/proc/net/ip_tables_names","r");
         if (!namesfile)
                 return;

         while (fgets(tablename,
                      sizeof(tablename),
                      namesfile)) {
                 /* no end of line is bad */
                 if (tablename[strlen(tablename) - 1] != '\n') {
                         /* we want to signal the problem somehow */
                         /* so set the rulecount to -1 always here */
                         *rulecount = -1;
                         return;
                 }
                 /* but we dont want to have one in our calls */
                 tablename[strlen(tablename) - 1] = '\0';
                 messiah = iptc_init(tablename);
                 mycount += count_rules(&messiah);
                 iptc_free(&messiah);
         }
         *rulecount = mycount;
}

int
main(int argc, char *argv[]) {

         int firewalltype,rulecount;


         get_firewall_info(&firewalltype,&rulecount);
         printf("firewalltype is %d, rulecount 
%d\n",firewalltype,rulecount);

         return 0;
}
