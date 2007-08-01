From: David Coulson <david@davidcoulson.net>
Subject: SNAT w/ uid-owner issue
Date: Wed, 01 Aug 2007 10:51:02 -0400
Message-ID: <46B09DD6.1090403@davidcoulson.net>
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

I have a pretty simple NAT rule going on here:

iptables -t nat -A POSTROUTING -d ! 10.0.0.0/8 -s 207.166.219.93 -p ! 
esp -m owner --uid-owner dante -j SNAT --to 207.166.203.150

Not rocket science - danted is running on 10.1.1.2, I'm connecting from 
10.6.1.40 over IPSec - Hence why I 1) tell it to ignore ESP (which says 
it comes from 219.93, plus it's still using 'dante' as the uid) 2) I'm 
telling it to ignore everything going to 10.0.0.0/8.

With this rule in place, I see this in my conntrack table:

tcp      6 267 ESTABLISHED src=10.1.1.2 dst=10.6.1.40 sport=1080 
dport=2097 [UNREPLIED] src=10.6.1.40 dst=207.166.203.150 sport=2097 
dport=1080 mark=0 use=1

Clearly wrong - There are no other rules related to my 150 address in my 
tables. Indeed, if I take out the SNAT rule, it will work fine. Now, if 
I change the SNAT to a 'LOG' entry, it only logs the rule hits that are 
correct, and not these ones that are wrong. I'm running a 2.6.15.1 
kernel, which I realized is older than the hills, but other than this it 
has been working happily.

Any ideas? I may try upgrading to 2.6.22.1 shortly, but I don't even 
know if that will fix it.

