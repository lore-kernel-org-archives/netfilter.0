From: Vlad Adomnicai <vlada@xana.ro>
Subject: iptables::ipv4 problems
Date: Wed, 23 Aug 2006 13:57:26 +0300
Message-ID: <44EC3496.30502@xana.ro>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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

Hi,
  I tried to use the iptables::ipv4 perl module to speed up rule adding 
and the other operations. Found out that my 2k lines adding time dropped 
from 40 seconds to just 4s which is very nice and usefull but when I 
wanted to update them I runned into a problem.
  I can add just fine a rule from perl, but I can't delete it from 
cmdline with iptables unless I write the rule number.

I have added two chains TEST and TEST2

#!/usr/bin/perl -w
use IPTables::IPv4;
$filter_table = IPTables::IPv4::init("filter");
%rule = (
  source => '192.168.212.50',
  jump => 'TEST2',
  'out-interface' => 'eth0'
);
$filter_table->append_entry('TEST',\%rule);
$filter_table->commit();

a iptables-save shows the rule beeing added :
:TEST - [0:0]
:TEST2 - [0:0]
-A TEST -s 192.168.212.50 -o eth0 -j TEST2
COMMIT

if I try to do ' iptables -D TEST -s 192.168.212.50 -o eth0 -j TEST2' it 
won't delete the rule printing :
iptables: No chain/target/match by that name

if I use iptables -D TEST 1 it deletes it just fine.

i added anothe rule by hand with the same format: iptables -A TEST -s 
192.168.212.50 -o eth0 -j TEST2 and got in iptables-save
:TEST - [0:0]
:TEST2 - [0:0]
-A TEST -s 192.168.212.50 -o eth0 -j TEST2
-A TEST -s 192.168.212.50 -o eth0 -j TEST2
COMMIT

Now a iptables -D TEST -s 192.168.212.50 -o eth0 -j TEST2 will succeed 
and delete one line. If I run it again I will get the same error as before.

 From the iptables-save I see no difference between the two lines, so 
why can't I delete it with the iptables -D and rule. ?
Is the way I add the rule from perl wrong ?

Vlad Adomnicai





