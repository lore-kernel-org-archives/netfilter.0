From: William Perry <wlperry@williamperry.com>
Subject: Re: Looking for automation scripts
Date: Sat, 06 Jan 2007 15:20:19 -0800
Message-ID: <45A02EB3.60102@williamperry.com>
References: <005701c73150$49f64710$0300a8c0@bandwidthco.com>	<Pine.LNX.4.61.0701061534460.22558@yvahk01.tjqt.qr>	<20070106152740.GA13781@minastirith>
	<0dd44240578edb703165547e121ceb7c@afm-koeln.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <0dd44240578edb703165547e121ceb7c@afm-koeln.de>
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
Cc: netfilter@lists.netfilter.org

See http://fut.patch.com

I am planning and working on an extension to fut that will permit 
sysadmins to share the ip's of idiots.

William Perry


cm@afm-koeln.de wrote:
> Am 06.01.2007 um 16:27 schrieb Michael Rash:
>
>> On Jan 06, 2007, Jan Engelhardt wrote:
>>
>>>> I've seen a few references here to scripts that monitor attacks and
>>>> dynamically update iptables rules to knock down the attacks. Can 
>>>> anyone
>>>> provide some good research starting points or sample scripts that 
>>>> they use?
>>>
>>> denyhosts.sf.net?
>>
>> While denyhosts is a good concept, I question whether it provides a real
>> security benefit.  If a new remotely exploitable vulnerability is
>> discovered in OpenSSH (or other ssh implementation) it will most likely
>> have nothing to do with trying to brute force passwords.  Doing a quick
>> search through http://www.securityfocus.com/bid/ turns up recent SSH
>> security issues (not necessarily highly critical, but it is only a
>> matter of time).
>
> .. its recommendable as a second instance of a "firewall" framework.
>
> -- 
>
> This sounds also good: http://fail2ban.sourceforge.net
>
> Best Regards
>
> CM
>
>
>


