From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: mails not going thru'
Date: Mon, 09 May 2005 01:07:12 -0500
Message-ID: <427EFE10.4080704@riverviewtech.net>
References: <f036d7f0a1a5.f0a1a5f036d7@vsnl.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <f036d7f0a1a5.f0a1a5f036d7@vsnl.net>
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
To: netfilter@lists.netfilter.org

> The server for which this iptables is being 
> written. 
> 
> Client connected to the Mandrake 10.1 server.
> With eth0 as WAN and eth1 as LAN.
> 
> I am not running any mail server.
> client send/recieve thru' firewall
> based iptables that is being discussed.

If you are trying to configure your email clients on your local LAN to send email out via the internal IP address of your firewall (that is not running any email it's self) via redirecting inbound TCP connections to port 25 / 587 to a mail server somewhere on the internet?  If that is the case you will need to set up a DNAT rule that points to the mail server that you want to send email with.

Other than that I can't see any thing that would be preventing your email from functioning.



Grant. . . .

