From: "Tarek W." <mailinglists1@hotpop.com>
Subject: Re: source-mac filtering
Date: Sun, 11 Jan 2004 21:05:36 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1073847935.13069.16.camel@carve.personal.localdomain>
References: <Sea1-F7gMiX6AZCFgXe000520e9@hotmail.com>
 <20040111163756.GA6168@cannon.eng.us.uu.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <20040111163756.GA6168@cannon.eng.us.uu.net>
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

On Sun, 2004-01-11 at 18:37, Ramin Dousti wrote:
> dhcpd takes and puts packets by netlink sockets which bypass the whole
> IP stack. So in short, you cannot filter the requests nor the response.
> 
> Ramin
> 
<snippage>

this is slightly off... iirc, some of the negotiation happens that way,
further negotiation does not... what I'm sure of however is that if u
don't explicitely allow dhcpd traffic server-side, negotiation does not
work client-side... which means that not all traffic if any bypasses
netfilter... don't have the time to investigate further server-side...
sorry...


