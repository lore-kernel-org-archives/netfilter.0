From: Tomas Edwardsson <netfilter@tommi.org>
Subject: Re: publishing 2 web server on one valid IP
Date: Mon, 29 Sep 2003 13:29:04 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030929132904.GA24995@ok.is>
References: <Law15-F11L2m9lHiu3f0003d05e@hotmail.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <Law15-F11L2m9lHiu3f0003d05e@hotmail.com>
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
Content-Transfer-Encoding: 7bit
To: Afshin Lamei <linux_st@hotmail.com>
Cc: netfilter@lists.netfilter.org

I don't think there is any solution using iptables. I personally use mod_proxy 
and virtualhosting on apache to distingusish what goes where.


====
Tomas Edwardsson
HP-UX Certified System Administrator
Red Hat Certified Engineer.
Opin Kerfi

On Mon, Sep 29, 2003 at 03:42:49PM +0330, Afshin Lamei wrote:
> From: "Afshin Lamei" <linux_st@hotmail.com>
> To: netfilter@lists.netfilter.org
> Subject: publishing 2 web server on one valid IP
> Date: Mon, 29 Sep 2003 15:42:49 +0330
> 
> hi
> I have 2 web servers in my DMZ. when there was one, I used DNAT to publish 
> the single web server on port 80 of the external interface of my firewall. 
> now I don't know how to distinguish between the requests of 2 web servers, 
> because I have only one IP address available for the external interface.
> Is there any solution using iptables, to know that which http request must 
> be DNAT to which web server?
> regards,
> afshin
> 
> _________________________________________________________________
> Add photos to your e-mail with MSN 8. Get 2 months FREE*. 
> http://join.msn.com/?page=features/featuredemail
> 

