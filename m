From: Marc Cuypers <mozilla@mgvd.be>
Subject: Re: iptables version unknown
Date: Fri, 26 Nov 2004 16:09:05 +0100
Message-ID: <41A74711.8010608@mgvd.be>
References: <424BCB4EA242A1429A8AF0548E8CFF0E123994@apexexchange.ApexSoftware.Com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <424BCB4EA242A1429A8AF0548E8CFF0E123994@apexexchange.ApexSoftware.Com>
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
To: Scott Knake <sknake@Apexsoftware.com>
Cc: netfilter@lists.netfilter.org


Scott Knake wrote:
> The problem you're having is that when you download via apt-get source
> you're getting the source used to make the package. Debian packages all
> have custom version numbers since they apply distro patches to all their
> distributions. Try using the iptables source from netfilters home page
> and I bet this wont happen.
> 
> 
>>Hi,
>>
>>I'm new to patch-o-matic.
>>
>>I downloaded the 2.4.28 kernel from ftp.kernel.org
>>I downloaded iptables 1.2.6a via apt-get source iptables
>>I downloaded path-o-matic-20041125.tar.bz2.
>>
>>I unpacked all those archives in /usr/src.
>>when running ./runme in patch-o-matic I get the following error:
>>	Your iptables version  is unknown for patch-o-matic at ./runme
> 
> line 214
> 
>>What can I do about it? which version should I use?
>>
>>-- 
>>Marc
Hi,

I downloaded 1.2.6a of iptables from ftp.netfilter.org still the same 
problem.  Do you what iptables version I should use?

-- 
Marc

