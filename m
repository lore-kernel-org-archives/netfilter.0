From: Andrew <andrew@donehue.net>
Subject: Re: Looking for automation scripts
Date: Sat, 06 Jan 2007 18:00:49 +1100
Message-ID: <459F4921.1080206@donehue.net>
References: <005701c73150$49f64710$0300a8c0@bandwidthco.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <005701c73150$49f64710$0300a8c0@bandwidthco.com>
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
To: markee@bandwidthco.com
Cc: netfilter@lists.netfilter.org


Have a look at http://www.ossec.net

it has just the features you are after, and can monitor a bunch of log 
types (auth logs to look for failed ssh log-ins, apache logs, mail logs, 
and even talks to snort so it can block upon portscans, etc).


Cheers,
Andrew
markee wrote:

>-----Original Message-----
>From: netfilter-bounces@lists.netfilter.org
>[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Tim Heagarty
>Sent: Friday, January 05, 2007 11:45 AM
>To: netfilter@lists.netfilter.org
>Subject: Looking for automation scripts
>
>I've seen a few references here to scripts that monitor attacks and
>dynamically update iptables rules to knock down the attacks. Can anyone
>provide some good research starting points or sample scripts that they use?
>I've found a few things with google but respect the collective out here much
>more.
>
>
>Thank you,
>
>Tim Heagarty, CISSP, CISA, MCSE
>http://www.TheaSecure.com/
>(928) 533-9690
>"There are 10 kinds of people in the world; those that understand binary,
>and those that don't."
>
>--
>No virus found in this outgoing message.
>Checked by AVG Free Edition.
>Version: 7.5.432 / Virus Database: 268.16.5/616 - Release Date: 1/4/2007
>1:34 PM
>
>
>Or . . . Something like dynfw: http://www.gentoo.org/proj/en/dynfw.xml
>
>
>
>########################################################
>This message has been scanned for viruses and dangerous 
>content by MailScanner, and is believed to be clean.
>
>postmaster@bandwidthco.com
>MailScanner at Bandwidthco Computer Security is for your absolute protection.
>########################################################
>
>
>  
>


