From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: dhcrelay
Date: Fri, 28 Nov 2003 21:34:51 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031129023451.GA9393@cannon.eng.us.uu.net>
References: <1070051416.3fc7b058800c7@paris-hme1>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1070051416.3fc7b058800c7@paris-hme1>
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
Content-Transfer-Encoding: 7bit
To: zynkx <skydive@megamail.pt>
Cc: netfilter@lists.netfilter.org

On Fri, Nov 28, 2003 at 08:30:16PM +0000, zynkx wrote:

> i have this lan i am supposed to use dhcrelay on
> gateway 2 so the 192.168.100.0/24 machines can get an
> ip address. 192.168.0.1 is the dhcp serveer.i have the 
> input and output chain of the
> gateway 2 to drop.
> 
> my question is:
> 
> do those request require input and output to accept? i
> don't really think so because those packer are not for
> gateway 2 but are to be routed to 192.168.100.0/24
> machines...
> 
> what do you guys think of this??

Do you run the dhcrelay on gateway-2? Then the input should be open for that.
Then the relay is supposed to send out the relayed traffic out, then the output
should be open. However, dhcp broadcasts are being captured by netlink
raw packets (I suppose) so this might be a bit tricky. Give it a go and let
us know.

Ramin

> 
> sorry for the very bad drawing... 
> 
> tanx ;))))
> unix is user friendly. it's just selective when
> choosing
> friends.
> 
> -------------------------------------------------
> Email Enviado utilizando o servi?o MegaMail
> 
> ----- Final da mensagem re-enviada -----
> 
> 
> 
> unix is user friendly. it's just selective when 
> choosing 
> friends.
> 
> -------------------------------------------------
> Email Enviado utilizando o servi?o MegaMail
> 
> 

