From: "Kevin L. Collins" <kcollins@qx.net>
Subject: Question about fiewall script....
Date: Tue, 31 Dec 2002 21:19:42 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001601c2b13c$41954190$6501a8c0@athlon>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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

I'm in the midst of building VICTORY, my Linux Router/Firewall.

I'm reading the book "Linux Firewalls, Second Edition" by Robert L.
Ziegler, and using a great deal of the 4th chapter to help me protect my
LAN from the 'baddies'.

But I have a question that I can't seem to find an answer for...(beware
this may show extreme newbie stupidity, you've been warned.)

On several occasions, Mr. Ziegler invokes lines simaliar to the
following for IPTABLES rules and I'm not so sure I can follow them.

------------------------------------------------------------------------
if [ "$CONNECTION_TRACKING" = "1" ]; then
	$IPTABLES -A INPUT -i $EXTIF -p tcp --sport 20 \
	-d <Internet Address> --dport $UNPRIVPORTS -m state \
	--state NEW -j ACCEPT
fi
$IPTABLES -A INPUT -i $EXTIF -p tcp --sport 20 -d <Internet Address> \
--dport $UNPRIVPORTS -j ACCEPT
$IPTABLES -A OUTPUT -o $EXTIF -p tcp ! --syn -s <Internet Address> \ 
--sport $UNPRIVPORTS --dport 20 -j ACCEPT
------------------------------------------------------------------------

If I understand his thinking properly, this statement is supposed to
check
to see if the "Connection Tracking" module of IPTABLES/NetFilter is
loaded and if so, use the rule defined inside of the if/fi section.  But
if the "Connection Tracking" module isn't loaded, the firewall will
fallback to the rules that follow, allowing the proper traffic to flow
anyway.  This is supposedly because the "Connection Tracking" module
uses RAM to keep track of it's connections.  And if RAM isn't available,
connections tracking would fail.

So far this makes perfect sense, but I'm not sure that above code does
what he's describing.

My big concern is: No where in the book (that I have yet found) does he
mention that you should or need to set the constant
"CONNECTION_TRACKING"
in the script you're creating.  So, this leads me to believe that the
Connection Tracking module does it as it loads.  It also leads me to
think
that the module controls the state of the constant as it works.

Does someone know if this is the case?  Or maybe be able to point me to
somewhere that I can find out.

Since I'm a newbie, I want to make things as simple as I can - just in
case I screww something up, it'll be easier to find.  But I'm _much_
more concerned With the firewall working and being complete than I am
about syntax.  If my concern isn't valid, someone let me know, and I'll
quit worring about it.  If it _is_ valid, then please diresct me to the
_best_ solution.

Thanks in advance,

Kevin L. Collins, MCSE
Systems Manager
Nesbitt Engineering, Inc.



