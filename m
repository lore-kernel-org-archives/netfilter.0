From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: How to redirect browsers with static proxy settings in iptables?
Date: Sun, 25 Jul 2004 14:24:07 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407251424.07223.Antony@Soft-Solutions.co.uk>
References: <BAY2-F18gRXrJrozCsV00007623@hotmail.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BAY2-F18gRXrJrozCsV00007623@hotmail.com>
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

On Sunday 25 July 2004 2:00 pm, Todd Landfried wrote:

> How does one know if a given packet is destined for a proxy server or not?

One doesn't.   That's why transparent proxying can work - proxies accept 
normal HTTP requests in exactly the same format as those sent direct to 
servers.

> Is there something in the packet that I can look for that tells me this?

No.   You can sometimes (but not always) tell from the reply that it came 
through a proxy, but you can't tell from the request.

> I know there's the port, but HTTP traffic also uses port 80.

Proxies commonly use port 8080 or 3128.

> The reason I ask is because the proxy address sometimes changes.

I don't understand (I think).   Are you trying to intercept HTTP requests from 
browsers (in which case you just intercept *all* TCP port 80/8080/3128 
traffic, no matter where it's addressed to), or are you saying that you can't 
keep track of where to redirect it to, because the proxy address moves around 
(in which case you're as stuck as someone running a browser would be, trying 
to direct requests to a moving proxy).

What exactly is the problem?

Regards,

Antony.

-- 
"I estimate there's a world market for about five computers."

 - Thomas J Watson, Chairman of IBM

                                                     Please reply to the list;
                                                           please don't CC me.


