From: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Subject: Re: iptables script
Date: Tue, 25 Nov 2003 12:36:13 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3FC3930D.2040909@Loudoun-Fairfax.com>
References: <83055D4B014C9E478D2F04624B9E82CFD4B1@noveldc.novelgmt.mu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <83055D4B014C9E478D2F04624B9E82CFD4B1@noveldc.novelgmt.mu>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Gilles Yue wrote:

> How do make your linux pc bypass default iptables located in 
> /etc/sysconfig/iptables script and makes it execute your new and 
> customized iptables scripts.
>
>  
>
> Can anybody send me a simple script. Thanks
>

It varies by distro.  On Redhat systems one way to do it is to run your 
script and then use " /etc/init.d/rc.d/iptables save" to save the 
current configuration. SuSE is a little more complicated so I disabled 
the SuSE script through YaST2, ran my iptables script, and then use 
Webmin to save and restart my configuration. You can also call your 
script from the /etc/init.d/boot.local file which runs at boot.

Hope this helps.

Jeff


