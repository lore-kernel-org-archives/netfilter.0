From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: migrating ipchains to iptables
Date: Tue, 1 Apr 2003 05:23:46 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030401052346.09c2ea8e.arnt@c2i.net>
References: <F78G1vzGbjkJ3FvTFnQ00016fee@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <F78G1vzGbjkJ3FvTFnQ00016fee@hotmail.com>
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

On Mon, 31 Mar 2003 21:27:54 -0500, 
"John Lumby" <johnlumby@hotmail.com> wrote in message 
<F78G1vzGbjkJ3FvTFnQ00016fee@hotmail.com>:

> I'm running a 2.4.18-3 kernel but for strange reasons have always used

..you want 2.4.18-27.7|8.x|0.etc.  _Now_. 
http://rhn.redhat.com/errata/rh72-errata.html or
http://rhn.redhat.com/errata/rh73-errata.html or
http://rhn.redhat.com/errata/rh8-errata.html

> ipchains.   Now want to switch to iptables.   Wondering if anyone has
> ever written a script which will read an ipchains file as created by
> 
>        /etc/rc.d/init.d/ipchains save

..the easy way is use the 'setup' utility, then choose firewall setup.

> and either convert it to /etc/rc.d/init.d/iptables save format or set
> up the "corresponding" iptables chains directly.

..first however, "ipchains-save"(?), then ' service ipchains stop 
&& rpm -e ipchains','rpm -ivh iptables-$the-newest.rpm', and 'setup' 
as above.  Tweaks: put in the equivalent of your ipchains settings, 
plus bonus stateful firewalling.

..another _good_ option: combine Shorewall(.net) and Webmin(.com),
to control iptables.

-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.



