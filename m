From: "Mark E. Donaldson" <markee@bandwidthco.com>
Subject: RE: Startup script
Date: Sat, 17 Apr 2004 12:22:42 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404171922.i3HJMXWr020641@server5.bandwidthco.com>
References: <20040417074919.1B34ECEF41@firewall.gateway10.homeip.net>
Reply-To: <markee@bandwidthco.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040417074919.1B34ECEF41@firewall.gateway10.homeip.net>
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
To: stu@gateway10.homeip.net, netfilter@lists.netfilter.org

 

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of stu
Sent: Friday, April 16, 2004 10:50 PM
To: netfilter@lists.netfilter.org
Subject: RE: Startup script

 
> * stu (stu@gateway10.homeip.net) wrote:
> > Hi All
> > 
> > Where is the best place to put my firewall script, for example when 
> > the firewall is booted.
> > 
> 
> That depends entirely on your distros init scripts.  You left that 
> detail out though.  Try /etc/init.d/rc.local perhaps.
> 
> dan

Suse 9.0 pro - I am more interested in finding out at what run level the
script should kick in at. I have tried putting it in the
/etc/init.d/boot.local, but I think this comes up very last.

Thanks
Stu 

I'm using SUSE 9 pro but also have PortSentry 1.1.1 tightly configured and
running on the firewall so I load my script rather late as follows:

ln -s /etc/init.d/iptables /etc/init.d/rc3.d/S01iptables
ln -s /etc/init.d/iptables /etc/init.d/rc5.d/S01iptables $CHKCONFIG --level
35 iptables on

This works well for me.




