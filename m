From: Victor Julien <victor@nk.nl>
Subject: Re: Snort-inline 2.2.0 rc1  and Clamav
Date: Sun, 5 Dec 2004 11:06:44 +0100
Message-ID: <200412051106.44061.victor@nk.nl>
References: <BAY1-F404D0DBA8C5F3A1ACED399BAB10@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY1-F404D0DBA8C5F3A1ACED399BAB10@phx.gbl>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org
Cc: christopher harris <charris36@hotmail.com>, snort-inline-users@lists.sourceforge.net

On Friday 03 December 2004 17:35, christopher harris wrote:
> I am currently running snort-inline-2.1.3b on redhat 7.3. I'm not really a
> unix guy however I'd like to use the clamav. Is clamav bundled in with
> snort-inline 2.2.0 rc1? If not,where can I obtain some instructions on
> doing so?

Snort_inline is already at version 2.2.0a, so please don't use the rc version. 
The Clamav preprocessor is bundled with 2.2.0a, you still need to install the 
Clamav library though.

You can download it from: http://snort-inline.sourceforge.net/index.html
Make sure you run configure with ./configure --enable-clamav

Snort_inline has it's own mailinglist, so please direct future questions to 
that list, as this is not netfilter related. See this link on how to join the 
(low traffic) snort_inline-users list: 
http://lists.sourceforge.net/lists/listinfo/snort-inline-users

Hope this helps,
Victor

> Thanks,
>
> Christopher
>
> On Friday 10 September 2004 01:26, Daniel Chemko wrote:
> >Khanh Tran wrote:
> > > Is any using a virus scanning application with iptables?  I'd like to
> > > know if it's possible for me to detect viruses that go across my
> > > iptables firewalls.
> >
> >There isn't currently a tool to perform Virus scanning of iptables data.
> >The closest match would be snort-inline which can locate some virus
> >signatures. Inline scanning of anything can have averse effects on the
> >transmission. You'll quickly find that detailed scans require a lot of
> >CPU usage. Just for monitoring network thoughtput with ntop, I'd max out
> >my P4 CPU when backups kicked off.
>
> We have developed a virusscanning preprocessor for Snort-inline about one
> month ago. It will be in the upcoming Snort-inline 2.2.0 rc1 due to be
> released this weekend (a patch for Snort-inline 2.1.3 is available at the
> project site).
>
> The ClamAV plugin scans the raw networkdata, an we have been successfully
> detecting viruses in http, smtp, pop3, msn, imap, etc. Note however, that
> scanning the raw data means we don't detect viruses in archives.
>
> The cpu-load of the plugin seems to be ok...
>
> >The better approach would be to implement transparent proxies of
> >pertinent services like SMTP and use virus scanning addons. for them.
>
> I agree with Daniel here, especially for stmp. For other stuff you can try
> the
> above solution!
>
> Regards,
> Victor

