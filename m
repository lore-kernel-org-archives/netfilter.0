From: David Cannings <lists@edeca.net>
Subject: Re: IPTables and Squid
Date: Fri, 23 Apr 2004 13:52:24 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404231352.24340.lists@edeca.net>
References: <20040423122545.1601.qmail@web8305.mail.in.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040423122545.1601.qmail@web8305.mail.in.yahoo.com>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

On Friday 23 April 2004 13:25, Sameer Gurung wrote:
>     I'm new to iptables and i'm trying to share an
> internet connection in my organization.....i would
> like to run squid too ( for logon and such )....Any
> pointers... Any help would be great

I'm not quite sure what sort of logon you envision with Squid as it is a 
web proxy, perhaps you mean authentication for browsing the WWW.  
However, that is a Squid issue.  This page gives quite a good tutorial 
for using Squid as a transparent proxy, which is what you would want if 
you were to force all HTTP requests through Squid:

http://en.tldp.org/HOWTO/TransparentProxy.html#toc4


The "Packet Filtering" and "NAT Howto" can both be found at this page in a 
number of languages:

http://netfilter.org/documentation/index.html#documentation-howto


And an excellent tutorial by Oskar is available at:

http://iptables-tutorial.frozentux.net/iptables-tutorial.html

I hope those links help,

David

