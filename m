From: Zoilo <zoilo@xs4all.nl>
Subject: Re: Ideal iptables, kernel configuration for stability.
Date: Fri, 13 Sep 2002 18:27:30 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <02091318273005.05245@Lms>
References: <002101c25b3f$54521d10$6b01a8c0@s3ac>
Reply-To: zoilo@xs4all.nl
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <002101c25b3f$54521d10$6b01a8c0@s3ac>
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
To: Rowan Reid <rreid@studio3arc.com>, netfilter@lists.netfilter.org

On Friday 13 September 2002 18:05, Rowan Reid wrote:
> What is the ideal kernel version, and iptables version for the most
> stable config. The config should support FTP, Windows Media player, MSN
> and Yahoo messenger, and hopefully pptp. Key work being stable. I would
> also like to do some content filtering i.e. code red stuff.

I don't think there is any such thing as an "ideal" configuration; but I 
am running kernel 2.4.19 with latest netfilter/iptables release ie. pom 
20020825 and iptables-1.2.7a: no complaints, it runs great really.

Support for the services you are mentioning is a matter of (you) writing an 
appropriate iptables script to implement a customized stateful firewall to 
match your specs.

Netfilter/iptables is a packet filter, not a content filter; look elsewhere 
if you want to implement content filtering. You may start searching this 
mailing list for some suggestions.

-- 
Z.
------------------------------------------------------------
"If all you have is a hammer, everything looks like a nail."

