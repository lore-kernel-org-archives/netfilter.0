From: Sven Schuster <schuster.sven@gmx.de>
Subject: Re: stop at ipq_read(h,buf,BUFFERSIZE,0)
Date: Tue, 02 Dec 2003 00:37:44 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3FCBD0C8.5010501@gmx.de>
References: <002201c3b860$ff1a9810$68892090@grouse>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <002201c3b860$ff1a9810$68892090@grouse>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Jee J.Z." <jz105@york.ac.uk>
Cc: netfilter@lists.netfilter.org


Hi Jee,

at first you need to

modprobe ip_queue

and then you need to add a rule like this:

iptables -A INPUT -j QUEUE

to queue packets to userspace. But take care to at first run the sample
program or modify the above rule to not queue every paket (e.g. only
tcp dest port 80), otherwise your box will completely lose network
connectivity because every packet would be queued to userspace but
due to the lack of a program processing it in userspace never be
returned...


HTH

Sven


Jee J.Z. wrote:

>Hi all,
>
>I try to run the example code on libipq man page. Unfortunately, the program
>stops at
>
>status = ipq_read(h,buf,BUFFERSIZE,0);
>
>It seems the program is waiting for packets input into the buffer, but
>packets never go in. Can anybody help me? Thank you in advance!
>
>Jee
>
>
>
>  
>


