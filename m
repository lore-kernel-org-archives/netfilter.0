From: "Hill, John" <jhill@columbuscontainer.com>
Subject: pptp patch
Date: Wed, 18 Jun 2003 08:27:25 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <84874F5F45111E48B53F4A3314BC4F3C389674@mail.columbuscontainer.com>
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

For the record netfilter is a terrific tool. I am grateful for the time and
hard work given by the netfilter team.


I have kernel 2.4.21 netfilter - latest cvs.

Built netfilter for extra added pptp support.

Recompiled kernel -- netfilter.

I have a win2000 pptp server behind a Linux firewall

Dnat gre and port 1723 to the pptp server.

I had 3 VPN connections working. When one closed the connection the kernel
panicked and died. I could not recover the error message. I was forced to
power off.


I have used 2.4.19 with Brian Kuschak's 2.4.19 pptp patch without problems.
He no longer supports the patch. I was hoping to upgrade the kernel.
Unfortunately the 2.4.19 patch will not work on 2.4.21 and the pptp
netfilter patch will not work for me. I had to roll back to 2.4.19.

I have several firewall installations and need PPTP and the ability to keep
kernels current.

Has anyone looked at Brian's code to see if it is practical to be
incorporated by the netfilter team? 

Any help would be appreciated.


--John Hill







