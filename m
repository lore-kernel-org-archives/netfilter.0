From: "M. Ziya Ozudogru" <e116132@metu.edu.tr>
Subject: Re: mac/ip match
Date: 18 Sep 2003 22:04:37 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1063911877.19096.16.camel@tux>
References: <1063909559.19096.12.camel@tux>
	 <1063911472.844.7.camel@elendil.intranet.cartel-securite.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1063911472.844.7.camel@elendil.intranet.cartel-securite.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="utf-8"
To: Cedric Blancher <blancher@cartel-securite.fr>
Cc: netfilter@lists.netfilter.org

Thanks for your help but how can i assure that given mac is using the ip
i assign to it? And if it is using its assigned ip it should pass if it
is not it should be blocked
On Thu, 2003-09-18 at 21:57, Cedric Blancher wrote:
> Le jeu 18/09/2003 à 20:26, M. Ziya Ozudogru a écrit :
> > Here comes the problem.. How can i define in iptables to use these arp
> > rules and give access only the one addresses that match the rules and
> > should block all the others ( well i want to block the others [unused ip
> > addresses by using iptables mac macth module ] ) . ? Any hints ?
> 
> See mac match :
> 
> cbr@elendil:~$ iptables -m mac --help
> [...]
> MAC v1.2.8 options:
>  --mac-source [!] XX:XX:XX:XX:XX:XX
>                                 Match source MAC address
> 
> Now, you just have to implement rules matching source mac address and
> source IP address.


