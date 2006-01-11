From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: iptables: No chain/target/match by that name (detailed)
Date: Wed, 11 Jan 2006 16:05:38 +0100 (CET)
Message-ID: <55893.193.173.147.3.1136991938.squirrel@webmail.sterenborg.info>
References: <s3c4d304.069@gwia201.syr.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <s3c4d304.069@gwia201.syr.edu>
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

On Wed, January 11, 2006 15:42, Randy Grimshaw wrote:
> I believe you need to specify the chain i.e.:

You mean "table" (which is what you added) ?

> iptables -t filter -A INPUT -p icmp --icmp-type echo-request -m nth
> --every 2 -j DROP

"-t filter" is assumed if not specified.

>> "iptables -A INPUT -p icmp --icmp-type echo-request -m nth --every 2
>> -j DROP"
>>
>> It throws a message "iptables: No chain/target/match by that name".

Using kernel 2.6.15 I'm having problems too when compiling nth.

Actually, I'm seeing more things : 2.6.15 (vanilla) has NF
functionality that POM doesn't recognize and offers to install a patch
for (I thought pptp is an example).
Also, for example, in 2.4.31 I tried to patch for NOTRACK but POM says
: no raw table. But I was't offered to install the raw table patch.


Gr,
Rob



