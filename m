From: Mitesh P Choksi <murli@icafe.co.tz>
Subject: SNAT to allocat IP from an IP Pool
Date: Thu, 26 Sep 2002 00:29:37 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3D922AC1.20007@icafe.co.tz>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

I have a set of  dial in users whom I have givne 
192.168.130.0/255.255.255.0 and would like to allocate them from an ip 
address range 16 ip addresses of x.x.x.96/255.255.255.240

Is this possible using SNAT, I could not find a documentation that will 
exactly let me know this from the site.

I need to know what will happen when iptables runs out of IP addresses? 
what will happen for incoming connections to the IP x.x.x.99, will it be 
forwarded back to the "that time" SNAT of for eg. 192.168.130.43.

The nearest I reached to my requirements was on a web site that had 
LEASE as a target command.

Let me know what do you people thing about it?

Mitesh


