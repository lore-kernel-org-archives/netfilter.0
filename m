From: Fabrice MARIE <fabrice@netfilter.org>
Subject: Re: Time based rules ...
Date: Thu, 14 Nov 2002 14:54:03 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200211141454.03963.fabrice@netfilter.org>
References: <1037199668.4556.30.camel@rayw.knowledgefactory.co.za> <1037248941.4556.54.camel@rayw.knowledgefactory.co.za> <200211141144.21999.dharmu@nsecure.net>
Reply-To: fabrice@netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200211141144.21999.dharmu@nsecure.net>
Content-Disposition: inline
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
To: dharmu@nsecure.net, Raymond Leach <raymondl@knowledgefactory.co.za>
Cc: Netfilter Mailing List <netfilter@lists.netfilter.org>


Hi,

On Thursday 14 November 2002 14:14, Dharmendra.T wrote:
> But I don't think we can specify the time option in iptables. If any
> modules are there using which we can specify the time let us know.
> [...]

You can have a look at:
http://www.netfilter.org/documentation/HOWTO/netfilter-extensions-HOWTO.html
and particularly at :
http://www.netfilter.org/documentation/HOWTO/netfilter-extensions-HOWTO-3.html#ss3.17

> > > On Wednesday 13 November 2002 20:31, Raymond Leach wrote:
> > > > Hi
> > > > Is there a way to put time restrictions on rules?
> > > > For eaxmple, something like:
> > > > iptables -A FORWARD -i eth0 -p tcp -sport 1024: -dport 1024: -time
> > > > 0700:1700 -j DROP
> > > > It would be nice ...
> > > > Ray

Have a nice day,

Fabrice.
--
Fabrice MARIE

"Silly hacker, root is for administrators"
       -Unknown

