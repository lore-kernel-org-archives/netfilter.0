From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Need Help ..!
Date: Sun, 11 Jan 2004 14:41:39 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401111441.39057.Antony@Soft-Solutions.co.uk>
References: <20040111120049.44784.qmail@web40205.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040111120049.44784.qmail@web40205.mail.yahoo.com>
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

On Sunday 11 January 2004 12:00 pm, HEMANT BAANDAL wrote:

> Hey guys,
>
>    Is there anyway i can detect proxied ips' behind my
> nat box. I am using iptables-1.2.7a-2, i need to
> detect natted or proxied ips passing through my linux
> box. Can anyone help me with this.

Proxied IPs may be detectable by looking at the OSI layer 7 content of the 
packets (ie: not using netfilter), to see whether the proxies give themselves 
away by some sort of header (eg: http proxies commonly insert a header from 
which you can tell it's not a direct connection).

NATted IPs can (I believe) be detected by analysis of the source ports and/or 
sequence numbers.   Try a google search for something like "nat detect 
sequence source port"?

Why do you want to do this?   There may a better solution to your problem than 
the specific question you have asked?

Antony.

-- 
If you want to be happy for an hour, get drunk.
If you want to be happy for a year, get married.
If you want to be happy for a lifetime, get a garden.

                                                     Please reply to the list;
                                                           please don't CC me.


