From: Philip Rhoades <phil@pricom.com.au>
Subject: IP drop question
Date: Fri, 28 Apr 2006 10:50:03 +1000
Message-ID: <1146185403.29318.7.camel@prix.pricom.com.au>
Reply-To: phil@pricom.com.au
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

People,

My config does not appear to be dropping unauthorised IPs - in my
logwatch file I am still getting lines like:

 Failed logins from:
    211.238.253.248: 54 times
 
 Illegal users from:
    202.110.131.27: 1 time
    211.238.253.248: 164 times
 
 **Unmatched Entries**
 pam_succeed_if(sshd:auth): error retrieving information about user
administrator : 1 time(s)

My config is this:

*filter
:INPUT DROP [0:0]
:FORWARD DROP [0:0]
:OUTPUT DROP [0:0]
-A INPUT -i lo -j ACCEPT
-A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
# -A INPUT -p tcp -i eth0 --dport 22 --sport 1024:65535 -j LOG
--log-prefix "ssh connect:"
-A INPUT -p tcp -m tcp -s 149.171.173.169 --dport 22 -j ACCEPT
-A INPUT -p tcp -m tcp -s 203.166.81.114 --dport 22 -j ACCEPT
# -A INPUT -p tcp -m state --state NEW,ESTABLISHED -m tcp --dport 22 -j
ACCEPT 
-A INPUT -p tcp -m state --state NEW,ESTABLISHED -m tcp --dport 25 --syn
-j ACCEPT
-A INPUT -p tcp -m state --state NEW,ESTABLISHED -m tcp --dport 53 --syn
-j ACCEPT
-A INPUT -p tcp -m state --state NEW,ESTABLISHED -m tcp --dport 80 -j
ACCEPT
-A INPUT -p tcp -m state --state NEW,ESTABLISHED -m tcp --dport 3128
--syn -j ACCEPT
-A OUTPUT -o lo -j ACCEPT
-A OUTPUT -m state --state NEW,RELATED,ESTABLISHED -j ACCEPT
-A INPUT -i lo -j ACCEPT
-A INPUT -i eth0 -j ACCEPT
-A INPUT -i eth1 -j ACCEPT
-A INPUT -p udp -m udp -s 149.171.173.169 --sport 53 -d 0/0 -j ACCEPT
-A INPUT -p udp -m udp -s 203.166.81.114 --sport 53 -d 0/0 -j ACCEPT
-A INPUT -p tcp -m tcp --syn -j REJECT
-A INPUT -p udp -m udp -j REJECT
-A INPUT -j LOG --log-level alert
-A INPUT -j LOG --log-prefix "Dropped: "
COMMIT


Can someone point out what I am doing wrong?

Thanks,

Phil.
-- 
Philip Rhoades

Pricom Pty Limited  (ACN 003 252 275  ABN 91 003 252 275)
GPO Box 3411
Sydney NSW      2001
Australia
Mobile:  +61:(0)411-185-652
Fax:     +61:(0)2-8221-9599
E-mail:  phil@pricom.com.au



