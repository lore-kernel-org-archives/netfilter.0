From: Mikhail Zotov <e-boogie@yandex.ru>
Subject: Re: Possible reasons for INVALID packets ?
Date: Wed, 2 Mar 2005 19:35:25 +0300
Message-ID: <200503021935.25498.e-boogie@yandex.ru>
References: <Pine.LNX.4.62.0503021025540.4201@L01.THNET>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <Pine.LNX.4.62.0503021025540.4201@L01.THNET>
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

On Wednesday 02 March 2005 12:26, Michael Tautschnig wrote:
> > Hello everybody,
>
> [...]
>
> You said that already, didn't you? See my answer at
>
> https://lists.netfilter.org/pipermail/netfilter/2005-February/058982.html

Thank you for the replies!  There was a pause in receiving messages
from the mailing list around Feb 28 and I didn't see any reply to my question.

>
>> IN= OUT=eth0 SRC=ROUTER DST=193.108.155.115 LEN=68 TOS=0x00 PREC=0xC0
>> TTL=64  ID=22467 PROTO=ICMP TYPE=11 CODE=0 [SRC=193.108.155.115
>> DST=A.LAN.HOST LEN=40 TOS=0x00 PREC=0x00 TTL=1 ID=40760 PROTO=ICMP TYPE=8
>> CODE=0 ID=20244 SEQ=45126 ]
>>
[...]
>
> Why would you consider these packets invalid - TYPE=11 is "time exceeded", 
> CODE=0 is "maximum lifetime of the datagram exceeded" - for whatever 
> reason those packets are generated ...

I have (roughly) the following rules in the script:

iptables -A OUTPUT -m state --state INVALID -j LOG \
--log-prefix "Fired invalid:"
iptables -A OUTPUT -m state --state INVALID -j DROP

These rules worked at the records I posted.


Regards,
Mikhail

