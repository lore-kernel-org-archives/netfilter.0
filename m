From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Packet sniffing... sort of
Date: Sun, 11 Apr 2004 04:25:21 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404110425.21122.Antony@Soft-Solutions.co.uk>
References: <200404110154.39209.Antony@Soft-Solutions.co.uk> <20040411030853.GA13274@fake>
Reply-To: Netfilter <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040411030853.GA13274@fake>
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
To: Netfilter <netfilter@lists.netfilter.org>

On Sunday 11 April 2004 4:08 am, Richard Hector wrote:

> On Sun, Apr 11, 2004 at 01:54:39AM +0100, Antony Stone wrote:
> >
> > Can anyone think how I can see the content of packets from a browser
> > running on my machine, which is posting a form back to a remote server
> > somewhere, using HTTPS?
>
> Can you write your perl program in the form of a proxy - so your browser
> connects to it in the clear, and it sends the requests on using ssl?
> Then you can either dump the traffic from your program, or sniff it
> ahead of the proxy in the normal way.

Hm, that's not a bad idea - I can set my browser to use "NULL" encryption 
(which the real server won't accept :), and then turn it back into normal 
DES/RSA on the proxy, connecting to the outside world.

Thanks for the suggestion.

Regards,

Antony.

-- 
If builders made buildings the way programmers write programs, then the first 
woodpecker to come along would destroy civilisation.

                                                     Please reply to the list;
                                                           please don't CC me.


