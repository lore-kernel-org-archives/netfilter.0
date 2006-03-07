From: "Martijn Lievaart" <m@rtij.nl>
Subject: RE: icmp-host-unreachable as opposed to destination-unreachable
Date: Tue, 7 Mar 2006 17:33:48 +0100 (CET)
Message-ID: <13274.217.166.60.19.1141749228.squirrel@ma.rtij.nl>
References: <FAC4E024BF776842876169173CE2F0132CBD29@mailbox.vikus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <FAC4E024BF776842876169173CE2F0132CBD29@mailbox.vikus.com>
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
To: danderson@vikus.com
Cc: netfilter@lists.netfilter.org

Derick Anderson zei:
>
>
> bclark said:

>> Hi all
>>
>> Would anyone be kind to explain why would a person reject a
>> connection to port 113 with icmp-host-unreachable as opposed
>> to destination-unreachable.
>> I probally dont understand the difference.
>> Just something I was wondering.
>>
>> Kind Regards
>> Brent Clark
>>
>
>>From what I can tell, icmp-host-unreachable is a code (1) for the
> destination-unreachable ICMP type (3). See
> http://www.spirit.com/Resources/icmp.html for a little more information,
> and Google RFC 792 for a lot more information.
>
> Basically though, "host-unreachable" is more specific than
> "destination-unreachable". I would think that code 3 would be more
> appropriate ("port unreachable") to this specific rule but then I don't
> bother with ident (port 113) rules. There's more information on that on
> this page: http://grc.com/port_113.htm.

Actually one should respond with a tcp reset to tcp/113. All icmp
*-unreachable replies can (and do) give differing results on different
sending tcp stacks.

HTH,
M4



