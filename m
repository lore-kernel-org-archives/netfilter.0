From: ATest@sbsdk12.org (Coutts, Ashe (Testing Account))
Subject: Iptables redirecting port 80 traffic to a FilterCube
Date: Tue, 16 Sep 2003 10:33:49 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F66E70D.25385.7ADD10@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
Content-description: Mail message body
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

The linux fw computer I am using has one interface on the WAN side: 
eth0, "$InternalNumber"
another facing the outside world router:
eth1, "$InternetNumber"

I have now had to install a Commercial Squid filtering proxy in the small LAN 
between eth1 and the router to the internet. Its IP# is "$InternetFilter".

If I place the "$InternetFilter" ip# along with port 3128 in a browser's proxy 
settings all is filtered as expected. But we have hundreds of users and would 
like to use iptables to send any port 80 traffic coming in eth0 on the fw out its 
eth1 and directly to the $InternetFilter ip number so that it will filter out the 
sites deemed inappropriate. I amd not sure I need to also change the port 
number but understanding how to do this would also be helpful.

I do not understand the syntax well enough to do what I wish.

Thanks in advance for any suggestions.




"Experience is not what happens to you, it
 is what you do with what happens to you"
       -- Aldous Huxley (1894-1963)

   Ashe Coutts (acoutts@sbsdk12.org)
   805.963.7751 Ext 260
   Fax 805.884.1557


