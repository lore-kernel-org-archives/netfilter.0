From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: public ip on LAN
Date: Fri, 2 Jan 2004 18:42:07 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401021842.07740.Antony@Soft-Solutions.co.uk>
References: <6.0.0.22.0.20040102224831.044036c0@amitpasari.com> <3FF5A9FB.7000302@nerim.net> <1073068231.18243.11.camel@e500>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1073068231.18243.11.camel@e500>
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
To: Netfilter <netfilter@lists.netfilter.org>

On Friday 02 January 2004 6:30 pm, Craig Steadman wrote:

> The issue with redirecting web traffic using DNAT is that if
> any of the web pages have absolute links then they fail to
> work for clients connecting from the internet.

When you say "absolute links", do you mean URLs containing IP addresses 
instead of hostnames?

If you mean "absolute links" as distinct from "relative links" (using 
hostnames) then providing you have your DNS set up correctly, so that 
external queries receive public addresses and internal queries get internal 
addresses, there should be no problem.

> Does anyone know of an apache module that can be configured to
> parse and change the anchors in a html page on the fly, for this
> scenario ?

I suspect that mod_rewrite may be able to do what you want; however I 
recommend you also investigate a proxy server (Apache or Squid would do the 
job) in what is generally accelerator mode (ie the proxy is at the server end 
of the link instead of the client end), as this can listen on a public IP 
address, receive queries from the Internet, and then make local requests to 
the true servers on private IP addresses.

The same proxy could be used for internal and external clients if you wish.

Antony.

-- 
Abandon hope, all ye who enter here.
You'll feel much better about things once you do.

                                                     Please reply to the list;
                                                           please don't CC me.


