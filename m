From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: nat problem.
Date: Mon, 17 Jun 2002 19:11:19 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206171811.g5HIBOA13184@Networker.rockstone.co.uk>
References: <3D0BBC45.5000807@palaver.net> <030001c215b7$dc4d7f20$870110ac@samsi> <01f701c215ed$fca7c100$9300a8c0@edapter.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <01f701c215ed$fca7c100$9300a8c0@edapter.com>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

On Monday 17 June 2002 11:58 am, umar wrote:

> Hi, 
>  
> Trying out  a very simple configuration of a firewall here, but having some
> problems.
 The firewall  has two NIC's and have enabled ip forwarding.
> 
> I want the internal machines to connect to the internet,  So have enabled
> NAT : 
 Runing squid - transparent proxy on port 3232. Clients have been
> onfigured to connect to internet directly. eth0 is my external interface.
>  
> Following are the nat rules conigured on the firewall
>  
> iptables -t nat -A PREROUTING -i eth0  -p tcp --dport 80 -j REDIRECT
> --to-port 3232
 
> iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to-source x.x.x.x ( public
> IP of the other netwrok card )
 

What do you mean "IP of the *other* network card" ?

The address here should be the address of eth0.   Tell us if you're using 
something else, and if so what you're using (we don'tneed to know the IP 
address, just where it lives on the network).

 

Antony.

