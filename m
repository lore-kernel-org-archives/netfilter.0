From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: Port forwarding doesn't work.
Date: Mon, 13 Oct 2003 22:09:08 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031013220908.11525ec6.arnt@c2i.net>
References: <LFEHKEBEBHAFGJBMNKAOKELACCAA.markee@bandwidthco.com>
	<200310121840.27031.Herman@AerospaceSoftware.com>
	<20031013031712.7fd7be69.arnt@c2i.net>
	<200310131205.55401.Herman@AerospaceSoftware.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Mon, 13 Oct 2003 12:05:55 -0600, 
Herman <Herman@AerospaceSoftware.com> wrote in message 
<200310131205.55401.Herman@AerospaceSoftware.com>:

> On Sunday 12 October 2003 7:17 pm, Arnt Karlsen wrote:
>    On Sun, 12 Oct 2003 18:40:27 -0600,
>    Herman <Herman@AerospaceSoftware.com> wrote in message
> 
>    <200310121840.27031.Herman@AerospaceSoftware.com>:
>    > The real problem that I'm trying to solve is this:
>    > Several hosts need to acces a gov service that uses Java and a
>    > certain port.
> 
>    ..if these hosts are initiating this connection from your end,
>    " -j ESTABLISHED,RELATED" should do it, instead of you
>    running around chasing your tail.
> 
> Hi Arnt,
> 
> Could you please elaborate on that?

..see Robert's correction to my post and my response.

> As far as I can see, the hosts are initiating the connection, but the
> port must somehow be forwarded through the firewall snat box.
> 
> This is what I have:
> echo "   DNAT Forward port 3270 for Alberta Registries application on
> Pluto"$IPTABLES -A FORWARD -i $EXTIF -o $INTIF -p tcp --dport 3270 -j
> ACCEPT$IPTABLES -t nat -A PREROUTING -i $EXTIF -p tcp --dport 3270 -j
> DNAT --to 192.168.10.1:3270

..this looks like some ifwadm(sp?) or ipchains like kludge?  Rip it out.

> This is working now, provided that I use that specific IP address on
> the inside - I had to load the iptable_mangle module, which made my
> problems go away...
> 
> I don't understand how to add the ESTABLISHED,RELATED idea into this
> type of rule.  
> 
> Something like this:
> 
> $IPTABLES -t nat -A PREROUTING -i $EXTIF -p tcp --dport 3270 -m state
> --state ESTABLISHED,RELATED

..you don't need to specify interface nor protocol or ports other 
than possibly to make data for the nice graphs.  KISS:   ;-)

# Accept everyting connected
/sbin/iptables -A INPUT   -m state --state ESTABLISHED,RELATED \
-j ACCEPT
/sbin/iptables -A FORWARD -m state --state ESTABLISHED,RELATED \
-j ACCEPT

-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.


