From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Squid with iptables
Date: Fri, 5 Mar 2004 01:25:10 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403050125.10374.Antony@Soft-Solutions.co.uk>
References: <20040304095859.4b996ae6@mgalepc.utilitran.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040304095859.4b996ae6@mgalepc.utilitran.com>
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

On Thursday 04 March 2004 4:58 pm, Michael Gale wrote:

> Hello,
>
> 	I have recent installed squid on my firewall box to act as a proxy server
> for HTTP, HTTPS, and considering FTP.
>
> I have added in iptable rules for squid redirecting 80 to 3128 and 443 to
> 3128 but I have a question. My default --policy is DROP ... so in order for
> squid to work I need to allow outbound 80 traffic and not forwarded 80
> traffic like before .. but if I want squid to also allow ftp should I not
> just allow the process ID of squid to make outbound connections ?

If you are running squid in transparent proxying mode (which it sounds as 
though you are, with the "redirect port 80 to 3128" rule), then you cannot 
use it to proxy ftp.

Squid is not an ftp proxy (read the Squid home page).   However, browsers 
which are *configured to use an http proxy server* will send their ftp 
requests over http, and therefore browser ftp requests can be handled by the 
proxy.

I know this sounds confusing, but it's a trick of the browser, that if it is 
configured to use a proxy (ie: the whole setup is not working in transparent 
mode), it will send ftp requests over http, and the proxy will generate the 
outgoing ftp request.   If the browser is not specifically configured to use 
a proxy server, then it sends its ftp requests by ftp, for which you need an 
ftp proxy (such as frox).

Regards,

Antony.

-- 
Ramdisk is not an installation procedure.

                                                     Please reply to the list;
                                                           please don't CC me.


