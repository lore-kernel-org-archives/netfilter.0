From: Emanoil Kotsev <emanuel@abc.at>
Subject: Re: squid
Date: Tue, 29 Apr 2003 22:45:10 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3EAEE456.F0F6A2C9@abc.at>
References: <ABEKJILKOKKGGDJKHKDFOENCCAAA.patrick@vikus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: Patrick Ahler <patrick@vikus.com>
Cc: netfilter EMAIL <netfilter@lists.netfilter.org>

I am using squid @home behind a linux firewall and I dont think it is a matter
of squid to dislike your windows updates.

In our company we have a lot of windows(es) behind a linux firewall(s).

I think it might be that you have been too restrictive with your rules, couse
for windows is one port not enough ;-)

could you post some samples or you can try accepting the traffic that is
requested from your internal network with ESTABLISHED and RELATED


Patrick Ahler wrote:

> I know this is a bit off topic, but at first I thought it was a netfilter
> problem, now I'm convinced it's squid. I redirect my internal traffic
> through a squid proxy... the problem I'm running into is that I can't seem
> to get any windows updates to work for my machines using the proxy. When it
> begins to detect upgrades needed, it will just sit on 0%. Anyone else had
> this problem? If so, how'd you fix it?
>
> -=PaTriCK


