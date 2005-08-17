From: Ruprecht Helms <rhelms@my-mail.ch>
Subject: Re: FORWARD to a dynamica ip address (ADSL)
Date: Wed, 17 Aug 2005 13:44:35 +0200
Message-ID: <43032323.7050504@my-mail.ch>
References: <43031497.3090604@nobarrier.co.za>
Reply-To: rhelms@my-mail.ch
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43031497.3090604@nobarrier.co.za>
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
To: jonathan@nobarrier.co.za
Cc: netfilter@lists.netfilter.org

Jonathan X Peers wrote:
> Hi all
> 
> how would a forward to add dynamic ipaddress (how would i tell iptables 
> about the new number, what can I use)
> 
> can IPTABLES forward to a host name

You have to use a variable and a script with grep-command.
In the case of adsl you have to act the script shortly after connection
or in the case of ipdelivery to services via dhcp a shortly after the
adress-refreshprocess defined in the dhcp-service.

Regards,
Ruprecht

------------------------------------------------------------------------------------------
Ruprecht Helms IT-Service & Softwareentwicklung

Tel./Fax  +49[0]7621 16 99 16
Web:       htp://www.rheyn.de

