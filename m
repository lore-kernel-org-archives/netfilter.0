From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: insecure script
Date: Tue, 23 Mar 2004 20:17:17 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403232017.17094.Antony@Soft-Solutions.co.uk>
References: <20040323195832.0ACB83BAD18@smtp.latinmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040323195832.0ACB83BAD18@smtp.latinmail.com>
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
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

On Tuesday 23 March 2004 7:58 pm, Jorge Garcia wrote:

> hi, im starting to write a paper about iptables security, and im trying to
> focus in the scripts. anyone can give some examples of insecure scripts or
> some tips to find my own insecurities in many scripts on the net. how
> hackers can take advantages in insecurities in the scriipts??

Here's a few ideas:

1. Don't use a default ACCEPT policy on INPUT or FORWARD chains.

2. Don't try to "block the bad stuff and allow the rest" - always "allow what 
you know you want, and block the rest"

3. Use stateful matching - don't just allow packets in to high port numbers on 
the basis that "they must be replies"

4. Don't assume that all packets from source port 53 are DNS.

5. Be careful about allowing all connections from internal clients to the 
Internet - somebudy might bring a compomised laptop into your network, or 
somebody inside the organisation might not be trustworthy.   Check for 
suspicious outgoing traffic as well as incoming.

Regards,

Antony.

-- 
If you can't find an Open Source solution for it, then it isn't a real 
problem.

                                                     Please reply to the list;
                                                           please don't CC me.


