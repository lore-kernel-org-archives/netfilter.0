From: "Scott Knake" <sknake@Apexsoftware.com>
Subject: RE: iptables version unknown
Date: Fri, 26 Nov 2004 10:12:35 -0500
Message-ID: <424BCB4EA242A1429A8AF0548E8CFF0E123995@apexexchange.ApexSoftware.Com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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


>>Scott Knake wrote:
>> The problem you're having is that when you download via apt-get
source
>> you're getting the source used to make the package. Debian packages
all
>> have custom version numbers since they apply distro patches to all
their
>> distributions. Try using the iptables source from netfilters home
page
>> and I bet this wont happen.
>>
>>
>>>Hi,
>>>
>>>I'm new to patch-o-matic.
>>>
>>>I downloaded the 2.4.28 kernel from ftp.kernel.org
>>>I downloaded iptables 1.2.6a via apt-get source iptables
>>>I downloaded path-o-matic-20041125.tar.bz2.
>>>
>>>I unpacked all those archives in /usr/src.
>>>when running ./runme in patch-o-matic I get the following error:
>>>	Your iptables version  is unknown for patch-o-matic at ./runme
>>
>> line 214
>>
>>>What can I do about it? which version should I use?
>>>
>>>--
>>>Marc
>Hi,
>
>I downloaded 1.2.6a of iptables from ftp.netfilter.org still the same
>problem.  Do you what iptables version I should use?
>
>--
>Marc


I successfully install patch-o-matic on iptables 1.2.11 and linux kernel
2.4.27. if this still doesn't work post again and I'll do a step by
step.

