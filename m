From: Michael Gale <mgale@utilitran.com>
Subject: Re: Help with iptables
Date: Wed, 10 Dec 2003 17:46:24 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031210174624.010db97c.mgale@utilitran.com>
References: <FB11F223A1DE69499D299308731DD413014A2A@mail.SBPC>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <FB11F223A1DE69499D299308731DD413014A2A@mail.SBPC>
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

Hello,

	Why not run squid only on the internal interface .. can you not provide squid with the IP or interface to listen on ?

Also iptables -A INPUT -i external_interface -p tcp --dport 3128 -j DROP

should do the trick .... if you set a default policy to DROP and only pass the things you want. That would be better :)

iptables --policy INPUT ACCEPT
iptables --policy OUTPUT ACCEPT
iptables --policy FORWARD ACCEPT 

Michael.


On Wed, 10 Dec 2003 15:45:52 -0800
"Bryan Dyson" <lan_administrator@solanapres.org> wrote:

> 
> Hi folks,
> 
> I've got my iptables setup and working with one small glitch. My ISP
> says I'm an open proxy.
> What I'm trying to do is set a rule in iptables that will drop port 3128
> requests coming from the outside but still allow my internal network to
> use the proxy on this port.
> I've tried the following, but they seem to shut down routing of e-mail
> from the internal mail server:
> 
> -A PREROUTING -I eth1 -p tcp -m tcp --dport 3128 -j DROP
> And
> -A PREROUTING -I x.x.x.x (public IP) -p tcp -m -tcp --dport 3128 -j DROP
> 
> 
> If anyone could help I'd appreciate it.
> 
> Bryan Dyson
> LAN/db Administrator
> Solana Beach Presbyterian Church
> 858-509-2580
> Shelby 5.4.1472
> 
> 
> 


-- 
Michael Gale
Network Administrator
Utilitran Corporation

