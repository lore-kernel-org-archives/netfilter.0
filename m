From: "Yaniv Fine" <yanivf@fwgate.dyndns.org>
Subject: Dynamically deleting  a rule upon end of session
Date: Wed, 5 Mar 2003 23:40:40 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <MGEAKEOIFLHPHMKGGAJBOEPBCAAA.yanivf@fwgate.dyndns.org>
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
For this senario a remote user connected to the internet connect from his
laptop using an ssh client to the firewall-box (I know its weird but.. it
not a production machine) .
My questions are.
1. Is there a way to capture his current IP address and dynamically add a
rule the will forward any requests to the firewall on port 80 to my Web-Mail
on my LAN?.
2. Is the a way after the user closes his http connection to dynamically
delete this specific rule to prevent packet impersonating/hijacking?

   P.S the default rules in the Linux box is only to allow ssh connections.
And only upon user ssh login, a dynamic rule      will be added / deleted

Thank you.



*********************
Yaniv Fine
*********************



