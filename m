From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: icmp messages to spoofed address acceptedby -m conntrack --ctstate ESTABLISHED,RELATED
Date: Fri, 19 Mar 2004 21:25:45 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403192125.45552.Antony@Soft-Solutions.co.uk>
References: <20040319204142.GA3294@salty>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040319204142.GA3294@salty>
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
To: netfilter list <netfilter@lists.netfilter.org>

On Friday 19 March 2004 8:41 pm, Jim Laurino wrote:

> On 2004.03.18 17:35, Jim Laurino  - nfcan.x.jimlaur@dfgh.net wrote:

> > I added a rule with this matching pattern to
> > the iptables firewall on my machine.
> >
> > -m conntrack --ctstate ESTABLISHED,RELATED
> >
> > It is matching icmp packets about an
> > unreachable destination that are sent here
> > because someone is spoofing my IP address.

On Thursday 18 March 2004 10:53 pm, Antony Stone wrote:

> I agree with this latter explanation.
>
> http://isc.incidents.org/port_details.html?port=1026
> http://www.mynetwatchman.com/kb/security/articles/popupspam
> http://www.lurhq.com/popup_spam.html

Regards,

Antony.

-- 
In Heaven, the police are British, the chefs are Italian, the beer is Belgian, 
the mechanics are German, the lovers are French, the entertainment is 
American, and everything is organised by the Swiss.

In Hell, the police are German, the chefs are British, the beer is American, 
the mechanics are French, the lovers are Swiss, the entertainment is Belgian, 
and everything is organised by the Italians.

                                                     Please reply to the list;
                                                           please don't CC me.


