From: "Hal Moroff" <halm90@gmail.com>
Subject: Trying to use libiptc
Date: Mon, 12 Feb 2007 14:51:13 -0800
Message-ID: <e1663d820702121451w6cbaec8cq4362d7686b0341b5@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

I've seen no references to libiptc anywhere, perhaps this is out of
date/outmoded?

I'm trying to create rules dynamically from within a C program.  I can create
and query chains, but can't seem to create rules for that chain.  I haven't been
able to find any sample code doing anything like this.

Here's a stripped down sample of my code:

#include <stdio.h>
#include <errno.h>
#include <libiptc/libiptc.h>
#include <iptables.h>

int main( int argc, char * argv[] )
{
iptc_handle_t       ipH;
struct ipt_entry    e;
char              * chain = "mychain";

  if( (ipH = iptc_init("filter")) ) printf("init succeeded\n");
  if( iptc_create_chain(chain, &ipH) ) printf("created chain <%s>\n", chain);
  if( iptc_commit(&ipH) ) printf("committed newly created chain\n");

  if( (ipH = iptc_init("filter")) ) printf("(re)init succeeded\n");

  memset(&e, 0, sizeof(e));
  inet_aton( "192.168.1.114", &e.ip.src  );
  inet_aton( "192.168.2.2",   &e.ip.dst  );
  inet_aton( "255.255.255.0", &e.ip.dmsk );
  strncpy(e.ip.iniface,  "eth0", sizeof(e.ip.iniface) );
  strncpy(e.ip.outiface, "eth1", sizeof(e.ip.outiface));
  e.ip.proto     = 8;

  if( iptc_insert_entry("mychain", &e, 0, &ipH) == 0 ) {
    printf("insert entry failed\n");
    exit(-1);
  }
  printf("insert entry succeeded\n");

  if( ! iptc_commit( &ipH ) ) {
    printf("new entry commit failed: %s\n", iptc_strerror(errno));
    exit(-1);
  }
  printf("new entry commit succeeded\n");
}


When I run I get this:

~/work/iptc# ./simple
init succeeded
created chain <mychain>
committed newly created chain
(re)init succeeded
insert entry succeeded
new entry commit failed: Target problem

