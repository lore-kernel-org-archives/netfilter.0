From: "stu" <stu@gateway10.homeip.net>
Subject: RE: Startup script
Date: Sat, 17 Apr 2004 07:49:53 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040417074919.1B34ECEF41@firewall.gateway10.homeip.net>
References: <20040416100238.GC1439@hamachi.radom.org>
Reply-To: <stu@gateway10.homeip.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040416100238.GC1439@hamachi.radom.org>
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

 
> * stu (stu@gateway10.homeip.net) wrote:
> > Hi All
> > 
> > Where is the best place to put my firewall script, for example when 
> > the firewall is booted.
> > 
> 
> That depends entirely on your distros init scripts.  You left 
> that detail out though.  Try /etc/init.d/rc.local perhaps.
> 
> dan

Suse 9.0 pro - I am more interested in finding out at what run level the
script should kick in at. I have tried putting it in the
/etc/init.d/boot.local, but I think this comes up very last.

Thanks
Stu 


