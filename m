From: Kevin Van Workum <kevin_vanw@yahoo.com>
Subject: Re: udp port forwarding from internal network to internet
Date: Thu, 27 Jan 2005 06:31:01 -0800 (PST)
Message-ID: <20050127143101.19462.qmail@web30905.mail.mud.yahoo.com>
References: <1106834832.5784.10.camel@hubcap.ljm.dom>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1106834832.5784.10.camel@hubcap.ljm.dom>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

--- Jason Opperisano <opie@817west.com> wrote:

> > I have one server machine connected to the
> internet
> > via a cable modem with a static IP and a small
> > internal network (10.0.0.0). All machines have the
> 2.4
> > kernel. I have a user who needs to run an
> application
> > on a few machines on the internal network. This
> > application needs to connect to a server located
> on
> > the internet via a udp port. How can I use
> iptables
> > (or a proxy or whatever) to do this?
> 
>   # adjust these to suit
>   INT_IF=eth1
>   EXT_IF=eth0
>   EXT_IP=`ip -4 -o addr sh $EXT_IF | awk '{print
> $4}' | cut -d"/" -f1`
>   SRV_IP=1.2.3.4
>   SRV_PORT=1111
> 
>   iptables -A FORWARD -m state --state
> ESTABLISHED,RELATED -j ACCEPT
> 
>   iptables -A FORWARD -i $INT_IF -o $EXT_IF -p udp
> -d $SRV_IP \
>     --dport $SRV_PORT -j ACCEPT
> 
>   iptables -t nat -A POSTROUTING -o $EXT_IF -j SNAT
> --to-source $EXT_IP
 
Thanks. Just so I understand what I'm doing here.
SVR_IP is the IP of the server on the internet that my
app on my internal network is conntacting? 
What is the effect of these rules?
Can you explain in english what these rules mean?
What IP does my app connect to, the internal IP of my
server with the internet connection?



	
		
__________________________________ 
Do you Yahoo!? 
Yahoo! Mail - You care about security. So do we. 
http://promotions.yahoo.com/new_mail

