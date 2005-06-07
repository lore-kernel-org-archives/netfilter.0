From: Daniel Ivanov <sertys@supportivo.org>
Subject: Re: forwarding ports from aliased ip addresses
Date: Tue, 07 Jun 2005 12:56:24 +0300
Message-ID: <42A56F48.3020804@supportivo.org>
References: <42A4C90B.8040306@doki-doki.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42A4C90B.8040306@doki-doki.net>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Yes, just use -d ip_of_client insted.
iptables -A FORWARD -i eth5 -o ethX -d dedicated_ip_of_client -j FORWARD

Mike Pepe wrote:

> Hi all. I'm new to the list but not to netfiler.
>
> I have a firewall built, with eth5 on the internet. It accepts 
> connections on a few ports from allowed hosts and forwards them to 
> boxes in the DMZ. It works great.
>
> I have another client that wants a box configured similarly. I would 
> like to add another internet ip as eth5:1 and then forward certain 
> ports on that new IP to a different box in the DMZ.
>
> using -i eth5:1 doesn't work.
>
> Is this even possible? I've been up and down the man page and I can't 
> seem to figure out a way to differentiate the alias from the "normal" 
> ip. I guess I could add another network card and duplicate the scripts 
> but this seems so wasteful to me.
>
> Hoping someone can help me with this!
>
> thanks
>
> -Mike
>

