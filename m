From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: DNAT Not working
Date: Mon, 12 Jul 2004 16:59:51 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407121659.51187.Antony@Soft-Solutions.co.uk>
References: <04fe01c46822$af0ae4c0$1a07a8c0@civic2k>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <04fe01c46822$af0ae4c0$1a07a8c0@civic2k>
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

On Monday 12 July 2004 4:12 pm, Nicolas Ross wrote:

> DNAT to 172.16.190.5, port 80 works fine.
> DNAT to 172.16.190.143, port 5003 is not.
>
> In /proc/net/ip_conntrack, I see :
>
> tcp      6 118 SYN_SENT src=x.x.x.x dst=x.x.x.x sport=49502 dport=5003
> [UNREPLIED] src=172.16.190.143 dst=x.x.x.x sport=5003 dport=49502 use=1

Okay, so that means the firewall passed the SYN packet through from the client 
to the mac, but hasn't seen the SYN-ACK back from the mac to the client.

> With iptables -nvL, I see packet counter rising for the 2 rules concerning
> port 5003

That means packets are going through the firewall (one way, at least).

> On the 172.16.190.143 box, wich is a mac os x box, with netstat -an | grep
> 5003, I see :
>
> tcp4       0      0  172.16.190.143.5003    x.x.x.x.62382          SYN_RCVD

Okay, so it's received the SYN (and presumably tried to return the SYN-ACK)

> tcp4       0      0  172.16.190.143.5003    172.16.190.153.49342
> ESTABLISHED
> tcp4       0      0  127.0.0.1.5003         127.0.0.1.49184
> ESTABLISHED
> tcp4       0      0  127.0.0.1.49184        127.0.0.1.5003
> ESTABLISHED
> tcp4       0      0  *.5003                 *.*                    LISTEN

Yup, it's listening on TCP port 5003 alright :)

Does the mac have a default route to send reply packets back to the remote 
client through the firewall?

Try a packet sniffer (ethereal is good) on the link between the firewall and 
the mac, and see if you can see packets both ways (and look at the source & 
destination addresses).

Regards,

Antony.

-- 
"Reports that say that something hasn't happened are always interesting to me, 
because as we know, there are known knowns; there are things we know we know. 
We also know there are known unknowns; that is to say we know there are some 
things we do not know. But there are also unknown unknowns - the ones we 
don't know we don't know."

 - Donald Rumsfeld, US Secretary of Defence

                                                     Please reply to the list;
                                                           please don't CC me.


