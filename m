From: Victor Julien <victor@nk.nl>
Subject: Re: virus scanning with iptables
Date: Fri, 10 Sep 2004 09:49:10 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <200409100949.10565.victor@nk.nl>
References: <7C9884991ADAE0479C14F10C858BCDF591E36E@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <7C9884991ADAE0479C14F10C858BCDF591E36E@alderaan.smgtec.com>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org
Cc: Daniel Chemko <dchemko@smgtec.com>, Khanh Tran <khanh@slc.edu>

On Friday 10 September 2004 01:26, Daniel Chemko wrote:
> Khanh Tran wrote:
> > Is any using a virus scanning application with iptables?  I'd like to
> > know if it's possible for me to detect viruses that go across my
> > iptables firewalls.
>
> There isn't currently a tool to perform Virus scanning of iptables data.
> The closest match would be snort-inline which can locate some virus
> signatures. Inline scanning of anything can have averse effects on the
> transmission. You'll quickly find that detailed scans require a lot of
> CPU usage. Just for monitoring network thoughtput with ntop, I'd max out
> my P4 CPU when backups kicked off.

We have developed a virusscanning preprocessor for Snort-inline about one 
month ago. It will be in the upcoming Snort-inline 2.2.0 rc1 due to be 
released this weekend (a patch for Snort-inline 2.1.3 is available at the 
project site). 

The ClamAV plugin scans the raw networkdata, an we have been successfully 
detecting viruses in http, smtp, pop3, msn, imap, etc. Note however, that 
scanning the raw data means we don't detect viruses in archives.

The cpu-load of the plugin seems to be ok...

>
> The better approach would be to implement transparent proxies of
> pertinent services like SMTP and use virus scanning addons. for them.

I agree with Daniel here, especially for stmp. For other stuff you can try the 
above solution!

Regards,
Victor

