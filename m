From: Justin Schoeman <justin@expertron.co.za>
Subject: Re: Unknown error.
Date: Fri, 11 Aug 2006 13:31:54 +0200
Message-ID: <44DC6AAA.1070702@expertron.co.za>
References: <PKEOKKLGKDAAJCECPIOOGEKOFLAA.rboucneau@tuckernt.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <PKEOKKLGKDAAJCECPIOOGEKOFLAA.rboucneau@tuckernt.net>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Bob Boucneau <rboucneau@tuckernt.net>, netfilter@lists.netfilter.org

OK - That one did it!  Got a meaningful error message, and realised that 
somehow I had not built the CONNMARK module ;-) .

Now, the next error, when I try to load a geoip match:

/usr/local/sbin/iptables -t mangle -A INPUT -m geoip --dst-cc ZA -j ACCEPT

I get:

iptables: Invalid argument

with the following in dmesg:

ip_tables: geoip match: invalid size 0 != 96

It seems like some critical piece of geoip /xt_tables integration is not 
in place... Is my analysis correct?  If so, is there a porting document 
somewhere covering the iptables updates since geoip last worked?

Thanks,

Justin

Bob Boucneau wrote:
> Hi Justin,
> 
> Should be fixed in current Netfilter.  This was a bug.
> 
> http://lists.netfilter.org/pipermail/netfilter-buglog/2006-April/000921.html
> 
> B
> 
> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org
> [mailto:netfilter-bounces@lists.netfilter.org]On Behalf Of Justin Schoeman
> Sent: Thursday, August 10, 2006 11:35 AM
> To: netfilter@lists.netfilter.org
> Subject: Unknown error.
> 
> Hi again.
> 
> I was wondering if anybody could help me.  I am using kernel 2.6.17.8
> with iptables 1.3.5, and I get the following error:
> 
> iptables: Unknown error 4294967295
> 
> for this command:
> 
> /usr/local/sbin/iptables -A INPUT -j CONNMARK --save-mark
> 
> I see a large number of hits for the error message on google, mainly
> related to iptables 1.3.5, but I have not seen one thread with a
> conclusive solution.
> 
> Could anybody please give me some pointers on where to start looking? Is
> this an iptables bug, if so, what is the last good version.  If not,
> what else can I look for?
> 
> Thanks,
> 
> Justin
> 

