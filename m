From: Payal Rathod <payalrathod@gmail.com>
Subject: NATting again
Date: Fri, 16 Jul 2004 21:20:39 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <f51b72bc04071608505bc1da93@mail.gmail.com>
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
A simple quesiton. I want to nat few ports from my Linux server to
windows machine.
I have a seperate IP for it. I want to allow users to connect to port
21, 80, 8443 of the windows machine from outside world as well as LAN
users ( the windows box will be in DMZ). Do I write a seperate command
for each port? I am unable to use multiple ports at a time. Can
someone give an example? Also, does RELATED & ESTABLISHED rules in
FORWARD and INPUT chains cover this too?

With warm regards,
-Payal

