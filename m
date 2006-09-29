From: Elvir Kuric <omasnjak@yahoo.com>
Subject: Re: Forward Specific Ports to Different Host/IP
Date: Fri, 29 Sep 2006 11:20:27 -0700 (PDT)
Message-ID: <20060929182027.11962.qmail@web56201.mail.re3.yahoo.com>
References: <bd573cf00609290952r5f8bfe54gdf24c66071378fa3@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <bd573cf00609290952r5f8bfe54gdf24c66071378fa3@mail.gmail.com>
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
To: Ranjith Kumar <ranjitbat@gmail.com>, netfilter@lists.netfilter.org



Hi, 
try this for web server ...


iptables -t nat -A PREROUTING -s any/0 -d
your_external_ipadress -p tcp --dport 80 -j DNAT
--to-destination your_internal_ipaddress

Regards 

Elvir Kuric

PS: In this case we assume that your server in
internal network is listening on port 80. If in your
case it is not true, the you should use
your_internal_ipaddress:PORT_SERVER_LISTENING


--- Ranjith Kumar <ranjitbat@gmail.com> wrote:

> Hi All,
> 
> I have two linux machinces. I want to forward
> specific ports from
> mahince1 to machine2.
> 
> Machine1: Having 2 Network Interfaces, One interface
> is connected to
> the Internet with Static IP, and the second one is
> private IP
> connected to LAN.
> 
> Machine2: Having 1 Network Interface configured with
> private IP. This
> host is my mail server(postfix).
> 
> I am using Machine1 as relayhost. All my local users
> are accessing
> their mails from Machine2.
> 
> I want to Forward POP3, IMAP and HTTP ports from
> Machine1 to Machine2,
> when my users access mails from internet.
> 
> Please Help me in this.
> 
> Thanks & Regards,
> Ranjith Kumar
> 
> 


__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 

