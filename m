From: "christopher harris" <charris36@hotmail.com>
Subject: Snort-inline 2.2.0 rc1  and Clamav
Date: Fri, 03 Dec 2004 16:35:12 +0000
Message-ID: <BAY1-F404D0DBA8C5F3A1ACED399BAB10@phx.gbl>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I am currently running snort-inline-2.1.3b on redhat 7.3. I'm not really a 
unix guy however I'd like to use the clamav. Is clamav bundled in with 
snort-inline 2.2.0 rc1? If not,where can I obtain some instructions on doing 
so?

Thanks,

Christopher





On Friday 10 September 2004 01:26, Daniel Chemko wrote:
>Khanh Tran wrote:
> > Is any using a virus scanning application with iptables?  I'd like to
> > know if it's possible for me to detect viruses that go across my
> > iptables firewalls.
>
>There isn't currently a tool to perform Virus scanning of iptables data.
>The closest match would be snort-inline which can locate some virus
>signatures. Inline scanning of anything can have averse effects on the
>transmission. You'll quickly find that detailed scans require a lot of
>CPU usage. Just for monitoring network thoughtput with ntop, I'd max out
>my P4 CPU when backups kicked off.

We have developed a virusscanning preprocessor for Snort-inline about one
month ago. It will be in the upcoming Snort-inline 2.2.0 rc1 due to be
released this weekend (a patch for Snort-inline 2.1.3 is available at the
project site).

The ClamAV plugin scans the raw networkdata, an we have been successfully
detecting viruses in http, smtp, pop3, msn, imap, etc. Note however, that
scanning the raw data means we don't detect viruses in archives.

The cpu-load of the plugin seems to be ok...

>
>The better approach would be to implement transparent proxies of
>pertinent services like SMTP and use virus scanning addons. for them.

I agree with Daniel here, especially for stmp. For other stuff you can try 
the
above solution!

Regards,
Victor



