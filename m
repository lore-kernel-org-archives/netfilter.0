From: "Eric Wood" <eric@interplas.com>
Subject: Re: SSH Brute force attacks
Date: Tue, 10 May 2005 09:01:58 -0500
Message-ID: <003401c55569$31df1e00$467ba8c0@your4f1261a8e5>
References: <427B93EE.3030905@eccotours.dyndns.org>
	<427C4EA3.5090501@riverviewtech.net>
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
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="response"
To: netfilter@lists.netfilter.org

----- Original Message ----- 
From: "Taylor, Grant"
Subject: Re: SSH Brute force attacks
> # TARPIT will force the site that is SSHing in to us to timeout the 
> connection.  Sure stick you hand in my port, I'll grab hold of it and not 
> let go,
> # you will ahve to chew your arm off and grow a new one and try again.

Very nice.  This is going into my standard config.  hehe.
But for those interested, in order to get the recent module working for 
RHEL3, you must recompile iptables srpm and follow this bugzilla report:

https://bugzilla.redhat.com/bugzilla/show_bug.cgi?id=155608

-Eric Wood 


