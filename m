From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: transparent IRC proxy: doesnt work
Date: Thu, 23 Oct 2003 14:00:19 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200310231400.19551.Alistair@nerdnet.ca>
References: <9FEBBE3B5C27D311B0B90050041E59B00439EFBD@ziggy.prideindustries.com> <001901c39976$d2d57120$6500a8c0@SYFLO>
Reply-To: Alistair@nerdnet.ca
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001901c39976$d2d57120$6500a8c0@SYFLO>
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
To: Sylvain BERTRAND <jowy@2001-space-odyssey.net>
Cc: netfilter@lists.netfilter.org

On October 23, 2003 11:03 am, Sylvain BERTRAND wrote:
> My apologiesHi everyone,
>
> I have a router/firewall on a public /24. I installed tircproxy in order to
> have a transparent proxy (to filter DCC send requests). Here are the lines
> related to IRC in my rc.firewall:
>
> ${IPTABLES} -t nat -A PREROUTING -s ${INTERNAL_LAN} -p tcp --dport
> 6660:6669 -j REDIRECT --to-port 7666 ${IPTABLES} -t nat -A PREROUTING -s
> ${INTERNAL_LAN} -p udp --dport 6660:6669 -j REDIRECT --to-port 7666
>
> and here's the command I use to launch the proxy:
>
> tircproxy -s 7666 -b ${MY_IP} -S -K -R -I
>
> There are several strange things:
> - many connexions between my internal lan and external servers on port 6667
> still exist... they shouldnt since I redirected the 6667 trafic? - many
> connexions between my router on ports >1024 and.... my router's port 7666!
> I was expecting local machines to connect on 7666, but not the router
> itself?
>
> IRC seems to be working for clients, but I think it does through direct
> connexions... Can anyone help me about that?
>

	This is what DCC does. Direct client to client connection.  Once the 
	initial communication is done from the clients to the server and back, 
	the actual transfer is direct from client to client

	For the record, why are you using a proxy? -- does this proxy do filtering on 
some other level? --  is this filtering working?

>
> Sylvain

-- 

	Alistair Tonner
	nerdnet.ca
	Senior Systems Analyst - RSS
	
     Any sufficiently advanced technology will have the appearance of magic.
	Lets get magical!

