From: "Sascha Reissner" <sascha.reissner@toxicnet.de>
Subject: Re: blocking Emails using ip address or domain name
Date: Wed, 9 Oct 2002 19:15:14 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001501c26fb7$6f0a75d0$026410ac@honor>
References: <OE33K5uA7liRtUvh18c00008bd4@hotmail.com>
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
To: Sundaram Ramasamy <rsundaram@hotmail.com>, netfilter@lists.netfilter.org

From: Sundaram Ramasamy 

> Hi,
> 
> We are getting lot of porn Email from mailme.dk, kiwwi.cz domain
> address. I have NATed mail server. Is it possible to block all incoming
> mails from these domains.

yes, tell your smtpd to reject them... this isnt a netfilter problem.


