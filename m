From: Jim Laurino <nfcan.x.jimlaur@dfgh.net>
Subject: Re: Problems Pinging the Internet w/this script (nfcan: addressed
	to exclusive sender for this address)
Date: Sat, 11 Sep 2004 21:15:08 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20040912011508.GA8425@salty>
References: <41439912.2090701@juno.com>
Reply-To: nfcan.x.jimlaur@dfgh.net
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <41439912.2090701@juno.com> (from Jesse rv on Sat, Sep 11,
	2004 at 20:32:18 -0400)
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; format="Flowed"; delsp="Yes"; charset="us-ascii"
To: netfilter@lists.netfilter.org

On 2004.09.11 20:32, Jesse rv wrote:
> Here's a script I'm using to create some tables which will only allow in on  
> ports I'm running services. One of the problems I'm havng is that I can't  
> ping the Internet with a DNS address from this machine. I've allowed  
> everything in the OUTPUT table and can ping the Internet when using a  
> straight IP, but when I type in "ping google.com" the machine hangs for a  
> few seconds and gives me a server request error. I know it's something with  
> my rules because when I flush them all I can ping google.com just fine. Any  
> ideas would be greatly appreciated. I'm guessing it's something trivial but  
> can't put my finger on it yet.
> 
> thanks
........
> 
> # Adding Permittable Network/Hosts/Ports to Input Table on Internal  
> Interface
> 
>  # Allowing DNS,FTP,SSH,Webmin,HTTP,SWAT,and Samba to Server
> 
>  $RULE -A INPUT -i $INSIDEINT --proto icmp --icmp-type any -j ACCEPT
.......
>  $RULE -A INPUT -i $INSIDEINT --proto tcp --dport 53 -d $INSIDEIP -j ACCEPT
.......

One thing, at least, is that you have to allow DNS on both tcp and upd.
So you also need a rule like this:

   $RULE -A INPUT -i $INSIDEINT --proto udp --dport 53 -d $INSIDEIP -j ACCEPT

HTH

Jim

