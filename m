From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Send mail Secure(SSL): No, Socket Error
Date: Fri, 11 Oct 2002 18:20:50 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200210111720.g9BHKvL19784@vulcan.rissington.net>
References: <200210111434.52124.mklingens@ism.nl> <200210111629.26991.mklingens@ism.nl> <001b01c27140$457471a0$8c01a8c0@sundaram>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001b01c27140$457471a0$8c01a8c0@sundaram>
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

On Friday 11 October 2002 5:07 pm, Sundaram Ramasamy wrote:

> hi ,
>
> My external users are getting following error, while sending E-mail.
>
> Your server has unexpectedly terminated the connection. Possible causes for
> this include server problems, network problems, or a long period of
>
> inactivity. Subject 'Coming Late', Account: 'www.percipia.com', Server:
> 'www.percipia.com',
>
> Protocol: SMTP, Port: 25, Secure(SSL): No, Socket Error: 10053, Error
> Number: 0x800CCC0F
>
> I am not allowing SSL port? Do I need to open the SSL port for this error?

No, you don't need to allow SSL - that's why it says "Secure(SSL): No" - it 
is not using SSL.

The solution is to upgrade your mail client - getting them opff Outlook will 
solve an awful lot of other security problems as well :-)

If they don't want to run Kmail, Mutt, Mozilla etc, try them with something 
like Pegasus or Eudora...

Antony.

-- 

90% of network problems are routing problems.
9 of the remaining 10% are routing problems in the other direction.
The remaining 1% might be something else, but check the routing anyway.

