From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: [SPAM] Re: rules for skype
Date: Mon, 02 May 2005 14:33:44 -0500
Message-ID: <42768098.3090709@riverviewtech.net>
References: <20050502150901.DAEF39E9F4@dd6816.kasserver.com><42764919.60507@lopsch.com>	<42764E36.7080300@riverviewtech.net><BAY107-DAV7808D3CABD608123BCF2CB7270@phx.gbl>	<42765EE7.7040205@riverviewtech.net>
	<BAY107-DAV9D47163CC3C594D794B10B7270@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY107-DAV9D47163CC3C594D794B10B7270@phx.gbl>
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

> For the layer-7 patterns to work with iptables, you have to patch 
> iptables. Here is the layer7 project URL:
> http://l7-filter.sf.net

*nod*  I've played with layer 7 pattern matching before on my test router at home and was very impressed with it.  :)

> Note: They have a skype pattern matching only the voice traffic. For 
> some reason they don't have the one that matches the authentication 
> packets.

Interesting...

> Here is the one I use:
> ------- begin-----
> skype
> ^\x16\x03\x01$|^\x17\x03\x01$
> -------end-------

Thanks.

>> *nod*  This is unfortunately the very nature of these troublesome 
>> protocols.  I'd also appreciate seeing your config if you could show 
>> it to us.
> 
> Sorry. Could you please tell me what config you are talking about?

As Curly from the Three Stooges would say "Soytenly!"

I'm interested in your iptables script (iptables-save) and tc script to see how you are doing things.  This is more personal interest to see how others are doing things to see if I can gain any pointers.



Grant. . . .

