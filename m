From: Martijn Lievaart <m@rtij.nl>
Subject: Re: URL Logging
Date: Mon, 21 May 2007 22:57:21 +0200
Message-ID: <465207B1.50209@rtij.nl>
References: <922E6125ECDCDB4F9F1B845B7DE99ECA015CCFCF@do-exch04.do.ad.losrios.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <922E6125ECDCDB4F9F1B845B7DE99ECA015CCFCF@do-exch04.do.ad.losrios.edu>
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
To: "Muzinich, Mike" <MuziniM@losrios.edu>
Cc: netfilter@lists.netfilter.org

Muzinich, Mike wrote:
> Is anyone aware of a non-proxy product i.e. Squid that will log full URL information for HTTP requests that is meant to be run as a daemon on a Linux router/firewall?  I don't believe there is an elegant way to do this with IPTABLES.
>
>   

Run tethereal on the ports you're interested in, grep the output for the 
http commands you're interested in and postprocess the output to show 
only the information you want.

HTH,
M4


