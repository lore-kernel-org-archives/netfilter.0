From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: bridged firewall wont DNAT http to proxy
Date: Thu, 22 Mar 2007 17:21:36 +0100 (MET)
Message-ID: <Pine.LNX.4.61.0703221720540.9555@yvahk01.tjqt.qr>
References: <002801c76bfc$b68971e0$6701a8c0@vaio>
	<Pine.LNX.4.64.0703212022510.23217@darkstar.sysinfo.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.64.0703212022510.23217@darkstar.sysinfo.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "R. DuFresne" <dufresne@sysinfo.com>
Cc: netfilter@lists.netfilter.org


On Mar 21 2007 20:24, R. DuFresne wrote:
>
> I believe you need ebtables to do any real firewalling with a bridged system.
> Which requires a kernel patch and the ebtables package.

ebtables: shipped by distro
kernel side code: included in mainline, hence shipped by distro

All set! :)


Jan
-- 

