From: Payal Rathod <payalrathod@gmail.com>
Subject: a NAT question
Date: Thu, 15 Jul 2004 16:21:17 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <f51b72bc04071503513a7b2dd0@mail.gmail.com>
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
To: netfilter <netfilter@lists.netfilter.org>

Hi,
We have been allocated 2 more IPs by our ISP for a period of 1 month
for our purpose. Now these 2 IPs will be assigned to 2 Windows
machines which are to be accessed from outside. We want port 21 or one
machine to be accessed from outside and port 80 and 9001, 25 of other
machine. Which is the best way to allow access to these machines from
outside still having them under my firewall? I thought of having ip
aliases on the Linux box and forwarding the connections to the
respective windows box.
Can someone explain an easy way for this? 
With warm regards,
-Payal

