From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: hi all
Date: Mon, 16 Oct 2006 13:57:39 +0200 (CEST)
Message-ID: <58531.193.173.147.3.1160999859.squirrel@webmail.sterenborg.info>
References: <20061015171523.3ac5ebe3@localhost>
	<20061016110201.58e06085@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20061016110201.58e06085@localhost>
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

On Mon, October 16, 2006 13:02, Alberto Negri wrote:
> On Sun, 15 Oct 2006 17:15:23 +0000
> Alberto Negri <negri@cs.unibo.it> wrote:
>
>
> any suggestions? am i wrong Mailing list? ping :) Alberto
>
>> hi all,
>>
>> i post here after spoke with people into #iptables irc channel in part=
icular
>> with "Taube". At the end of my problem explanation he suggested me to =
use a
>> script instead of iptables-{save,restore} commands, but reading iptabl=
es
>> tutorial in particular here:
>> http://iptables-tutorial.frozentux.net/iptables-tutorial.html#SAVEANDR=
ESTOR
>> E i get the advice to use iptables-{save,restore} instead of a bash
>> script...now i thought to post here... So now my problem:
>>
>> Using iptables-{save,restore} on a gentoo box iptables crashes at star=
t up.
>>  my error message(doing /etc/init.d/iptables start):

[Snip lots of info]

I thought that the main benefit of these script was speed when
saving/restoring rules (someone please correct me if I'm wrong). I don't =
think
your ruleset is big enough to notice the difference.

If you're having trouble using iptables-[save|restore] then you can creat=
e
your own script: it's just a matter of preference.


Gr,
Rob



