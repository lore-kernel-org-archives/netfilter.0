From: Jim Laurino <JimLaur@acm.org>
Subject: Re: iptables/multiple external natting problem (nfcan: addressed to
	exclusive sender for this address)
Date: Tue, 25 Oct 2005 18:25:42 -0400
Message-ID: <20051025222542.GG1517@salty>
References: <435E6E17.9040602@gocontent.com>
Reply-To: JimLaur@acm.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <435E6E17.9040602@gocontent.com> (from
	+nfcan+jimlaur+48d5a3e100.marc#gocontent.com@spamgourmet.com on
	Tue, Oct 25, 2005 at 13:40:39 -0400)
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
Content-Type: text/plain; format="Flowed"; delsp="Yes"; charset="us-ascii"
To: netfilter@lists.netfilter.org

On 2005.10.25 13:40, Marc Peiser - marc@gocontent.com wrote:
> Hi,
> 
> I'm trying to setup a firewall at our data center and I think I'm missing a  
> few things here. I have a Class C ip range, lets call it 1.2.3.0/24. I have  
> a firewall running kernel 2.6.9 and iptables 1.2.11. My firewall has 2  
> network interfaces, on the external interface I've added an alias for each  
> external ip that I want to nat to internal servers:
> 
> eg. ifconfig eth0:0 1.2.3.10 netmask 255.255.255.0
> (Is this the correct way to use multiple ip's?)
> 
> My servers on the inside interface are on the 192.168.0.0/24 network.
> 
> I'm able to ssh to an internal server via an external ip address.
> The problem is I can't seem to connect out (via ssh, dns, www etc) from the  
> inside servers. There is a rule blocking these connections as it shows me in  
> the firewall logs:
> 
> Oct 25 18:27:22 fw1 kernel: IN=eth1 OUT=eth0 SRC=192.168.0.20 DST=4.3.2.1  
> LEN=60 TOS=0x00 PREC=0x00 TTL=63 ID=28642 DF PROTO=UDP SPT=32769 DPT=53  
> LEN=40
> Oct 25 18:27:31 fw1 kernel: IN=eth1 OUT=eth0 SRC=192.168.0.20 DST=4.3.2.1  
> LEN=60 TOS=0x00 PREC=0x00 TTL=63 ID=18271 DF PROTO=TCP SPT=32792 DPT=22  
> WINDOW=5840 RES=0x00 SYN URGP=0
> 
> I've attached my firewall script, could someone please take a look at it and  
> give me a hand. Or if they have a similar setup, could you send me your  
> config. If there is a better way to do this, please let me know.

It appears there is no way to start an outbound connection.
You need a rule like this for each outbound service you allow.

$IPT -A FORWARD -i $INT_INTERFACE -o $EXT_INTERFACE -p tcp --dport 22 -m state  
--state NEW -j ACCEPT

> 
> Many thanks,
> Marc

