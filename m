From: "Yaniv Fine" <yanivf@fwgate.dyndns.org>
Subject: Dynamically deleting  a rule upon end of session
Date: Sun, 16 Mar 2003 13:30:58 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <MGEAKEOIFLHPHMKGGAJBAEPKCAAA.yanivf@fwgate.dyndns.org>
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

Hi list.
I am running iptables v1.2.7a on my debian box that acts as a firewall and a
port-forwarder to my WebMail on my LAN.
For this senario a remote user connected to the Internet connect from his
laptop using a web-interface on port 8080, after the user authenticates a
Perl script will grab the users IP address.
The idea is to create a secure webmail.
If a hacker tries to scan my Linux box, he only gets port
8080(authentication web) open and if a rule is created for a specific IP
address, only this IP address is open to port 80 to my LAN and port 8080 for
the authentication web
My questions are.
1. Is there a way to capture his current IP address and dynamically add a
rule the will forward any requests to the firewall on port 80 to my Web-Mail
on my LAN?
2. Is there a way after the user closes his http connection to dynamically
delete this specific rule to prevent packet impersonating/hijacking?
3. Is there a build in module in Iptables that add a rule when a new session
established and delete it upon end session?
4.is there an example of a Perl script that grabs then current authenticate
user IP address?


*********************
Yaniv Fine
*********************



