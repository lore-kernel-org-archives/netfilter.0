From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: IPTABLES + IPROUTE2
Date: Fri, 23 Jan 2004 23:51:31 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401232351.31891.Antony@Soft-Solutions.co.uk>
References: <EHENIKBEJAMHPLPJOJBPCEDKDIAA.lucho@galix.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <EHENIKBEJAMHPLPJOJBPCEDKDIAA.lucho@galix.com>
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

On Friday 23 January 2004 11:44 am, L.Malinov wrote:

> Hi there,
>
> I have the following configuration: Local Net with Linux RedHat 9.0 Squid
> proxy server (with one net card) and 2 gateways - router1 and router2. The
> default gateway for everyone including the proxy is router1. I'd like, the
> http request from the local net sent to the proxy to be forwarded to the
> Internet via router2.

I'd suggest the simplest way to achieve this is to set the default route on 
the proxy server to be router2.

Antony.

-- 
Having been asked for a reference for this man,
I can confirm that you will be very lucky indeed if you can get him to work 
for you.

                                                     Please reply to the list;
                                                           please don't CC me.


