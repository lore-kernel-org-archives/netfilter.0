From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: Nice ZoneAlarm that might be useful for Iptables
Date: Tue, 31 May 2005 01:44:36 -0500
Message-ID: <429C07D4.2060204@riverviewtech.net>
References: <429BDF9F.7070707@mindspring.com>	<429BF102.6020906@riverviewtech.net>
	<429C076D.6010703@linuxmail.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <429C076D.6010703@linuxmail.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Netfilter <netfilter@lists.netfilter.org>

> For something similar, there needs to be a way for iptables to store and 
> reference a list of approved process names (not necessarily their access 
> patterns such as dest port and so on but i suppose if the name list is 
> possible, it won't be that hard to tack on extra optional conditions) 
> and so a trojan running wget would trigger if wget was not in the list 
> of approved programs.

*nod*

Owner match extension does not have a way to know what process / user / group / command initiated the wget command.  But owner match extension could be used to make sure that only Apache (or what ever web server you are running) will send packets out from port 80, etc.



Grant. . . .

