From: Herman <Herman@AerospaceSoftware.com>
Subject: Re: Port forwarding doesn't work.
Date: Mon, 13 Oct 2003 14:47:26 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200310131447.26239.Herman@AerospaceSoftware.com>
References: <LFEHKEBEBHAFGJBMNKAOKELACCAA.markee@bandwidthco.com> <200310131205.55401.Herman@AerospaceSoftware.com> <20031013220908.11525ec6.arnt@c2i.net>
Reply-To: Herman@AerospaceSoftware.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031013220908.11525ec6.arnt@c2i.net>
Content-Disposition: inline
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

On Monday 13 October 2003 2:09 pm, Arnt Karlsen wrote:

   ..you don't need to specify interface nor protocol or ports other
   than possibly to make data for the nice graphs.  KISS:   ;-)

   # Accept everyting connected
   /sbin/iptables -A INPUT   -m state --state ESTABLISHED,RELATED \
   -j ACCEPT
   /sbin/iptables -A FORWARD -m state --state ESTABLISHED,RELATED \
   -j ACCEPT

Wow, that is far more simple than anything I ever saw in any howto.  I like it 
and I'll sure try it.

I currently have this input rule:
# Allow any related traffic coming back to the MASQ server in
$IPTABLES -A INPUT -i $EXTIF -s $UNIVERSE -d $EXTIP -m state --state \
 ESTABLISHED,RELATED -j ACCEPT

and these forward rules:
echo "     - FWD: Allow all connections OUT and only existing/related IN"
$IPTABLES -A FORWARD -i $EXTIF -o $INTIF -m state --state ESTABLISHED,RELATED 
\
 -j ACCEPT
$IPTABLES -A FORWARD -i $INTIF -o $EXTIF -j ACCEPT

My snat masquerade rule looks like this:
$IPTABLES -t nat -A POSTROUTING -o $EXTIF -j SNAT --to $EXTIP

Your suggestions will simplify these rules nicely.


The problem is that I'm not quite sure how the Java applet thing works - 
whether the connection is established from the inside, or whether the gov 
server starts it up from the outside, after the initial http connection - 
they may be doing that for some security reason.  If it is the latter, then 
the established,related rules won't work and explicit port forwarding rules 
would be required.  To add to my woes, the gov server is down for maintenance 
at the moment, so I can't test it properly.

Thanks,
-- 
Herman Oosthuysen 
B.Eng(E), MIEEE
Aerospace Software Ltd.
Ph: 1.403.241-8773, Cell: 1.403.852-5545, Fx: 1.403.241-8841
Herman@AerospaceSoftware.com, http://www.AerospaceSoftware.com

