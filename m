From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Nat
Date: Sun, 8 Sep 2002 22:00:06 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020908210010.EEJJ5047.mta06-svc.ntlworld.com@there>
References: <3D7BB687.6010300@iol.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3D7BB687.6010300@iol.it>
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

On Sunday 08 September 2002 9:43 pm, Mattia Martinello wrote:

> Hi.
>
> I wish to create a nat with masquerading to allow my LAN to access to
> Internet.
> I have two LANs: 192.168.1.x and 192.168.2.x. The server wich will make
> the masquerading has both two LANs with two ethernet card.
> How I can allow only one LAN to access Internet with ppp0 on the server?
> I tried these lines, but it doesn't work:
>
> iptables -t nat -F POSTROUTING
> iptables -t nat -A POSTROUTING -j DROP

Never, never set a default policy other than ACCEPT on the nat or mangle 
tables !

> iptables -t nat -A POSTROUTING -s 192.168.1.0/255.255.255.0 -o ppp0 -j
> MASQUERADE

That should work fine.   A pity you can't use the -i option to specify the 
input interface in the POSTROUTING chain, but there you go....

> What I can do?

You could alternatively filter out packets from 192.168.2.0/24 going to ppp0, 
and then just MASQUERADE everything exiting ppp0 ?

Antony.

-- 

It is also possible that putting the birds in a laboratory setting
inadvertently renders them relatively incompetent.

 - Daniel C Dennett

