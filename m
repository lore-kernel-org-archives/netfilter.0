From: Ramin Alidousti <ramin@cannon.eng.us.uu.net>
Subject: Re: w/s on same LAN can't access DNAT'ed w/s
Date: Mon, 24 Jun 2002 10:17:02 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020624141702.GD26150@cannon.eng.us.uu.net>
References: <20020624140559.1FCE67994D@smtp01.metro.net.id>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <20020624140559.1FCE67994D@smtp01.metro.net.id>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Nicholas N.E" <nicholas@3wsi.net>
Cc: netfilter@lists.samba.org

On Mon, Jun 24, 2002 at 09:27:34PM +0700, Nicholas N.E wrote:

> to be short :
> 
> 10.0.3.0/24 ---> Gatewaty --> Internet
>                               w.x.y.z
> 
> 10.0.3.8 is DNAT'ed to accept http request and some UDP ports 
> To the gateway w/ public IP
> 
> Internet ---> Gateway:80 -- DNAT--> 10.0.3.8:80
> 
> 
> But workstations ( on the same LAN ) can not access 10.0.3.8 using the 
> Gateway's Public IP
> THey can only connect by typing 10.0.3.8 ( or hostname only ) in the 
> browser's URL box
> 
> So far, I only use these on the nat tables :
> 
> iptables -t nat -A PREROUTING -p tcp -s 0/0 -d $Gateway_Ext_IP --dport 80 
> -j DNAT --to 10.0.3.8:80
> 
> AND 
> 
> iptables -t nat -A POSTROUTING -s 0/0 -d 0/0 -o $ ext_iface -j SNAT --to 
> $Gateway_ext_IP
> 
> Should I add something more so other workstations on the same LAN as 10.0.3.8
> can access it by using their gateway's Public IP ?

iptables -t nat -A POSTROUTING -p tcp -s 10.0.3.0/24 -d 10.0.3.8 --dport 80 -j SNAT --to $Gateway_ext_IP

Ramin

> 
> I do not know what this is called tho'
> 
> 
> Thank you for reading.
> 
> 
> 
> Nicholas.

