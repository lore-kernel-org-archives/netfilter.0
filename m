From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Matching text from HTTP?
Date: Sat, 13 Mar 2004 15:54:51 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403131554.51379.Antony@Soft-Solutions.co.uk>
References: <002601c40908$81d206b0$6400a8c0@slave1>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <002601c40908$81d206b0$6400a8c0@slave1>
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

On Saturday 13 March 2004 2:35 pm, Mihael Kukec wrote:

> Is that possible? Matching text from HTTP?

It is just about possible (with the string match), however it is not at all 
recommended:

1. It will only match if the entire string is contained within one packet - if 
the string you search for crosses packet boundaries, netfilter cannot match 
it.

2. It can only search for plaintext strings, and an increasing amount of HTTP 
content these days is compressed (gzipped, basically) during transmission.

> And possibly changing it?

No, netfilter cannot change the contents of a packet (only the contents of 
certain headers).

> For example, change every occurrence of ABC with *** ?

Use Squid, or Apache as a proxy.

Antony.

-- 
There's no such thing as bad weather - only the wrong clothes.

 - Billy Connolly

                                                     Please reply to the list;
                                                           please don't CC me.


