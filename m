From: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Subject: Re: Port forwarding doesn't work.
Date: Mon, 13 Oct 2003 15:31:48 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F8AFDA4.60802@Loudoun-Fairfax.com>
References: <LFEHKEBEBHAFGJBMNKAOKELACCAA.markee@bandwidthco.com> <200310121840.27031.Herman@AerospaceSoftware.com> <20031013031712.7fd7be69.arnt@c2i.net> <200310131205.55401.Herman@AerospaceSoftware.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200310131205.55401.Herman@AerospaceSoftware.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Herman wrote:

>On Sunday 12 October 2003 7:17 pm, Arnt Karlsen wrote:
>   On Sun, 12 Oct 2003 18:40:27 -0600,
>   Herman <Herman@AerospaceSoftware.com> wrote in message
>
>   <200310121840.27031.Herman@AerospaceSoftware.com>:
>   > The real problem that I'm trying to solve is this:
>   > Several hosts need to acces a gov service that uses Java and a certain
>   > port.
>
>   ..if these hosts are initiating this connection from your end,
>   " -j ESTABLISHED,RELATED" should do it, instead of you
>   running around chasing your tail.
>  
>

I don't have the whole thread so I apologize if I missed something. If
you are using SNAT the return packets should be RELATED or ESTABLISHED
and they can be passed back to your box without any further natting:

# Masquerade everything leaving the lan as the firewall IP.
iptables -t nat -A POSTROUTING -o $Net_Interface -j SNAT --to $Net_IP

# This makes sure the returning packets make it through.
iptables -t filter -A INPUT -p all -m state --state RELATED,ESTABLISHED
-j ACCEPT

Jeff




