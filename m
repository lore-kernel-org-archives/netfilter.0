From: "Michael Frank" <mhf@linuxmail.org>
Subject: Re: Possible to block ports by user group?
Date: Mon, 05 Jul 2004 12:17:59 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <opsancv9xk4evsfm@smtp.pacific.net.th>
References: <opsal65hoe4evsfm@smtp.pacific.net.th> <200407041506.30874.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200407041506.30874.Antony@Soft-Solutions.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; format="flowed"; delsp="yes"; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Sun, 4 Jul 2004 15:06:30 +0100, Antony Stone <Antony@Soft-Solutions.co=
.uk> wrote:

> On Sunday 04 July 2004 2:16 pm, Michael Frank wrote:
>
>> Would like to block ports depending on the group in use
>
> I don't understand what you mean by "group" (well, I understand what yo=
u mean
> by it, but I don't understand where this is specified, or what it's
> associated with).
>
>> For example:
>>
>> group "browser" can only access port tcp 8118 so it _must_ talk throug=
h
>> privoxy
>>
>> group "wget" can access ports tcp 21 and 80
>>
>> group "trusted" can access all ports
>>
>> Searched and googled but could not find anything.
>>
>> How can this be done?
>
> Where / how are these groups defined?   What identifies a PC as being p=
art of
> a specific group?

Linux machine user group or user id.

	Regards
	Michael

