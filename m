From: rruegner <robert@ruegner.org>
Subject: Re: virus scanning with iptables
Date: Fri, 10 Sep 2004 17:54:21 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <4141CE2D.2020506@ruegner.org>
References: <01CEA3A5B8B2D511890F0002A5870AEC02CE644C@exchange.admin.slc.edu>
	<4141C983.5050409@lanl.gov>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4141C983.5050409@lanl.gov>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Stephen J Smoogen <smoogen@lanl.gov>
Cc: Daniel Chemko <dchemko@smgtec.com>, netfilter@lists.netfilter.org, Khanh Tran <khanh@slc.edu>

Hi,
better way would be to use apache2 , mod_clamd, and squid / frox
or use dansgurdian, or some comercial Produkt
This would do the job for http/ftp...clamd also works with amavis-new
for antispam and antivirus to smtp.
Regards
Stephen J Smoogen schrieb:
> Khanh Tran wrote:
> 
>> How about port scanning clients behind from the firewall?  Suggestions?
>> I'm thinking of something that could be scripted to append an iptables
>> rule to block the MAC address of the offending client, then notify me.
>> Am I looking at an NMAP plugin possibly?
>>
> 
> You would probably want to have something like SNORT tied into iptables. 
>  Have something like SNORT look for certain alerts and then when it 
> finds them it sends a 'signal' to a daemon on the firewall that inserts 
> a DROP rule for that IP address in a 'dynamic chain'.
> 

