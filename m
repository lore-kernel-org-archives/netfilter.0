From: =?iso-8859-1?Q?Sven-=C5ke_Larsson?= <sven-ake.larsson@hiq.se>
Subject: SV: (no subject)
Date: Thu, 22 Jan 2004 20:06:43 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <IKEBLEEAACOIAKBCECDDIEBHCAAA.sven-ake.larsson@hiq.se>
References: <1074797166.4026.5.camel@ranjeet-pc2.zultys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1074797166.4026.5.camel@ranjeet-pc2.zultys.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: Ranjeet Shetye <ranjeet.shetye2@zultys.com>
Cc: 'netfilter list ' <netfilter@lists.netfilter.org>




>>On Wed, 2004-01-21 at 09:06, Sven-=C5ke Larsson wrote:
>> Hi all.
>>
>> I'm totally new to this list and I really tried to find an answer to my
>> question in the archives but with no success, so I'm sorry if I'm
repeating
>> the history.
>>
...Cut...
>>
>> Scrip start -------------------------
...Cut...
>> ------------------------- Script End

>The port 53 is used for DNS and is typically a UDP port being used. Your
>rule is a TCP rule. EVERY layer 4 protocol like TCP or UDP has a port
>number. You've only DROPped the TCP ports.
>
>also, how are you testing ? as in what makes you say that port 53 is
>"open" ?


Hi again,

I made a new script the day after, with a result I expected and wanted. I
was just frustrated enough to not understand what I was doing wrong.
Ranjeet (and Michael), Thanks for answering!

Regards,
Sven




