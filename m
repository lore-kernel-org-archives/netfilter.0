From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: thanks Antony ... and one more thing ...
Date: Fri, 9 Apr 2004 09:28:33 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404090928.33558.Antony@Soft-Solutions.co.uk>
References: <007801c41e05$2681d850$da0da8c0@pisic>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <007801c41e05$2681d850$da0da8c0@pisic>
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

On Friday 09 April 2004 8:34 am, Danila Octavian wrote:

> Hi,

Good morning.

> Thank You very much for your help ( i bet you are already bored :-) )...

Bored?   No, I subscribed to the netfilter mailing list to stop me getting 
bored :)

>  ... and the other thing ... in fact I want to log together every
> destination my computer 192.168.13.222 goes ( except intip,extip,localnet)
> AND bytecount...
>
> ex.:  i want to be able to get a report like : 192.168.13.222 transferred
> xxxxxxxxxxbytes in 24h time and sepperately something like a list of
> destinations with how much is transferred to or from that particular
> destination. I know that will generate a lot of logs ... but i have a huge
> harddisk :-)
>
> also i know that request of mine seems exagerate ... but i wonder if is
> possible using only IPTABLES ...

No, not using netfilter (unless you wanted to create a rule for each possible 
destination, just in case some packets got sent there (but then you'd want to 
know what protocol was used, too, so you'd need even more rules....)).

I suggest you investigate something like iptraf, netwatch or snort.

Regards,

Antony.

-- 
One good tern deserves another.

                                                     Please reply to the list;
                                                           please don't CC me.


