From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Problem setting Default policy 'DROP'
Date: Sun, 1 Feb 2004 08:25:52 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200402010825.52368.Antony@Soft-Solutions.co.uk>
References: <20040201073938.71937.qmail@web60404.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040201073938.71937.qmail@web60404.mail.yahoo.com>
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
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

On Sunday 01 February 2004 7:39 am, ads nat wrote:

> Script changes default policy of INPUT, OUTPUT and
> FORWARD to DROP. When I change default to DROP in my
> script my connection drops.
>
> Any idea what should be problem?

This indicates that your ruleset does not have an ACCEPT rule for "your 
connection".

I suggest you leave the default policy at ACCEPT, add a LOG rule at the end of 
the chain (presumably INPUT, if you're talking about your connection to the 
firewall itself), and then see what packets get LOGged as a result of 
continuing to use your connection.

Whatever gets LOGged will tell you what you need to add a rule to ACCEPT.

Regards,

Antony.

-- 
Documentation is like sex.
When it's good, it's very very good.
When it's bad, it's still better than nothing.

                                                     Please reply to the list;
                                                           please don't CC me.


