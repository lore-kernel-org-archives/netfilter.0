From: "Shawn Wright" <swright@sls.bc.ca>
Subject: Using old CPU for 100s of clients
Date: Fri, 03 Dec 2004 12:06:27 -0800
Message-ID: <41B056C3.12743.B417EB07@localhost>
Reply-To: swright@sls.bc.ca
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-description: Mail message body
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Ok, I've flogged this issue on the shorewall list probably longer than some 
of you can stand by now. (remember, I'm the nut trying to use a PPro200 
to support ~500 users on a 10Mb internet link, and was experiencing 
random slow access/timeouts on first attempts to websites, but 2nd hits 
were fast. Problems can occur even during times of light load, and we 
have less than 25 rules in the firewall.)

To appease those who think I'm nuts, I am ordering a new firewall shortly 
to allow for future growth. (probably a Dell PE750 with P4/2.8 and dual 
GE nics, although I'm open to suggestions on best choice of CPU, etc)

However, since I have yet to prove that processor speed has anything to 
do with my random slow response times, I have this horrible nightmare 
that I will build a brand new 2.8Ghz firewall and *have the same problem*!

(I have reproduced the problem on a PPro200 and a PII/233, but CPU 
use never exceeds 15% on either, and no sign of dropped packets. A 
P3/667 is currently running fine, and I am working on duplicating it's 
setup, including exact kernel config on the slower machines as a test.)

So I won't bore you with any more details, but simply ask that anyone who 
is using iptables/shorewall on an aging CPU (say from 100-500 Mhz) 
supporting several hundred clients on a 10Mb link or faster, please let me 
know, on or off list. I just hate not knowing what is causing our problems, 
and having them occur on a new, fast firewall would probably push me 
over the edge....

Thanks.
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
Shawn Wright, I.T. Manager
Shawnigan Lake School
http://www.sls.bc.ca
swright@sls.bc.ca



