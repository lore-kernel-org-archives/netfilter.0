From: "Collins, Kevin" <KCollins@nesbittengineering.com>
Subject: RE:  (LONG) DNS/Router/Firewall question...
Date: Thu, 13 Mar 2003 15:35:52 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <5DE7560BBF09D6119ED100B0D03D8426013927@MAIL-SERVER>
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
To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

WARNING!!!!   WARNING!!!!! LONG POST AHEAD....

Athan,

I've answered the questions you asked below.  The answers are very long, so
bear with it.  I wanted to provide as much info as possible.

I think the interesting stuff is in the TCPDUMP section.  Look there is the
results of the other questions are what you expected to see.
-----------------------------------------------

On Thursday, March 13, 2003 11:53 AM, Athan scribed:

> First guess is that whatever app is trying to 'do dns' is 
> first trying a DNS server that is NOT responding due to
> the firewall rules, and after timeouts ends up trying one
> that DOES work.

Well, not quite.  I can get Internal DNS resolution just fine, but External
Resolution doesn't work.  Here's what I've tried:

Scenario 1:  On the Firewall box itself.  With NO firewall running.  Lookup
a local box:
-----------------------------------------------
[root@victory root]# dig valkyrie.nesbitt.local

; <<>> DiG 9.2.1 <<>> valkyrie.nesbitt.local
;; global options:  printcmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NXDOMAIN, id: 27247
;; flags: qr aa rd ra; QUERY: 1, ANSWER: 0, AUTHORITY: 1, ADDITIONAL: 0

;; QUESTION SECTION:
;valkyrie.nesbitt.local.                IN      A

;; AUTHORITY SECTION:
nesbitt.local.          3600    IN      SOA     temp.nesbitt.local.
kcollins.nesbittengineering.com. 2003031200 21600 1800 2419200 3600

;; Query time: 2 msec
;; SERVER: 127.0.0.1#53(127.0.0.1)
           ^^^^^^^^^^^^
;; WHEN: Thu Mar 13 11:56:22 2003
;; MSG SIZE  rcvd: 112
-----------------------------------------------
No problems doing the lookup or returning the answer.  Very Quick.

Scenario 2:  On the Firewall box itself.  With NO firewall running.  Lookup
an Internet location:
-----------------------------------------------
[root@victory root]# dig www.google.com

; <<>> DiG 9.2.1 <<>> www.google.com
;; global options:  printcmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 44972
;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 4, ADDITIONAL: 0

;; QUESTION SECTION:
;www.google.com.                        IN      A

;; ANSWER SECTION:
www.google.com.         300     IN      A       216.239.57.100

;; AUTHORITY SECTION:
google.com.             345600  IN      NS      ns2.google.com.
google.com.             345600  IN      NS      ns3.google.com.
google.com.             345600  IN      NS      ns4.google.com.
google.com.             345600  IN      NS      ns1.google.com.

;; Query time: 558 msec
;; SERVER: 127.0.0.1#53(127.0.0.1)
           ^^^^^^^^^^^^ 
;; WHEN: Thu Mar 13 11:59:06 2003
;; MSG SIZE  rcvd: 120
-----------------------------------------------
No problems doing the lookup.  Returning the answer took a second as the
lookup was forwarded to the Internet DNS.  But notice that the local DNS
server still did the job - as it should have.

Scenario 3:  On the Firewall box itself.  With firewall running.  Lookup a
Local box:
-----------------------------------------------
[root@victory root]# dig www.google.com

; <<>> DiG 9.2.1 <<>> www.google.com
;; global options:  printcmd
;; connection timed out; no servers could be reached
[root@victory root]# dig valykyrie.nesbitt.local

; <<>> DiG 9.2.1 <<>> valykyrie.nesbitt.local
;; global options:  printcmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 26676
;; flags: qr aa rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 2, ADDITIONAL: 2

;; QUESTION SECTION:
;valykyrie.nesbitt.local.       IN      A

;; ANSWER SECTION:
valykyrie.nesbitt.local. 86400  IN      A       10.200.8.6

;; AUTHORITY SECTION:
nesbitt.local.          86400   IN      NS      victory.nesbitt.local.
nesbitt.local.          86400   IN      NS      temp.nesbitt.local.

;; ADDITIONAL SECTION:
temp.nesbitt.local.     86400   IN      A       10.200.8.8
victory.nesbitt.local.  86400   IN      A       10.200.8.254

;; Query time: 2 msec
;; SERVER: 127.0.0.1#53(127.0.0.1)
           ^^^^^^^^^^^^
;; WHEN: Thu Mar 13 12:47:27 2003
;; MSG SIZE  rcvd: 130
-----------------------------------------------
As in Scenario No. 1 - Normal Lookup, quick response.

Scenario 4:  On the Firewall box itself.  With firewall running.  Lookup an
Internet Location:
-----------------------------------------------
[root@victory root]# dig www.google.com

; <<>> DiG 9.2.1 <<>> www.google.com
;; global options:  printcmd
;; connection timed out; no servers could be reached
-----------------------------------------------
Very long time to do anything.  And, as you can see, nothing is returned.

DNS Clients of the box perform the same way.  With no firewall, everything
is fine.  With the Firewall Internal stuff is ok, but external is a no-go.
So it's obviously something that Firewall Rules I have in place are doing.
Since I have a "deny by default" policy going on, I can certainly see that
happening.

> So, if it's a unix-like machine inside the network seeing 
> the problem, what's in the /etc/resolv.conf ?

The Linux Router/Firewall box's resolv.conf:
-----------------------------------------------
search nesbitt.local
nameserver 127.0.0.1
nameserver 208.235.88.10  <-- ISP's DNS Server
-----------------------------------------------

Internal Linux Client's resolv.conf  (Windows clients simliar)
-----------------------------------------------
search nesbitt.local
nameserver 10.200.8.254   <-- Linux Router/Firewall running DNS
nameserver 208.235.88.10  <-- ISP's DNS Server
-----------------------------------------------

> When a lookup is attempted from an internal machine with 
> the firewall up what does a 'tcpdump -ni <extif> port 53' show ?

Internal Lookup: 'dig stargazer.nesbitt.local'
-----------------------------------------------
13:09:22.013205 10.200.8.93.32791 > 10.200.8.254.domain:  3440+ A?
stargazer.nesbitt.local. (41) (DF)
13:09:22.013989 10.200.8.254.domain > 10.200.8.93.32791:  3440* 1/2/2
A[|domain] (DF)
-----------------------------------------------
Works fine.

External Lookup: 'dig www.google.com'
-----------------------------------------------
13:06:50.716939 10.200.8.93.32790 > 10.200.8.254.domain:  11906+ A?
www.google.com. (32) (DF)
13:06:55.718087 10.200.8.93.32790 > 10.200.8.254.domain:  11906+ A?
www.google.com. (32) (DF)
--
13:08:20.719892 10.200.8.254.domain > 10.200.8.93.32790:  11906 ServFail
0/0/0 (32) (DF)
13:08:20.720017 10.200.8.254.domain > 10.200.8.93.32790:  11906 ServFail
0/0/0 (32) (DF)
-----------------------------------------------
Fails.  The "Forward DNS Lookup" to the Internet DNS never takes place.
What odd here is that my laptop (the Linux Client) never polls the ISP's DNS
server - at all.  I never see the request.


NO FIREWALL External Lookup: 'dig www.google.com'
-----------------------------------------------
14:10:44.194224 10.200.8.93.32793 > 10.200.8.254.domain:  32647+ A?
www.google.com. (32) (DF)
14:10:44.195281 204.117.34.34.32769 > 192.33.14.30.domain:  22465 [1au] A?
www.google.com. OPT  UDPsize=2048 (43) (DF)
14:10:44.301794 192.33.14.30.domain > 204.117.34.34.32769:  22465 FormErr-%
[0q] 0/0/0 (12)
14:10:44.302217 204.117.34.34.32769 > 192.33.14.30.domain:  53815 A?
www.google.com. (32) (DF)
14:10:44.407192 192.33.14.30.domain > 204.117.34.34.32769:  53815- 0/4/4
(168)
14:10:44.408445 204.117.34.34.32769 > 216.239.34.10.domain:  22351 [1au] A?
www.google.com. OPT  UDPsize=2048 (43) (DF)
14:10:44.520656 216.239.34.10.domain > 204.117.34.34.32769:  22351*-% 1/4/5
A 216.239.33.101 (195)
14:10:44.521820 10.200.8.254.domain > 10.200.8.93.32793:  32647 1/4/0 A
216.239.33.101 (120) (DF)
-----------------------------------------------

So the question is how do I allow the "Forward Lookups" to happen?  The
first thing I noticed was that my original DNS rules only allowed traffic
between my ISP and me.  I've modified those rules to what you see below:

echo "   Allowing DNS Forward Lookups to take place..."
$IPTABLES -A OUTPUT -o $EXTIF -p udp -s $EXTIP --sport $UNPRIVPORTS \
          -d 0.0.0.0 --dport 53 -m state --state NEW -j ACCEPT
$IPTABLES -A INPUT -i $EXTIF -p udp -s 0.0.0.0 --sport $UNPRIVPORTS \
          -d $EXTIP --dport 53 -m state --state ESTABLISHED,RELATED -j
ACCEPT

But they don't work either.  What am I missing?

Thanks,

Kevin L. Collins, MCSE
Systems Manager
Nesbitt Engineering, Inc.

