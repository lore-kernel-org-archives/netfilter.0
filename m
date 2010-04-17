From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: can we design a modified fail2ban ?
Date: Sat, 17 Apr 2010 19:58:36 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1004171956030.10627@obet.zrqbmnf.qr>
References: <4BC7E028.8050209@infoservices.in> <alpine.LSU.2.01.1004160923230.31861@obet.zrqbmnf.qr> <4BC9DB51.6000407@tana.it>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4BC9DB51.6000407@tana.it>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alessandro Vesely <vesely@tana.it>
Cc: "J. Bakshi" <joydeep@infoservices.in>, netfilter@vger.kernel.org

On Saturday 2010-04-17 18:01, Alessandro Vesely wrote:
> On 16/Apr/10 09:28, Jan Engelhardt wrote:
>> On Friday 2010-04-16 05:57, J. Bakshi wrote:
>>>
>>> fail2ban is a popular application to prevent the brute-force attack
>>> against ssh and also against imap, pop3 etc.. But fail2ban actually
>>> blacklist the IP and this is what fail2ban has been designed for.
>>> Now a days [nowadays] we can design the same with iptables.
>>
>> fail2ban has the ability - if I read its own short description right - to
>> already use various blocking methods, including not only /etc/hosts.deny
>> but also iptables.
>
> I don't think it uses netfilter, though. I've read it has to restart a daemon
> in order to unlist an IP --not sure it's still so for the current version.

Better know than think.

N.B.: If what http://en.wikipedia.org/wiki/Fail2ban says is not
correct, by all means you should correct it.

Besides, if it is accurate, it uses iptables, not directly Netfilter.
