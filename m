From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: nat and dns
Date: Thu, 23 Sep 2004 09:17:03 -0500
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <4152DADF.4090802@pbl.ca>
References: <415290B1.5030401@imag.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <415290B1.5030401@imag.fr>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Raphael Jacquot wrote:
> hi,
> I have a setup that looks like :
>  _____                                ____
> [     ] 192.168.0.100                [    ]
> [ DNS ]------------------------------[ FW ]----
> [_____]                192.168.0.254 [____] (isp)
> 
> and I want the DNS to answer to queries from the outside
> what's the proper way of doing this ?

Use DNAT target.  In short what you need to do is:

   iptables -A FORWARD -m state --state NEW -j ACCEPT
   iptables -A FORWARD -p icmp -m state --state RELATED -j ACCEPT
   iptables -A FORWARD -i ext_if -o int_if -d 192.168.0.100 \
      -p udp --port 53 -m state --state NEW -j ACCEPT
   iptables -A FORWARD -i ext_if -o int_if -d 192.168.0.100 \
      -p tcp --port 53 -m state --state NEW -j ACCEPT

   iptables -t nat -A PREROUTING -i ext_if -d ext_ip \
      -p udp --port 53 -j DNAT --to-address 192.168.0.100
   iptables -t nat -A PREROUTING -i ext_if -d ext_ip \
      -p tcp --port 53 -j DNAT --to-address 192.168.0.100



-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7

