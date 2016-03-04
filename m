From: Harout Hedeshian <harout@hedeshian.net>
Subject: Re: Rewriting target IP and port on Linux with iptables or
 firewall-cmd
Date: Fri, 4 Mar 2016 16:06:54 -0700
Message-ID: <56DA150E.1020507@hedeshian.net>
References: <CAG8kwsqB_MPq5JX_yyw6+s4hZd5p=tfg=cN_MQ=fejD-7rQKoA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAG8kwsqB_MPq5JX_yyw6+s4hZd5p=tfg=cN_MQ=fejD-7rQKoA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Alex Barylo <abarylo@gmail.com>, netfilter@vger.kernel.org



On 03/04/2016 12:45 PM, Alex Barylo wrote:
> I see neither traffic to 10.x or to 216.x with tcpdump on the host in
> DC2 where I'm trying to rewrite.
Just to check the obvious, have you checked your FORWARD chain in the 
filter table to make sure you are not accidentally dropping it?
> A side question: is there a way for me to see how traffic moves
> between/through chains?
Yes. Take a look at the iptables trace target (there are a handful of 
tutorials out there).
Also, I would also suggest dumping iptables with the -v option, it will 
give you a match count of your rules. That way you can see if it is even 
matching at all.
> Any pointers are greatly appreciated.
>
> Thanks,
> Alex.
>
>


-- 
This message has been scanned for viruses and
dangerous content by MailScanner, and is
believed to be clean.

