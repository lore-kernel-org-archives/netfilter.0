From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: DHCP /MAC
Date: Sat, 8 Nov 2003 12:14:51 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311081214.hA8CEuj15455@agate.rockstone.co.uk>
References: <20031108114309.82218.qmail@web60203.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031108114309.82218.qmail@web60203.mail.yahoo.com>
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

On Saturday 08 November 2003 11:43 am, kannel sms wrote:

> This dhcp server specially allcate for Cable modem
> system . That cable modem has a MAC addresses. I'm
> sure.

Yes, a cable modem will have a MAC address.   Your first posting mentioned 
dial-up users, so I assumed you meant standard analogue telephone system 
dial-up modems.

> If u can tell me how to implement that MAC blocking
> for the LAN , i can manage that methods for cable
> modem as well.

I would create a user-defined chain which ACCEPTs the desired MAC addresses 
and DROPs all others:

iptables -N MACcheck
iptables -A MACcheck -m mac --mac-source aa.bb.cc.dd.ee.ff -j ACCEPT
iptables -A MACcheck -m mac --mac-source uu.vv.ww.xx.yy.zz -j ACCEPT
iptables -A MACcheck -j DROP

(Add as many ACCEPT lines as you want to match MAC addresses)

Then, if you want to restrict packets coming in to the netfilter box itself:

iptables -I INPUT -i eth0 -j MACcheck

or if you want to restrict packets going through the netfilter box to 
somewhere else:

iptables -I INPUT -i eth0 -j MACcheck

(Adjust eth0 for whichever interface your cable modems are connected).

Antony.

PS: If you want to reply, please reply to the list, not to me personally.

-- 

You can spend the whole of your life trying to be popular,
but at the end of the day the size of the crowd at your funeral
will be largely dictated by the weather.

 - Frank Skinner
                                                     Please reply to the list;
                                                           please don't CC me.

