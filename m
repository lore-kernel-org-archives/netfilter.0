From: Scott Mayo <sgmayo@mail.bloomfield.k12.mo.us>
Subject: SNAT will only take the servers IP
Date: Fri, 03 Sep 2004 16:09:12 -0500
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <4138DD78.9070107@mail.bloomfield.k12.mo.us>
Reply-To: sgmayo@mail.bloomfield.k12.mo.us
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
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

I have my IPTABLES set up and was going to SNAT to multiple IP's on my 
network (IE.  IPTABLES -t nat -A POSTROUTING -o eth0 -j SNAT --to-source 
xxx.xxx.xxx.10-xxx.xxx.xxx.50)  The only way I can get it to work though 
is to SNAT --to-source xxx.xxx.xxx.215 which is the IP address of my 
server.  How come I cannot use anymore of my Class C network like I want to?

Does translating to multiple IPs instead of just 1 help with speed any?
Thanks for any information.
-- 
Scott Mayo
Technology Coordinator
Bloomfield Schools
PH: 573-568-4564
FA: 573-568-4565
Pager: 800-264-2535 X2549

WindowS
     LinUX!

Duct tape is like the force, it has a light side and a dark side and it
holds the universe together.

