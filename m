From: Michele Petrazzo - Unipex srl <michele.petrazzo@unipex.it>
Subject: Re: Help me... please
Date: Sat, 02 Aug 2008 11:09:26 +0200
Message-ID: <48942446.30304@unipex.it>
References: <K4YU7P$3906019F62CB0933449DE713598EF00E@libero.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <K4YU7P$3906019F62CB0933449DE713598EF00E@libero.it>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "linuxmc@libero.it" <linuxmc@libero.it>
Cc: netfilter <netfilter@vger.kernel.org>

linuxmc@libero.it wrote:
> I have tried to remove de "-m state --state" but nothing change. I 
> have attached the section of the firewall log file with the defect. 
> Look to the first and to the last line.....
> 
> 

Would be better if you say us your ethernet flow: incoming ports and
outgoing, ip, etc...
Little suggestion (seem the same problem that happen to me): are you
trying to filter also the incoming data (the return one? If yes and if
that is dropped, pay attention that you cannot filter by mac address
since the firewall don't know which is the mac client to forward to the
data on the forward state, but only on the postrouting one. (but there is no
mac-destination on the mac match target!)

Michele
