From: "Tarek W." <mailinglists1@hotpop.com>
Subject: Re: wired route entry
Date: Sun, 08 Feb 2004 17:18:37 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1076253383.3008.8.camel@carve.personal.localdomain>
References: <20040204124241.48917.qmail@web20721.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040204124241.48917.qmail@web20721.mail.yahoo.com>
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

<snip source='/etc/sysconfig/network-scripts/ifup'>
# Add Zeroconf route.
if [ -z "${NOZEROCONF}" -a "${ISALIAS}" = "no" ]; then
    ip route replace 169.254.0.0/16 dev ${REALDEVICE} 
fi
</snip>


On Wed, 2004-02-04 at 14:42, ip tables wrote:
> Hello Alexis and group,
>  
> No these are not bound to be DHCP...i still donno what really causes
> it.
>  
> Thanks and regards
> 
> Alexis <alexis@attla.net.ar> wrote:
>         is this device configured to obtain its address via dhcp?
>         
>         
>         ----- Original Message ----- 
>         From: "ip tables" 
>         To: 
>         Sent: Tuesday, February 03, 2004 6:19 PM
>         Subject: wired route entry
>         
>         
>         > hello group(S)
>         > 
>         > I have installed redhat 9 (2.4.20 - 8) on an i686 with
>         > 3 network cards fixed. When i start network services
>         > it puts in an entry 
>         > 
>         > 169.254.0.0 255.255.0.0 eth2
>         > 
>         > why does this happen. This happen on boot also but i
>         > managed to remove it with a route del in the rc.local.
>         > What is the reason for this and how can i prevent
>         > this.
>         > 
>         > Thanks and regards
>         > 
>         > __________________________________
>         > Do you Yahoo!?
>         > Yahoo! SiteBuilder - Free web site building tool. Try it!
>         > http://webhosting.yahoo.com/ps/sb/
>         > 
>         > 
>         
> 
> ______________________________________________________________________
> Do you Yahoo!?
> Yahoo! SiteBuilder - Free web site building tool. Try it!


