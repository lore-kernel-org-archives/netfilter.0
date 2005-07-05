From: =?ISO-8859-1?Q?J=F6rg_Harmuth?= <harmuth@mnemon.de>
Subject: Re: Is anyone else getting these.
Date: Tue, 05 Jul 2005 10:59:46 +0200
Message-ID: <42CA4C02.8090404@mnemon.de>
References: <57F9959B46E0FA4D8BA88AEDFBE58290741F@pxtbenexd01.pxt.primeexalia.com>	<42C8FCC1.7030204@mnemon.de>
	<42C9802B.3000503@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42C9802B.3000503@riverviewtech.net>
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

Taylor, Grant schrieb:
> Yes, such a client side filter will prevent end users (us) from seeing
> such emails.  But being the email administrator (postmaster) that I am I
> feel that such a solution is a patch and a poor one at that.  Why don't
> we resolve the real problem, that being to remove the problem email
> address from the mail list.

I agree, but unfortunately I'm not in the position to do this and thus
just have to "live" with it...

Have a nice time,

Joerg

> 
> Grant. . . .
> 
> 
>> I suppose that everyone posting to the list gets this mail - at least I
>> get it ervery time. Like Jason already posted, adding
>>
>> :0
>> * From.*postmaster@echtzeit.com
>> /dev/null
>>
>> to my .procmailrc solved this and mekes me feel better :)
>>
>> Have a nice time,
>>
>> Joerg
> 
> 




