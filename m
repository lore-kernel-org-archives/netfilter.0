From: "Aldo S. Lagana" <alagana@discmail.com>
Subject: RE: simple nat question
Date: Tue, 2 Jul 2002 16:18:35 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <004101c22205$a4dc3130$3864a8c0@discmail.com>
References: <Pine.LNX.4.30.0207021225140.7072-100000@gilgamesh.eos.SilentMedia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <Pine.LNX.4.30.0207021225140.7072-100000@gilgamesh.eos.SilentMedia.com>
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
To: 'Ben' <bench@silentmedia.com>, 'NetFilter' <netfilter@lists.samba.org>

Umm - I do it by specifying the --dport in PREROUTING:
iptables -t nat -A PREROUTING -p tcp -d X.X.X.X --dport 80 -j DNAT --to
192.1
68.101.10

Where X.X.X.X is my public....

I also need to have a FORWARD rule to the .10 address...don't forget
that the Server's DG (default Gateway) needs to be the iptables box...


> -----Original Message-----
> From: netfilter-admin@lists.samba.org 
> [mailto:netfilter-admin@lists.samba.org] On Behalf Of Ben
> Sent: Tuesday, July 02, 2002 3:35 PM
> To: NetFilter
> Subject: simple nat question
> 
> 
> I've got a basic nat setup:
> 
>   internet
>      |
> +====+=====+ eth0: 1.2.3.4
> | firewall |
> +====+=====+ eth1: 10.0.0.1
>      |
> +====+=====+ eth0: 10.0.0.2
> |  server  |
> +==========+
> 
> 
> What I would like is for packets coming from the server 
> (10.0.0.2) to get SNAT'd to the firewall's IP address, 
> 1.2.3.4. It seems easy enough to do:
> 
> iptables -t nat -A POSTROUTING -o eth0 -s 10.0.0.2 -j SNAT 
> --to 1.2.3.4
> 
> But now I don't see how return packets are going to make it 
> back to my server, because the firewall is going to think 
> they are destined for it. If I add the rule:
> 
> iptables -t nat -A PREROUTING -d 1.2.3.4 -i ! eth0 -j DNAT 
> --to 10.0.0.2
> 
> Then it seems I loose the ability for the firewall to run 
> anything accessable to the outside world, like ssh.
> 
> 


