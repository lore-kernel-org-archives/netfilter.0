From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: I know this shouldn't be this hard
Date: Tue, 25 Jun 2002 18:16:26 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206251716.SAA21109@slate.rockstone.co.uk>
References: <B802F5F25EAD9B43A2D3A7A336853532025095C7@AUSXMPC117.aus.amer.dell.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <B802F5F25EAD9B43A2D3A7A336853532025095C7@AUSXMPC117.aus.amer.dell.com>
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
Cc: Stephanie_Martinez@Dell.com

On Tuesday 25 June 2002 6:09 pm, Stephanie_Martinez@Dell.com wrote:

> what I'm looking to do
> is forward a port from one box to another.
>
> eth0 is my internet connection and is a dynamic ip so trying to stear clear
> of anythig that requires an ip on it
>
> eth1 is my internal network on the linux box and runs on ip 192.168.0.1
> 192.168.0.101 is the ip of the machine with the service i want to run
>
> As hptotetical examples so that I can be sure I can  understand which is
> which, lets say I want to forward any incomming connection to port 2000 on
> the linux box (which would come in on eth0), to port 5000 on 192.168.0.101
> (the windows machine).

iptables -A PREROUTING -t nat -i eth0 -p tcp --dport 2000 -j DNAT --to 
192.168.0.101:5000
iptables -A FORWARD -i eth0 -d 192.168.0.101 -p tcp --dport 2000 -j ACCEPT
iptables -A FORWARD -i eth1 -m state --state ESTABLISHED, RELATED -j ACCEPT

 

Antony.

