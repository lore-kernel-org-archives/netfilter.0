From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Security question
Date: Mon, 1 Mar 2004 13:10:01 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403011310.01671.Antony@Soft-Solutions.co.uk>
References: <404332A5.1000500@stupar.homelinux.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <404332A5.1000500@stupar.homelinux.net>
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
To: Netfilter-List <netfilter@lists.netfilter.org>

On Monday 01 March 2004 12:55 pm, Sasa Stupar wrote:

> What is the potential security problem if you have network as follows:
>
> SOLUTION 1
>
> INET-CABLE MODEM-----------------|
> ROUTER-eth0-public IP address----|
> ROUTER-eth1-private IP address---|------->SWITCH
> ROUTER-eth2-private IP address---|
> Internal server for mail,web-----|
> all LAN users with private IP----|

Any user can set their machine to have a public IP and talk to the cable modem 
directly, without going through the router.

Also, Linux-based routers often do interesting things with arp replies when 
they have multiple interfaces connected to the same switch.

> SOLUTION 2
>
> INET-CABLE MODEM-->eth0-ROUTER|--eth1|
> 			       --eth2|-->SWITCH
> 		 server and LAN users|

The only path between the internal protected network and the external Internet 
is through the router - therefore you have complete control over what is 
allowed, by setting appropriate filtering rules on the router.

> I am thinking of the solution 1 because cable modem is a little bit to
> far away from the router and I don't want to use to much of the cables.
> I have setup router with MAC address filtering and also put firewall on
> all internal computers.
> What is possible security problem comparing the 2 solutions above?

Since the switch has no security capabilities, and it is connecting external 
addresses (cable modem) directly to internal machines (PCs), it is simple for 
users to bypass your security if they want to.   I would not use this 
arrangement.

There is a general rule about firewalls - they should be the only path between 
the protected and the untrusted networks.   If there is another way for 
packets to travel between these two, without going through the firewall, you 
cannot rely on it to do the job you want.

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


