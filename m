From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Email Server Timeouts
Date: Wed, 18 Feb 2004 18:55:31 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200402181855.31122.Antony@Soft-Solutions.co.uk>
References: <20040217192510.5073.55256.Mailman@netfilter-sponsored-by.noris.net> <2063.192.168.2.103.1077052825.squirrel@mail.empirekosher.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <2063.192.168.2.103.1077052825.squirrel@mail.empirekosher.com>
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

On Tuesday 17 February 2004 9:20 pm, Corey Furman wrote:

> When I enabled these rules, but then sendmail (on the same box) started
> timing out talking to other mail servers.  Does anyone see why?

Yes.   Your first INPUT rule blocks all TCP packets coming in to ports in the 
range  11001 to 65535 (why do you have this rule?).

That means on average there's an 85% chance that any connection from this 
machine will not be able to receive a response, depending on the source port 
it chooses to communicate from.

By the way, I'd just like to comment that it's not a good idea to run sendmail 
(or any other application for that matter) on your firewall.

Regards,

Antony.

-- 
Documentation is like sex.
When it's good, it's very very good.
When it's bad, it's still better than nothing.

                                                     Please reply to the list;
                                                           please don't CC me.


