From: "Fox, Michael" <MF180802@Exchange.Australia.NCR.COM>
Subject: Strange problem with iptables and ip ranges with leading 0's (wor
	ks sometimes, but not other times)
Date: Wed, 1 Oct 2003 11:18:28 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3FBEFB5CC5DB9C40A2D7E233E20563169CD2CA@sausyd201.corp.ncr.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org
Cc: michael@heimic.net

Hi everyone,

I've been a longtime user of linux and more recently big fan of iptables
since its introduction. Its so much more powerfull then what we have had
previously.

A friend and I just recently been playing around with some rules and found a
slight bug, and wished to email the list and get it checked/investigated. Is
it indeed a bug or a misconfiguration on our part.

I am not currently a member of the list, so if anyone replies to this post,
please kindly CC me via private email.

Problem is;

We found some strange behave from iptables (v1.2.8, 1.2.7a and I believe
also 1.2.6).

Basically if we enter in a rule like so; (notice leading 0's 007.0xx.0/24)

springer:~# iptables -N mule
springer:~# iptables -F mule
springer:~# iptables -A mule -p tcp --dport 4661 -s 202.007.076.0/24 -j
ACCEPT
springer:~# iptables -A mule -p tcp --dport 4661 -s 202.007.077.0/24 -j
ACCEPT 

Above works perfect no errors. Now see below.. Continuing on with further
ranges.

springer:~# iptables -A mule -p tcp --dport 4661 -s 202.007.078.0/24 -j
ACCEPT 
iptables v1.2.8: host/network `202.007.078.0' not found
Try `iptables -h' or 'iptables --help' for more information.
springer:~# iptables -A mule -p tcp --dport 4661 -s 202.007.079.0/24 -j
ACCEPT 
iptables v1.2.8: host/network `202.007.079.0' not found
Try `iptables -h' or 'iptables --help' for more information.
springer:~# iptables -A mule -p tcp --dport 4661 -s 202.007.080.0/24 -j
ACCEPT  
iptables v1.2.8: host/network `202.007.080.0' not found
Try `iptables -h' or 'iptables --help' for more information.

As you can see it fails.

If I remove the leading zeros for the above ones that failed;

springer:~# iptables -A mule -p tcp --dport 4661 -s 202.7.78.0/24 -j ACCEPT 
springer:~# iptables -A mule -p tcp --dport 4661 -s 202.7.79.0/24 -j ACCEPT 
springer:~# iptables -A mule -p tcp --dport 4661 -s 202.7.80.0/24 -j ACCEPT

It works.

Why does the first few work (with leading 0's, and then the next few fail)
it would appear some code in iptables evaluating the command line only works
upto a certain range or values)

Just to be certain it wasn't our chain causing the problem, I used the INPUT
chain (as seen below) and same problem occurs.

springer:~# iptables -A INPUT -p tcp --dport 4661 -s 202.007.076.0/24 -j
ACCEPT 
springer:~# iptables -A INPUT -p tcp --dport 4661 -s 202.007.077.0/24 -j
ACCEPT 
springer:~# iptables -A INPUT -p tcp --dport 4661 -s 202.007.078.0/24 -j
ACCEPT 
iptables v1.2.8: host/network `202.007.078.0' not found
Try `iptables -h' or 'iptables --help' for more information.
springer:~# iptables -A INPUT -p tcp --dport 4661 -s 202.007.079.0/24 -j
ACCEPT 
iptables v1.2.8: host/network `202.007.079.0' not found
Try `iptables -h' or 'iptables --help' for more information.
springer:~# iptables -A INPUT -p tcp --dport 4661 -s 202.007.080.0/24 -j
ACCEPT 
iptables v1.2.8: host/network `202.007.080.0' not found
Try `iptables -h' or 'iptables --help' for more information.

# drop leading 0's for those who don't work, and it now works. Why does
iptables accept it certain ranges 
# and then other times not. I would of thought if it accepts leading 0's at
all it should work all the time.

springer:~# iptables -A INPUT -p tcp --dport 4661 -s 202.7.78.0/24 -j ACCEPT

springer:~# iptables -A INPUT -p tcp --dport 4661 -s 202.7.79.0/24 -j ACCEPT

springer:~# iptables -A INPUT -p tcp --dport 4661 -s 202.7.80.0/24 -j ACCEPT


As you can see its not our chain causing the problem.

Anyone like to explain why it works with leading 0's sometimes and then hit
a certain range of octets and it don't. Did we indeed find a bug?

I look forward to hearing from anyone in regards to this strange find.
Atleast we can get around it by dropping the leading 0's for the ip ranges
that fail. But still, thought it might be important to bring it up. Since it
might get fixed in the next release of iptables if indeed being found to be
a bug.

--
Thanks
Michael Fox

