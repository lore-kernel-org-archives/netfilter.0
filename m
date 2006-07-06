From: Stephen Gray <stephen.gray@anu.edu.au>
Subject: Preventing login scripts  with recent module
Date: Thu, 06 Jul 2006 16:42:54 +1000
Message-ID: <44ACB0EE.5000402@anu.edu.au>
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

Hi everyone,

I'm trying to set up iptables to drop packets from people running 
scripts that make repeated attempts to login using different 
usernames/passwords. I'm new to iptables so would appreciate some help.

I found the following firewall rules somewhere which are supposed to 
drop packets from people who connect 4 or more attempts withing 5 
minutes (from /etc/sysconfig/iptables):

[0:0] -A INPUT -i eth0 -p tcp -m tcp --dport 22 -m state --state NEW -m 
recent --set --name SSH_RECENT --rsource
[0:0] -A INPUT -i eth0 -p tcp -m tcp --dport 22 -m state --state NEW -m 
recent --update --seconds 300 --hitcount 4 --name SSH_RECENT --rsource 
-j DROP

For some reason this worked for a day or so (4 attempts within 5 mins 
and I'm locked out for 5 mins) then inexplicably stopped working. I now 
find that I'm locked out straight away - even if this is my first 
attempt to connect for 24 hours. If I remove the above lines from the 
iptables file and restart I can log in, if I add them back in I'm locked 
out.

As far as I can tell from the docs the above rules are correct. Can 
anyone tell me what the problem might be?

Thanks very much,
Steve

